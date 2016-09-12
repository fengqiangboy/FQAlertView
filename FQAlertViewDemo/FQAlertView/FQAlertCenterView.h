//
//  FQAlertCenterView.h
//  FQAlertViewDemo
//
//  Created by 奉强 on 16/9/11.
//  Copyright © 2016年 奉强. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  提示的类型
 */
typedef NS_ENUM(NSUInteger, FQAlertViewType) {
    /**
     *  打勾勾的
     */
    FQAlertViewTypeTick,
    /**
     *  黄色警告
     */
    FQAlertViewTypeWarning,
    /**
     *  红色错误
     */
    FQAlertViewTypeError,
};

@protocol FQAlertCenterViewDelegate <NSObject>

/** 取消按钮点击事件*/
- (void)alertCenterViewCancelBtnClick:(UIButton *)btn;

/** 绿色按钮点击事件*/
- (void)alertCenterViewSureBtnClick:(UIButton *)btn;

@end

@interface FQAlertCenterView : UIView

@property (nonatomic, strong) NSString *cancelBtnTitle;
@property (nonatomic, strong) NSString *sureBtnTitle;
@property (nonatomic, strong) NSString *alertMsg;
@property (nonatomic, assign) FQAlertViewType alertViewType;

@property (nonatomic, weak) id <FQAlertCenterViewDelegate> delegate;

@end
