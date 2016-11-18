//
//  FQPlaceholdViewController.m
//  FQAlertViewDemo
//
//  Created by 奉强 on 2016/11/18.
//  Copyright © 2016年 奉强. All rights reserved.
//

#import "FQPlaceholdViewController.h"

@interface FQPlaceholdViewController ()

@end

@implementation FQPlaceholdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor clearColor];
    self.view.hidden = YES;
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    UIViewController *rootViewController = [UIApplication sharedApplication].keyWindow.rootViewController;
    
    if ([rootViewController isKindOfClass:[UINavigationController class]]) {
        return [(UINavigationController *)rootViewController visibleViewController].preferredStatusBarStyle;
    }
    else if ([rootViewController isKindOfClass:[UITabBarController class]]) {
        return [(UITabBarController *)rootViewController selectedViewController].preferredStatusBarStyle;
    }
    else {
        return rootViewController.preferredStatusBarStyle;
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
