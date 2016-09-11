//
//  FQAlertCenterView.m
//  FQAlertViewDemo
//
//  Created by 奉强 on 16/9/11.
//  Copyright © 2016年 奉强. All rights reserved.
//

#import "FQAlertCenterView.h"
#import "NSBundle+FQAlertView.h"

#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height

@implementation FQAlertCenterView

#pragma mark - Init
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self commentInit];
    }
    
    return self;
}

- (void)commentInit {
    // 560*370
    CGFloat width = WIDTH-60;
    CGFloat height = width/560.f*370.f;
    self.frame = CGRectMake(0, 0, WIDTH-60, height);
    
    [self creatBgImageView];
}

#pragma mark - Views
- (void)creatBgImageView {
    UIImageView *bgImageView = [UIImageView new];
    bgImageView.frame = self.bounds;
    bgImageView.image = [NSBundle fq_alertViewBundleImageForName:@"FQAlertBg"];
    [self addSubview:bgImageView];
}

@end
