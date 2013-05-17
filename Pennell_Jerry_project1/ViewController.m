//
//  ViewController.m
//  collectionViewTest
//
//  Created by Wayne Pennell on 5/13/13.
//  Copyright (c) 2013 Wayne Pennell. All rights reserved.
//

#import "ViewController.h"
#import "CustomCollectionCellView.h"
#import <Accounts/Accounts.h>
#import <Social/Social.h>

@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad
{

    
    UINib *nib = [UINib nibWithNibName:@"CustomCollectionCellView" bundle:nil];
    if (nib !=nil)
    {
        [theCollectionView registerNib:nib forCellWithReuseIdentifier:@"customCell"];
    }
    [super viewDidLoad];
    [self getFriendsWithImages];
	// Do any additional setup after loading the view, typically from a nib.
}


- (void)getFriendsWithImages {
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
                    NSArray *twitterFriendAccounts = [accountStore accountsWithAccountType:accountType];
                    if(twitterFriendAccounts != nil)
                    {
                       // NSLog(@"%@", [twitterFriendAccounts description]);
                        ACAccount *currentAccount = [twitterFriendAccounts  objectAtIndex:0];
                        if (currentAccount != nil)
                        {
                            
                            NSString *userTimeString = @"https://api.twitter.com/1.1/friends/list.json";
                            
                            
                            NSMutableDictionary *parameters = [[NSMutableDictionary alloc] init];
                            [parameters setObject:@"20" forKey:@"count"];
                            [parameters setObject:@"false" forKey:@"include_user_entities"];
                            [parameters setObject:@"true" forKey:@"skip_status"];
                            
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
                                        tweetsFriends = [NSJSONSerialization JSONObjectWithData:responseData options:0 error:nil];
                                        if (tweetsFriends != nil)
                                        {
                                            NSLog(@"%@", [tweetsFriends description]);
                                            [self fetchFriends];
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

- (void) fetchFriends
{
    NSLog(@"Fetching Friends....");
   // [self.collectionView setHidden:YES];
   // [self.activityIndicatorView startAnimating];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        
        dispatch_async(dispatch_get_main_queue(), ^{
//            [self.tableView reloadData];
//            [self.tableView setHidden:NO];
//            [self.activityIndicatorView stopAnimating];
        });
    });
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 20;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
//    static NSString *identifier = @"customCell";
//    
//    UICollectionViewCell *cell = [theCollectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
//    
//    
//    UIImageView *tweetImageView = (UIImageView *)[cell viewWithTag:100];
//    
//     tweetImageView.image = [UIImage imageNamed:[tweetsFriends objectAtIndex:indexPath.row]];
    
    
    CustomCollectionCellView *cell = [theCollectionView dequeueReusableCellWithReuseIdentifier:@"customCell" forIndexPath:indexPath];
    
    if(cell != nil)
    {
        NSString *imageName = [NSString stringWithFormat:@"img%d", ((indexPath.row % 2) +1)];
        [cell refreshCellData:[UIImage imageNamed:imageName] titleString:[NSString stringWithFormat:@"cell %d", indexPath.row]];
    }
    
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(cellTapped:)];
    singleTap.numberOfTapsRequired = 1;
    singleTap.numberOfTouchesRequired = 1;
    [cell addGestureRecognizer:singleTap];
    [cell setUserInteractionEnabled:YES];
    
    return cell;
    
}

- (void)cellTapped:(UIGestureRecognizer *)gestureRecognizer {
    
    NSArray *subviewArray = [[NSBundle mainBundle] loadNibNamed:@"FriendDetailViewController" owner:self options:nil];
    UIView *mainView = [subviewArray objectAtIndex:0];
   // [self addSubview:mainView];
   
}



- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    //Alt row size
//    if ((indexPath.row % 2)){
//        return CGSizeMake(100.0f, 100.0f);
//    }
    return CGSizeMake(100.0f, 100.0f);
}



@end
