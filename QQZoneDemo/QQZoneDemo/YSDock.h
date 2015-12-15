//
//  YSDock.h
//  QQZoneDemo
//
//  Created by ys on 15/12/14.
//  Copyright (c) 2015年 ys. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YSTabbarView;
@class YSIconButton;
@class YSBottomView;

@interface YSDock : UIView

@property (nonatomic,weak,readonly)YSTabbarView *tabbarView;

@property (nonatomic,weak,readonly) YSIconButton *iconButton;


@property (nonatomic,weak,readonly) YSBottomView *bottomView;
/**
 *  旋转
 *
 *  @param lanscape 是否为横屏
 */
- (void)rotate:(BOOL)lanscape;
@end
