//
//  ViewController.h
//  MDF2_Week3
//
//  Created by Jerry Pennell on 5/21/13.
//  Copyright (c) 2013 Jerry Pennell. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>
{
    int captureMode;
    NSDictionary *infoDict;
}

- (void)capturePhotoAndVideo:(int)captureType;
- (IBAction)onClick:(id)sender;

@end
