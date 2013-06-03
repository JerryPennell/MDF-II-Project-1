//
//  Theater.m
//  MDFII-Week4
//
//  Created by Jerry Pennell on 05/26/13.
//  Copyright (c) 2013 Jerry Pennell. All rights reserved.
//

#import "Theater.h"

@implementation Theater

+ (Theater*)theaterWithName:(NSString*)name location:(NSString*)location andImage:(UIImage*)image
{
    Theater* theater = nil;
    
    theater = [[Theater alloc] init];
    if (theater) {
        theater.theaterName     = name;
        theater.theaterLocation = location;
        theater.theaterImage    = image;
    }
    
    return theater;
}

@end
