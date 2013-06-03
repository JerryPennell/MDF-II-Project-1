//
//  CustomHeaderLabel.h
//  MDFII-Week4
//
//  Created by Jerry Pennell on 05/26/13.
//  Copyright (c) 2013 Jerry Pennell. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomHeaderLabel : UIView
{
    IBOutlet UILabel *theatreName;
    IBOutlet UILabel *theatreLocation;
    IBOutlet UIImageView *theatreImage;
}

@property (nonatomic, strong) UILabel *theatreName;
@property (nonatomic, strong) UILabel *theatreLocation;
@property (nonatomic, strong) UIImageView *theatreImage;

@end
