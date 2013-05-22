//
//  MasterViewController.h
//  TwitterApp
//
//  Created by Wayne Pennell on 5/8/13.
//  Copyright (c) 2013 Wayne Pennell. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MasterViewController : UITableViewController {
    NSArray *tweets;
    UIAlertView *alertView;
    IBOutlet UIView *loader;
    
    __weak UIActivityIndicatorView *_activityIndicatorView;
}


//Exposed methods
- (void)fetchTweets;
- (NSString*)formatTwitterDateTime:(NSString *)format;

@property (nonatomic, weak) IBOutlet UIActivityIndicatorView *activityIndicatorView;

- (IBAction)requestTimeline:(id)sender;

//Twitter post button
@property (weak, nonatomic) IBOutlet UIButton *twitterCallButton;
- (IBAction)twitterPost:(id)sender;
- (void)sharingStatus;


@end
