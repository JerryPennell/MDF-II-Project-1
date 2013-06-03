//
//  Movie.h
//  MDFII-Week4
//
//  Created by Jerry Pennell on 05/26/13.
//  Copyright (c) 2013 Jerry Pennell. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Theater.h"

@interface Movie : NSObject

@property (nonatomic, strong) NSString* movieName;
@property (nonatomic, strong) NSArray*  movieShowTimes;
@property (nonatomic, strong) NSString* movieImage;
@property (nonatomic, strong) NSURL*    movieTrailer;
@property (nonatomic, strong) Theater*  movieTheater;

+ (Movie*)movieWithName:(NSString*)name
              showTimes:(NSArray*)showTimes
                  image:(NSString*)image
             trailerURL:(NSURL*)trailerURL
             andTheater:(Theater*)theater;

+ (NSArray*)theatersForMovies:(NSArray*)movies;
+ (NSArray*)moviesForTheater:(Theater*)theater fromMovies:(NSArray*)movies;
- (NSString*)allShowtimes;

@end
