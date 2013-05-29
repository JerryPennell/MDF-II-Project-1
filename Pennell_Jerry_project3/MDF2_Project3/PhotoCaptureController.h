//
//  PhotoCaptureController.h
//  MDF2_Week3
//
//  Created by Jerry Pennell on 5/21/13.
//  Copyright (c) 2013 Jerry Pennell. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoCaptureController : UIViewController
{
    IBOutlet UIImageView *originalImageView;
    IBOutlet UIImageView *scaledImageView;

    NSDictionary *mediaInfo;
    UIImage *originalImage;
    UIImage *scaledImage;
    NSMutableArray *saveLog;
    
    int didBothImagesSaveYet;
}

- (IBAction)onClick:(id)sender;

@property (nonatomic, strong) NSDictionary *mediaInfo;

@end
