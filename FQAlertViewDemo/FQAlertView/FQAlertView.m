//
//  FQAlertView.m
//  FQAlertViewDemo
//
//  Created by 奉强 on 16/9/11.
//  Copyright © 2016年 奉强. All rights reserved.
//

#import "FQAlertView.h"
#import "NSBundle+FQAlertView.h"
#import "FQAlertCenterView.h"

#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height

@interface FQAlertView ()

@property (nonatomic, strong) UIWindow *window;

@property (nonatomic, strong) UIView *backShadowView;

@end

@implementation FQAlertView

#pragma mark - Init
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self commentInit];
    }
    
    return self;
}

- (void)commentInit {
    [self buildViews];
}

#pragma mark - Get
- (UIWindow *)window {
    if (!_window) {
        _window = [UIWindow new];
        _window.windowLevel = UIWindowLevelAlert;
        _window.hidden = YES;
        _window.frame = [UIScreen mainScreen].bounds;
        _window.backgroundColor = [UIColor clearColor];
    }
    
    return _window;
}

- (UIView *)backShadowView {
    if (!_backShadowView) {
        _backShadowView = [UIView new];
        _backShadowView.backgroundColor = [UIColor blackColor];
        _backShadowView.alpha = .3f;
        _backShadowView.frame = [UIScreen mainScreen].bounds;
    }
    
    return _backShadowView;
}

#pragma mark - Views
- (void)buildViews {
    FQAlertCenterView *alertCenterView = [FQAlertCenterView new];
    alertCenterView.center = CGPointMake(WIDTH/2, HEIGHT/2);
    [self addSubview:alertCenterView];
}

#pragma mark - API
- (void)showWithAnimation:(BOOL)animation {
    self.window.hidden = NO;
    [self insertSubview:self.backShadowView atIndex:0];
    [self.window addSubview:self];
}


@end
