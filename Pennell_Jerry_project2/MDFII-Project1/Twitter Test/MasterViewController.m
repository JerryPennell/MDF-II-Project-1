//
//  MasterViewController.m
//  TwitterApp
//
//  Created by Wayne Pennell on 5/8/13.
//  Copyright (c) 2013 Wayne Pennell. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import <Accounts/Accounts.h>
#import <Social/Social.h>

const NSString *TWITTER_CREATED_AT_JSON_KEY = @"created_at";

@implementation MasterViewController



- (void)awakeFromNib
{
    [super awakeFromNib];
}

-(void)addFooter
{
    UIView* footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 500)];
    self.tableView.tableFooterView = footerView;
    [self.tableView setSeparatorStyle:(UITableViewCellSeparatorStyleNone)];
    [self.tableView setContentInset:(UIEdgeInsetsMake(0, 0, -500, 0))];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self getTwitterTimeline];
}

- (void)getTwitterTimeline {
    ACAccountStore *accountStore = [[ACAccountStore alloc] init];
    if(accountStore != nil)
    {
        
        ACAccountType *accountType = [accountStore  accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierTwitter];
        if (accountType != nil)
        {
            [accountStore requestAccessToAccountsWithType:accountType options:nil completion:^(BOOL granted, NSError *
                                                                                               error){
                
                if (granted)
                {
                    NSArray *twitterAccounts = [accountStore accountsWithAccountType:accountType];
                    if(twitterAccounts != nil)
                    {
                        //NSLog(@"%@", [twitterAccounts description]);
                        ACAccount *currentAccount = [twitterAccounts  objectAtIndex:0];
                        if (currentAccount != nil)
                        {
                            
                            NSString *userTimeString = @"https://api.twitter.com/1.1/statuses/user_timeline.json";
                            
                            
                            NSMutableDictionary *parameters = [[NSMutableDictionary alloc] init];
                            [parameters setObject:@"100" forKey:@"count"];
                            [parameters setObject:@"1" forKey:@"include_entities"];
                            
                            SLRequest *request = [SLRequest requestForServiceType:SLServiceTypeTwitter requestMethod:SLRequestMethodGET URL:[NSURL URLWithString:userTimeString] parameters:parameters];
                            
                            
                            if (request != nil)
                            {
                                //1.1 api requires a user to be logged in
                                [request setAccount:currentAccount];
                                
                                [request performRequestWithHandler:^(NSData *responseData, NSHTTPURLResponse *urlResponse,
                                                                     NSError *error) {
                                    NSInteger responseCode = [urlResponse statusCode];
                                    if (responseCode == 200)
                                    {
                                        tweets = [NSJSONSerialization JSONObjectWithData:responseData options:0 error:nil];
                                        if (tweets != nil)
                                        {
                                            NSLog(@"%@", [tweets description]);
                                            [self fetchTweets];
                                            NSLog(@"Done.");
                                            
                                        }
                                    }
                                }];
                            }
                        }
                    }
                }
                else
                {
                    NSLog(@"User did not grant access");
                }
            }];
        }
    }

}

#pragma mark -
#pragma mark Actions

//Refreshing tweets

- (IBAction)requestTimeline:(id)sender {
    
    alertView = [[UIAlertView alloc] initWithTitle:@"Refreshing Tweets"
                                           message:@"\n"
                                          delegate:self
                                 cancelButtonTitle:nil
                                 otherButtonTitles:nil];
    
    UIActivityIndicatorView *spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    spinner.center = CGPointMake(139.5, 75.5); // .5 so it doesn't blur
    [alertView addSubview:spinner];
    [spinner startAnimating];
    [alertView show];
    
    [alertView dismissWithClickedButtonIndex:0 animated:YES];
    
   //Reloading tweets for timeline
    
   [self getTwitterTimeline];
}

//Fetching the tweets for the timeline

- (void)fetchTweets
{
    NSLog(@"Fetching Tweets....");
    [self.tableView setHidden:YES];
    [self.activityIndicatorView startAnimating];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{

        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
            [self.tableView setHidden:NO];
            [self.activityIndicatorView stopAnimating];
        });
    });
    
    if (loader != nil){
        [loader setHidden:YES];
        [loader removeFromSuperview];
        [loader setFrame:CGRectMake(0, 0, 0, 0)];
        [self addFooter];
        
    }
}



- (void)sharingStatus {
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter]) {
        NSLog(@"service available");
        self.twitterCallButton.enabled = YES;
        self.twitterCallButton.alpha = 1.0f;
    } else {
        self.twitterCallButton.enabled = NO;
        self.twitterCallButton.alpha = 0.5f;
    }
}

//SLComposeViewController - for adding tweet

- (IBAction)twitterPost:(id)sender {
    
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter]) {
        
        SLComposeViewController *mySLComposerSheet = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
        
        [mySLComposerSheet setInitialText:@"Posted from "];
        
        [mySLComposerSheet addImage:[UIImage imageNamed:@"myImage.png"]];
        
        [mySLComposerSheet addURL:[NSURL URLWithString:@"http://www.fullsail.edu"]];
        
        mySLComposerSheet.completionHandler = ^(SLComposeViewControllerResult result) {
            switch(result) {
                    //  This means the user cancelled without sending the Tweet
                case SLComposeViewControllerResultCancelled:
                    break;
                    //  This means the user hit 'Send'
                case SLComposeViewControllerResultDone:
                    break;
            }
            
            //  dismiss the Tweet Sheet
            dispatch_async(dispatch_get_main_queue(), ^{
                [self dismissViewControllerAnimated:NO completion:^{
                    NSLog(@"Tweet Sheet has been dismissed.");
                }];
            });
        };
        
        
        
        [self presentViewController:mySLComposerSheet animated:YES completion:nil];
    }
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return tweets.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"TweetCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    NSDictionary *tweet = [tweets objectAtIndex:indexPath.row];    
    NSString *text = [tweet objectForKey:@"text"];
    NSString *date = [tweet objectForKey:TWITTER_CREATED_AT_JSON_KEY];
    NSString *imageUrl = [[tweet objectForKey:@"user"] objectForKey:@"profile_image_url"];
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:imageUrl]];
    
    cell.textLabel.text = text;
    cell.imageView.image = [UIImage imageNamed:@"placeholder"];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"Created At: %@", [self formatTwitterDateTime:date]];
    cell.imageView.image = [UIImage imageWithData:data];
    
    return cell;
}

- (NSString*)formatTwitterDateTime:(NSString *)format
{
    NSString *dateStr = format;
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    
    [dateFormat setDateFormat:@"EEE MMM d HH:mm:ss Z y"];
    
    NSDate *date = [dateFormat dateFromString:dateStr];
    
    // Convert date object to desired output format
    [dateFormat setDateFormat:@"eee, dd MMM yyyy HH:mm:ss"];
    
    dateStr = [dateFormat stringFromDate:date];
    
    return dateStr;
}



- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(sharingStatus) name:ACAccountStoreDidChangeNotification object:nil];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:ACAccountStoreDidChangeNotification];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source.
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"showTweet"]) {
        
        NSInteger row = [[self tableView].indexPathForSelectedRow row];
        NSDictionary *tweet = [tweets objectAtIndex:row];
        
        DetailViewController *detailController = segue.destinationViewController;
        detailController.detailItem = tweet;
    }
}


@end
