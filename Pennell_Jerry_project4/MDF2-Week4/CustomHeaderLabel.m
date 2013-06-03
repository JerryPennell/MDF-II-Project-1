//
//  CustomHeaderLabel.m
//  MDFII-Week4
//
//  Created by Jerry Pennell on 05/26/13.
//  Copyright (c) 2013 Jerry Pennell. All rights reserved.
//

#import "CustomHeaderLabel.h"

@implementation CustomHeaderLabel

@synthesize theatreLocation, theatreName, theatreImage;

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

@end
