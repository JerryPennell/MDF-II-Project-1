//
//  alertViewClass.h
//  MDF2_Week3
//
//  Created by Jerry Pennell on 5/21/13.
//  Copyright (c) 2013 Jerry Pennell. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface alertViewClass : UIViewController

+ (void)showAlertWithMessage:(NSString *)title message:(NSString *)message confirmText:(NSString *)confirm cancelText:(NSString *)cancel;

@end
