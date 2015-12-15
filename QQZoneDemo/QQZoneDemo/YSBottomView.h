//
//  YSBottomView.h
//  QQZoneDemo
//
//  Created by ys on 15/12/14.
//  Copyright (c) 2015年 ys. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YSBottomView;

typedef enum {
    YSBottomViewButtonTypeMood,
    YSBottomViewButtonTypePhoto,
    YSBottomViewButtonTypeBlog,
} YSBottomViewButtonType;

@protocol YSBottomViewDelegate <NSObject>

@optional

-(void)bottomView:(YSBottomView *)bottomView didSelectedWithType:(YSBottomViewButtonType)YSBottomViewButtonType;

@end

@interface YSBottomView : UIView

@property(nonatomic,weak)id<YSBottomViewDelegate> delegate;
/**
 *  旋转
 *
 *  @param lanscape 是否为横屏
 */
- (void)rotate:(BOOL)lanscape;
@end
