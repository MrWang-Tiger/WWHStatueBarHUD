//
//  ViewController.m
//  WWHStatusBarHUDDemo
//
//  Created by 王伟虎 on 16/5/27.
//  Copyright © 2016年 wwh. All rights reserved.
//

#import "ViewController.h"
#import "WWHStatusBarHUD.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [WWHStatusBarHUD wwh_showSuccess:@"加载成功了哦"];
}
@end
