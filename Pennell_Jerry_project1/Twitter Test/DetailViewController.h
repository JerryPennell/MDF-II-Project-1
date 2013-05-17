//
//  DetailViewController.h
//  TwitterApp
//
//  Created by Wayne Pennell on 5/8/13.
//  Copyright (c) 2013 Wayne Pennell. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController {
    IBOutlet UIImageView *profileImage;
    IBOutlet UILabel *nameLabel;
    IBOutlet UILabel *tweetLabel;
    IBOutlet UILabel *numFollowersLabel;
    IBOutlet UILabel *numFriendsLabel;
    IBOutlet UILabel *detailDateLabel;
    
}

@property (strong, nonatomic) id detailItem;

@property (strong, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

- (IBAction)callFriendsController:(id)sender;

@end
