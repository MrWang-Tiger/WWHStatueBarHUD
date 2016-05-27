//
//  WWHStatusBarHUD.m
//  wwh
//
//  Created by 王伟虎 on 16/5/27.
//  Copyright © 2016年 wwh. All rights reserved.
//

#import "WWHStatusBarHUD.h"

static const CGFloat kShowWindowDuration = 0.2f;
static const CGFloat kHideWindowDuration = 1.0f;
static const CGFloat kWindowHeight       = 20.0f;

@implementation WWHStatusBarHUD

static UIWindow *window_;
static NSTimer  *timer_;

#pragma mark - private methods

+ (void)createWindow {
    
    window_.hidden = YES;
    [self stopTimer];
    
    window_ = [[UIWindow alloc] initWithFrame:CGRectMake(0, -kWindowHeight, [UIScreen mainScreen].bounds.size.width, kWindowHeight)];
    window_.backgroundColor = [UIColor blackColor];
    window_.windowLevel = UIWindowLevelAlert;
    window_.hidden = NO;
    
    [UIView animateWithDuration:kShowWindowDuration animations:^{
        CGRect frame = window_.frame;
        frame.origin.y = 0;
        window_.frame = frame;
    }];
    
    timer_ = [NSTimer timerWithTimeInterval:kHideWindowDuration target:self selector:@selector(wwh_hide) userInfo:nil repeats:nil];
    [[NSRunLoop mainRunLoop] addTimer:timer_ forMode:NSRunLoopCommonModes];
}

+ (void)stopTimer {
    [timer_ invalidate];
    timer_  = nil;
}

#pragma mark - public methods

+ (void)wwh_showMessage:(NSString *)message image:(UIImage *)image {
    
    [self createWindow];
    
    UIButton *label = [[UIButton alloc] initWithFrame:window_.bounds];
    [label setTitle:message forState:UIControlStateNormal];
    [label setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    label.titleLabel.font = [UIFont systemFontOfSize:12];
    if (image != nil) {
        label.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        [label setImage:image forState:UIControlStateNormal];
    }
    [window_ addSubview:label];
}

+ (void)wwh_showMessage:(NSString *)message {
    
    [self wwh_showMessage:message image:nil];
}

+ (void)wwh_showSuccess:(NSString *)message {
    
    [self wwh_showMessage:message image:[UIImage imageNamed:@"WWHStatusBarHUD.bundle/success"]];
}

+ (void)wwh_showFailure:(NSString *)message {
    
    [self wwh_showMessage:message image:[UIImage imageNamed:@"WWHStatusBarHUD.bundle/error"]];
}

+ (void)wwh_showWatting:(NSString *)message {
    
    [self wwh_showMessage:message image:nil];
    [self stopTimer];
    
    CGSize size = [message sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12]}];
    UIActivityIndicatorView *view = [[UIActivityIndicatorView alloc] init];
    view.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhite;
    view.center = CGPointMake(([UIScreen mainScreen].bounds.size.width - size.width)/2.0 - 20, 10);
    [view startAnimating];
    [window_ addSubview:view];
}

+ (void)wwh_hide {
    
    [UIView animateWithDuration:kShowWindowDuration animations:^{
        CGRect frame = window_.frame;
        frame.origin.y = -kWindowHeight;
        window_.frame = frame;
    } completion:^(BOOL finished) {
        window_ = nil;
        [self stopTimer];
    }];
}

@end
