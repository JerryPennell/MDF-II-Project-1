//
//  VideoCaptureController.h
//  MDF2_Week3
//
//  Created by Jerry Pennell on 5/21/13.
//  Copyright (c) 2013 Jerry Pennell. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VideoCaptureController : UIViewController
{
    IBOutlet UITextView *videoURLView;
    
    NSDictionary *mediaInfo;
}

- (IBAction)onClick:(id)sender;

@property (nonatomic, strong) NSDictionary *mediaInfo;

@end
