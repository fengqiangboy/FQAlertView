//
//  ViewController.m
//  FQAlertViewDemo
//
//  Created by 奉强 on 16/9/11.
//  Copyright © 2016年 奉强. All rights reserved.
//

#import "ViewController.h"
#import "FQAlertView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (IBAction)btnClick:(id)sender {
    [FQAlertView showAlertViewWithType:FQAlertViewTypeTick message:@"提示个什么东西来测试测试呢，这个是个问题" sureTitle:@"确认" cancelTiele:@"取消" handleBlock:^(FQAlertViewClickType clickType, UIButton *btn) {
        NSLog(@"乱点");
    }];
}


@end
