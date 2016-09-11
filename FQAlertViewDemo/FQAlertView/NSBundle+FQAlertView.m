//
//  NSBundle+FQAlertView.m
//  FQAlertViewDemo
//
//  Created by 奉强 on 16/9/11.
//  Copyright © 2016年 奉强. All rights reserved.
//

#import "NSBundle+FQAlertView.h"
#import "FQAlertView.h"

@implementation NSBundle (FQAlertView)

+ (instancetype)fq_alertViewBundle {
    static NSBundle *alertViewBundle = nil;
    if (alertViewBundle == nil) {
        // 这里不使用mainBundle是为了适配pod 1.x和0.x
        alertViewBundle = [NSBundle bundleWithPath:[[NSBundle bundleForClass:[FQAlertView class]] pathForResource:@"FQAlertView" ofType:@"bundle"]];
    }
    return alertViewBundle;
}

+ (UIImage *)fq_alertViewBundleImageForName:(NSString *)name {
    return [UIImage imageWithContentsOfFile:[[self fq_alertViewBundle] pathForResource:name ofType:@"png"]];
}



@end
