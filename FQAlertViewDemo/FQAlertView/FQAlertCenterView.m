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

@interface FQAlertCenterView ()

@property (nonatomic, strong) UIImageView *titleIconImageView;
@property (nonatomic, strong) UILabel *infoLabel;
@property (nonatomic, strong) UIButton *cancelBtn;
@property (nonatomic, strong) UIButton *sureBtn;

@end

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
    [self creatTitleIcon];
    [self createBtns];
    [self creatInfoLabelView];
}

#pragma mark - Set
- (void)setSureBtnTitle:(NSString *)sureBtnTitle {
    _sureBtnTitle = sureBtnTitle;
    [self.sureBtn setTitle:sureBtnTitle forState:UIControlStateNormal];
}

- (void)setCancelBtnTitle:(NSString *)cancelBtnTitle {
    _cancelBtnTitle = cancelBtnTitle;
    [self.cancelBtn setTitle:cancelBtnTitle forState:UIControlStateNormal];
    [self layoutIfNeeded];
}

- (void)setAlertMsg:(NSString *)alertMsg {
    _alertMsg = alertMsg;
    self.infoLabel.text = alertMsg;
}

- (void)setAlertViewType:(FQAlertViewType)alertViewType {
    NSString *imageName = @"";
    
    switch (alertViewType) {
        case FQAlertViewTypeTick:
            imageName = @"FQAlertViewTickIcon";
            break;
            
        case FQAlertViewTypeWarning:
            imageName = @"FQAlertViewWarningIcon";
            break;
            
        case FQAlertViewTypeError:
            imageName = @"FQAlertViewErrIcon";
            break;
            
        default:
            break;
    }
    
    self.titleIconImageView.image = [NSBundle fq_alertViewBundleImageForName:imageName];
}

#pragma mark - Layout
- (void)layoutSubviews {
    [super layoutSubviews];
    
    //IconImageView
    self.titleIconImageView.bounds = CGRectMake(0, 0, 35, 35);
    self.titleIconImageView.center = CGPointMake(CGRectGetMidX(self.bounds), 10+self.titleIconImageView.bounds.size.height/2);
    
    [self layoutBtns];
    
    //InfoLabel
    CGFloat infoLabelLeftRightSpace = (self.bounds.size.width - CGRectGetWidth(self.sureBtn.frame)*2)/3;
    self.infoLabel.frame = CGRectMake(infoLabelLeftRightSpace, CGRectGetMaxY(self.titleIconImageView.frame), CGRectGetWidth(self.bounds)-infoLabelLeftRightSpace*2, CGRectGetHeight(self.bounds)-CGRectGetMaxY(self.titleIconImageView.frame)-CGRectGetHeight(self.sureBtn.frame)-10*2);
}

- (void)layoutBtns {
    NSInteger btnCount = self.cancelBtnTitle.length>0 ? 2 : 1;
    CGFloat btnWidth = 110.f/375*WIDTH;
    CGFloat btnHeight = 38.f/110*btnWidth;
    CGFloat btnSpace = (self.bounds.size.width - btnWidth*btnCount)/3;
    
    if (btnCount==1) {
        self.cancelBtn.hidden = YES;
        self.sureBtn.bounds = CGRectMake(0, 0, btnWidth, btnHeight);
        self.sureBtn.center = CGPointMake(CGRectGetMidX(self.bounds), self.bounds.size.height-10-btnHeight/2);
    }
    else {
        self.cancelBtn.hidden = NO;
        self.cancelBtn.frame = CGRectMake(btnSpace, self.bounds.size.height-btnHeight-10, btnWidth, btnHeight);
        self.sureBtn.frame = CGRectMake(CGRectGetMaxX(self.cancelBtn.frame)+btnSpace, self.bounds.size.height-btnHeight-10, btnWidth, btnHeight);
    }
    
}

#pragma mark - Views
- (void)creatBgImageView {
    UIImageView *bgImageView = [UIImageView new];
    bgImageView.frame = self.bounds;
    bgImageView.image = [NSBundle fq_alertViewBundleImageForName:@"FQAlertBg"];
    [self addSubview:bgImageView];
}


- (void)creatTitleIcon {
    UIImageView *titleIconImageView = [UIImageView new];
    self.titleIconImageView = titleIconImageView;
    titleIconImageView.image = [NSBundle fq_alertViewBundleImageForName:@"FQAlertViewTickIcon"];
    [self addSubview:titleIconImageView];
}

- (void)createBtns {
    
    UIButton *cancelBtn = [UIButton new];
    self.cancelBtn = cancelBtn;
    cancelBtn.backgroundColor = [UIColor colorWithRed:240.f/255 green:240.f/255 blue:240.f/255 alpha:1];
    cancelBtn.layer.cornerRadius = 15.f;
    cancelBtn.titleLabel.font = [UIFont systemFontOfSize:17];
    [cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
    [cancelBtn setTitleColor:[UIColor colorWithRed:66.f/255 green:66.f/255 blue:66.f/255 alpha:1] forState:UIControlStateNormal];
    [cancelBtn addTarget:self action:@selector(cancelBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:cancelBtn];
    
    UIButton *sureBtn = [UIButton new];
    sureBtn.layer.cornerRadius = 15.f;
    sureBtn.titleLabel.font = [UIFont systemFontOfSize:17];
    self.sureBtn = sureBtn;
    sureBtn.backgroundColor = [UIColor colorWithRed:29.f/255 green:192.f/255 blue:98.f/255 alpha:1];
    [sureBtn setTitle:@"确认" forState:UIControlStateNormal];
    [sureBtn addTarget:self action:@selector(sureBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:sureBtn];
    
}

- (void)creatInfoLabelView {
    UILabel *infoLabel = [UILabel new];
    infoLabel.numberOfLines = 0;
    infoLabel.font = [UIFont systemFontOfSize:16];
    infoLabel.textColor = [UIColor colorWithRed:44.f/255 green:44.f/255 blue:44.f/255 alpha:1];
    infoLabel.textAlignment = NSTextAlignmentCenter;
    self.infoLabel = infoLabel;
    infoLabel.text = @"这里的提示词语";
    [self addSubview:infoLabel];
}

#pragma mark - Event
- (void)cancelBtnClick:(UIButton *)btn {
    if ([self.delegate respondsToSelector:@selector(alertCenterViewCancelBtnClick:)]) {
        [self.delegate alertCenterViewCancelBtnClick:btn];
    }
}

- (void)sureBtnClick:(UIButton *)btn {
    if ([self.delegate respondsToSelector:@selector(alertCenterViewSureBtnClick:)]) {
        [self.delegate alertCenterViewSureBtnClick:btn];
    }
}

@end
