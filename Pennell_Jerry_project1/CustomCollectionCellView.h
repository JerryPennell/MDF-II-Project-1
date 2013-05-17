//
//  CustomCollectionCellView.h
//  collectionViewTest
//
//  Created by Wayne Pennell on 5/13/13.
//  Copyright (c) 2013 Wayne Pennell. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCollectionCellView : UICollectionViewCell
{
    IBOutlet UIImageView *backgroundImageView;
    
    
    IBOutlet UILabel *title;
}

@property (strong, nonatomic) id detailItemFriend;
@property (strong, nonatomic) IBOutlet UILabel *detailDescriptionLabelFriend;

@property (nonatomic, retain) IBOutlet UIImageView *backgroundImageView;
@property UIView *FriendDetailView;

-(void) refreshCellData: (UIImage*) image titleString:(NSString*)titleString;


@end



