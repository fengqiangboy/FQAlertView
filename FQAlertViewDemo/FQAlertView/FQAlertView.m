//
//  FQAlertView.m
//  FQAlertViewDemo
//
//  Created by 奉强 on 16/9/11.
//  Copyright © 2016年 奉强. All rights reserved.
//

#import "FQAlertView.h"
#import "NSBundle+FQAlertView.h"

#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height

@interface FQAlertView () <FQAlertCenterViewDelegate>

@property (nonatomic, strong) UIWindow *window;

@property (nonatomic, strong) UIView *backShadowView;

@property (nonatomic, strong) FQAlertCenterView *alertCenterView;

@end

@implementation FQAlertView

#pragma mark - Init
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
//        NSLog(@"%ld", (long)[UIApplication sharedApplication].statusBarStyle);
//        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
        
        [self commentInit];
    }
    
    return self;
}

- (void)commentInit {
    self.frame = [UIScreen mainScreen].bounds;
    [self buildViews];
}

#pragma mark - Get
- (UIWindow *)window {
    if (!_window) {
        _window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        _window.windowLevel = UIWindowLevelAlert;
        _window.hidden = YES;
        _window.frame = [UIScreen mainScreen].bounds;
        _window.backgroundColor = [UIColor clearColor];
        _window.rootViewController = nil;
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
    self.alertCenterView = alertCenterView;
    alertCenterView.center = CGPointMake(WIDTH/2, HEIGHT/2);
    alertCenterView.delegate = self;
    alertCenterView.alertViewType = FQAlertViewTypeTick;
    [self addSubview:alertCenterView];
}

#pragma mark - API
- (void)showWithAnimation:(BOOL)animation {
    self.window.hidden = NO;
    [self insertSubview:self.backShadowView atIndex:0];
    [self.window addSubview:self];
    if (animation) {
        __weak typeof(self) wSelf = self;
        self.backShadowView.alpha = 0;
        self.alertCenterView.transform = CGAffineTransformMakeScale(.3f, .3f);
        [UIView animateWithDuration:.3f delay:0 usingSpringWithDamping:.7 initialSpringVelocity:.3 options:UIViewAnimationOptionCurveEaseOut animations:^{
            wSelf.backShadowView.alpha = .3f;
            wSelf.alertCenterView.transform = CGAffineTransformIdentity;
        } completion:nil];
    }
}

- (void)hideWithAnimation:(BOOL)animation {
    
    if (animation) {
        __weak typeof(self) wSelf = self;
        [UIView animateWithDuration:.1f animations:^{
            wSelf.backShadowView.alpha = 0;
            wSelf.alertCenterView.transform = CGAffineTransformMakeScale(.1f, .1f);
            wSelf.alertCenterView.alpha = .1f;
        } completion:^(BOOL finished) {
            [wSelf hideCompleteHandle];
        }];
    }
    else {
        [self hideCompleteHandle];
    }
}

+ (instancetype)alertViewWithType:(FQAlertViewType)type message:(NSString *)message sureTitle:(NSString *)sureTitle cancelTiele:(NSString *)cancelTiele handleBlock:(FQAlertViewClickBlock)block {
    
    FQAlertView *alertView = [FQAlertView new];
    
    alertView.handleBlock = block;
    alertView.alertCenterView.cancelBtnTitle = cancelTiele;
    alertView.alertCenterView.sureBtnTitle = sureTitle;
    alertView.alertCenterView.alertMsg = message;
    alertView.alertCenterView.alertViewType = type;
    
    return alertView;
}

+ (void)showAlertViewWithType:(FQAlertViewType)type message:(NSString *)message sureTitle:(NSString *)sureTitle cancelTiele:(NSString *)cancelTiele handleBlock:(FQAlertViewClickBlock)block {
    FQAlertView *alertView = [self alertViewWithType:type message:message sureTitle:sureTitle cancelTiele:cancelTiele handleBlock:block];
    
    [alertView showWithAnimation:YES];
}

- (void)hideCompleteHandle {
    [self removeFromSuperview];
    self.window.hidden = YES;
    self.window = nil;
}

#pragma mark - FQAlertCenterViewDelegate
- (void)alertCenterViewSureBtnClick:(UIButton *)btn {
    self.handleBlock ? self.handleBlock(FQAlertViewClickTypeSure, btn) : nil;
    [self hideWithAnimation:YES];
}

- (void)alertCenterViewCancelBtnClick:(UIButton *)btn {
    self.handleBlock ? self.handleBlock(FQAlertViewClickTypeCancel, btn) : nil;
    [self hideWithAnimation:YES];
}


@end
