//
//  Theater.h
//  MDFII-Week4
//
//  Created by Jerry Pennell on 05/26/13.
//  Copyright (c) 2013 Jerry Pennell. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Theater : NSObject

@property (nonatomic, strong) NSString* theaterName;
@property (nonatomic, strong) NSString* theaterLocation;
@property (nonatomic, strong) UIImage* theaterImage;

+ (Theater*)theaterWithName:(NSString*)name location:(NSString*)location andImage:(UIImage*)image;

@end
