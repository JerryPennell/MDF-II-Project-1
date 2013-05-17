//
//  DetailViewController.m
//  TwitterApp
//
//  Created by Wayne Pennell on 5/8/13.
//  Copyright (c) 2013 Wayne Pennell. All rights reserved.
//

#import "DetailViewController.h"
#import "MasterViewController.h"
#import "ViewController.h"

@interface DetailViewController ()
- (void)configureView;
@end

@implementation DetailViewController

@synthesize detailItem = _detailItem;
@synthesize detailDescriptionLabel = _detailDescriptionLabel;

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
    if (self.detailItem) {
        NSDictionary *tweet = self.detailItem;
        
        
        //Configures labels for Detail view
        
        NSString *text = [[tweet objectForKey:@"user"] objectForKey:@"name"];
        NSString *name = [tweet objectForKey:@"text"];
        NSString *friends = [NSString stringWithFormat:@"%@",[[tweet objectForKey:@"user"] objectForKey:@"friends_count"]];
        NSString *followers = [NSString stringWithFormat:@"%@",[[tweet objectForKey:@"user"] objectForKey:@"followers_count"]];
        
        MasterViewController *masterView = [[MasterViewController alloc] init];
        
        NSString *date = [tweet objectForKey:@"created_at"];
        
        [tweetLabel setLineBreakMode:NSLineBreakByWordWrapping];
        tweetLabel.numberOfLines = 0;

        nameLabel.text = text;
        tweetLabel.text = name;
        numFollowersLabel.text = friends;
        numFriendsLabel.text = followers;
        detailDateLabel.text = [NSString stringWithFormat:@"Created At: %@", [masterView formatTwitterDateTime:date]];;
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            NSString *imageUrl = [[tweet objectForKey:@"user"] objectForKey:@"profile_image_url"];
            NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:imageUrl]];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                profileImage.image = [UIImage imageWithData:data];
            });
        });
    }
}
#pragma mark -
#pragma mark Actions

- (IBAction)callFriendsController:(id)sender
{
    ViewController *myNewVC = [[ViewController alloc] initWithNibName:@"ViewController" bundle:nil];
    
    
    // Setting setup for friends controller
    
 //   [self presentViewController:myNewVC animated:YES completion:nil];
    

    [self.navigationController pushViewController:myNewVC animated:YES];

    
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
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
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
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
