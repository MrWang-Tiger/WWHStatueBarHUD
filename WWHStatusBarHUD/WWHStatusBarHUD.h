//
//  WWHStatusBarHUD.h
//  wwh
//
//  Created by 王伟虎 on 16/5/27.
//  Copyright © 2016年 wwh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WWHStatusBarHUD : NSObject
/**
 *  show a paragraph only
 *
 *  @param message  the sting that your wants to show
 */
+ (void)wwh_showMessage:(NSString *)message;
/**
 *  show a paragraph with a picture so as to prompt user success
 *
 *  @param message  the sting that your wants to show
 *  @param message  a picture that your wants to show
 */
+ (void)wwh_showSuccess:(NSString *)message;
/**
 *  show a paragraph with a picture so as to prompt user failure
 *
 *  @param message  the sting that your wants to show
 *  @param message  a picture that your wants to show
 */
+ (void)wwh_showFailure:(NSString *)message;
/**
 *  show a paragraph with a activityIndicator so as to prompt user net busy
 *
 *  @param message  the sting that your wants to show
 *  @param message  a picture that your wants to show
 */
+ (void)wwh_showWatting:(NSString *)message;
/**
 *  show a paragraph with a picture so as to prompt user someing happen
 *
 *  @param message  the sting that your wants to show
 *  @param message  a picture that your wants to show
 */
+ (void)wwh_showMessage:(NSString *)message image:(UIImage *)image;
/**
 *  hide hud
 */
+ (void)wwh_hide;

@end
