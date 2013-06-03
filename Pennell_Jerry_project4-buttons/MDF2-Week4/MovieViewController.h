//
//  MovieViewController.h
//  MDFII-Week4
//
//  Created by Jerry Pennell on 05/26/13.
//  Copyright (c) 2013 Jerry Pennell. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>


@interface MovieViewController : UIViewController
{
    UIAlertView *loadingIndicator;
}

@property (nonatomic, strong) NSURL* movieURL;


@end
