//
//  FQAlertView.h
//  FQAlertViewDemo
//
//  Created by 奉强 on 16/9/11.
//  Copyright © 2016年 奉强. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FQAlertCenterView.h"

/**
 *  点击事件类型
 */
typedef NS_ENUM(NSUInteger, FQAlertViewClickType) {
    /**
     *  取消按钮
     */
    FQAlertViewClickTypeSure,
    /**
     *  确认按钮
     */
    FQAlertViewClickTypeCancel,
};

typedef void(^FQAlertViewClickBlock)(FQAlertViewClickType clickType, UIButton *btn);

@interface FQAlertView : UIView


@property (nonatomic, copy) FQAlertViewClickBlock handleBlock;


/**
 *  显示alert
 *
 *  @param animation 是否动画
 */
- (void)showWithAnimation:(BOOL)animation;

/**
 *  隐藏alert
 *
 *  @param animation 是否动画
 */
- (void)hideWithAnimation:(BOOL)animation;

/**
 *  创建一个实例，但是不显示出来
 *
 *  @param type        类型
 *  @param message     要提示的消息
 *  @param sureTitle   确认按钮标题，这个必须有
 *  @param cancelTiele 取消按钮标题，可选
 *  @param block       点击按钮后的block回调
 *
 *  @return 一个alertview实例
 */
+ (instancetype)alertViewWithType:(FQAlertViewType)type
                          message:(NSString *)message
                        sureTitle:(NSString *)sureTitle
                      cancelTiele:(NSString *)cancelTiele
                      handleBlock:(FQAlertViewClickBlock)block;

/**
 *  创建一个实例，并且显示出来
 *
 *  @param type        类型
 *  @param message     要提示的消息
 *  @param sureTitle   确认按钮标题，这个必须有
 *  @param cancelTiele 取消按钮标题，可选
 *  @param block       点击按钮后的block回调
 */
+ (void)showAlertViewWithType:(FQAlertViewType)type
                      message:(NSString *)message
                    sureTitle:(NSString *)sureTitle
                  cancelTiele:(NSString *)cancelTiele
                  handleBlock:(FQAlertViewClickBlock)block;


@end
