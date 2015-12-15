//
//  YSTabbarView.h
//  QQZoneDemo
//
//  Created by ys on 15/12/14.
//  Copyright (c) 2015年 ys. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YSTabbarView;

@protocol YSTabbarViewDelegate <NSObject>

@optional
//tabbarButton被点击
-(void)tabbarView:(YSTabbarView *)tabbarView didSelectedFrom:(int)from to:(int)to;

@end

@interface YSTabbarView : UIView

@property (nonatomic,weak)id<YSTabbarViewDelegate> deletage;

/**
 *  旋转
 *
 *  @param lanscape 是否为横屏
 */
- (void)rotate:(BOOL)lanscape;

-(void)unselectTabbar;

@end
