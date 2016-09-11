//
//  NSBundle+FQAlertView.h
//  FQAlertViewDemo
//
//  Created by 奉强 on 16/9/11.
//  Copyright © 2016年 奉强. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UIImage;

@interface NSBundle (FQAlertView)

+ (instancetype)fq_alertViewBundle;

+ (UIImage *)fq_alertViewBundleImageForName:(NSString *)name;

@end
