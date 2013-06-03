//
//  MovieViewController.m
//  MDFII-Week4
//
//  Created by Jerry Pennell on 05/26/13.
//  Copyright (c) 2013 Jerry Pennell. All rights reserved.
//

#import "MovieViewController.h"

@interface MovieViewController ()

@property (nonatomic, strong) MPMoviePlayerController* moviePlayer;

@end

@implementation MovieViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    
    [super viewDidLoad];
     

}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)showUnexpectedErrorDialog {
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Sorry!"
                                                    message:@"An unexpected error has occurred. Please try again."
                                                   delegate:nil
                                          cancelButtonTitle:@"Ok"
                                          otherButtonTitles:nil];
    [alert show];

}


-(IBAction)onClick:(id)sender
{
    UIButton *btn = (UIButton *)sender;
    
    if (btn)
    {
       if (btn.tag == 1)
        {
            // stop the video from playing
            if (self.moviePlayer)
            {
                [self.moviePlayer stop];
            }
        }
        else if (btn.tag == 2)
        {
            
            // initialize the moviePlayer with the movie URL
            self.moviePlayer = [[MPMoviePlayerController alloc] initWithContentURL:self.movieURL];
            
            
            if (self.moviePlayer)
            {
                // add the movie player view as the movieView subView
                [self.view addSubview:self.moviePlayer.view];
                
                CGRect viewFrame = self.view.frame;
                viewFrame.origin.y -= 64;
                
                self.moviePlayer.view.frame = viewFrame;
                
                // set the movieplayer defaults
                self.moviePlayer.fullscreen = NO;
                self.moviePlayer.controlStyle = MPMovieControlStyleNone;
                
                // play the video from the passed in URL in the movie player
                [self.moviePlayer play];
                
                // pause the video for loading; will resume when the notification is hit
                [self.moviePlayer pause];

            } else {
                [self showUnexpectedErrorDialog];
            }
        
        }
    }
}


@end
