//
//  CustomCollectionCellView.m
//  collectionViewTest
//
//  Created by Wayne Pennell on 5/13/13.
//  Copyright (c) 2013 Wayne Pennell. All rights reserved.
//

#import "CustomCollectionCellView.h"
#import "FriendDetailViewController.h"

@interface CustomCollectionCellView ()
- (void)configureView;
@end

@implementation CustomCollectionCellView
@synthesize backgroundImageView = _backgroundImageView;

@synthesize detailItemFriend = _detailItemFriend;
@synthesize detailDescriptionLabelFriend = _detailDescriptionLabelFriend;

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItemFriend != newDetailItem) {
        _detailItemFriend = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}


- (void)configureView
{
    if (self.detailItemFriend) {
        NSDictionary *tweet = self.detailItemFriend;
        
        
        //Configures labels for Detail view
        
        NSString *screenName = [[tweet objectForKey:@"user"] objectForKey:@"screen_name"];
       // NSString *name = [tweet objectForKey:@"text"];

        
        [title setLineBreakMode:NSLineBreakByWordWrapping];
        title.numberOfLines = 0;
        
        title.text = screenName;
            
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            NSString *imageUrl = [[tweet objectForKey:@"user"] objectForKey:@"profile_image_url_https"];
            NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:imageUrl]];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                backgroundImageView.image = [UIImage imageWithData:data];
            });
        });
    }
}


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect
 {
 // Drawing code
 }
 */

-(void) refreshCellData: (UIImage*) image titleString:(NSString*)titleString
{
    backgroundImageView.image = image;
    title.text = titleString;
}






@end
