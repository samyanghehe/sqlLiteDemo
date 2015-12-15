//
//  YSBottomView.m
//  QQZoneDemo
//
//  Created by ys on 15/12/14.
//  Copyright (c) 2015年 ys. All rights reserved.
//

#import "YSBottomView.h"
#import "Define.h"
#import "UIImage+YS.h"
@implementation YSBottomView


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // 初始化3个按钮
        [self setupButtonWithIcon:@"tabbar_mood" withYSBottomViewButtonType:YSBottomViewButtonTypeMood];
        [self setupButtonWithIcon:@"tabbar_photo" withYSBottomViewButtonType:YSBottomViewButtonTypePhoto];
        [self setupButtonWithIcon:@"tabbar_blog" withYSBottomViewButtonType:YSBottomViewButtonTypeBlog];
    }
    return self;
}
/**
 *  创建一个按钮
 *
 *  @param icon 按钮内部的图标
 */
- (void)setupButtonWithIcon:(NSString *)icon withYSBottomViewButtonType:(YSBottomViewButtonType)type
{
    UIButton *button = [[UIButton alloc] init];
    button.tag = type;
    [button setImage:[UIImage imageWithName:icon] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage resizedImageWithName:@"tabbar_separate_selected_bg"] forState:UIControlStateHighlighted];
    [self addSubview:button];
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark -设置底部按钮点击事件
-(void)buttonClick:(UIButton *)button
{
    if ([self.delegate respondsToSelector:@selector(bottomView:didSelectedWithType:)]) {
        [self.delegate bottomView:self didSelectedWithType:button.tag];
    }
}

/**
 *  旋转
 *
 *  @param lanscape 是否为横屏
 */
- (void)rotate:(BOOL)lanscape
{
    int count = (int)self.subviews.count;
    
    if (lanscape) { // 横屏
        self.width = YSBottomMenuButtonLanscapeW * 3;
        self.height = YSBottomMenuButtonH;
        
        for (int i = 0; i<count; i++) {
            UIButton *button = self.subviews[i];
            button.x = i * YSBottomMenuButtonLanscapeW;
            button.y = 0;
            button.width = YSBottomMenuButtonLanscapeW;
            button.height = YSBottomMenuButtonH;
        }

    } else { // 竖屏
        self.width = YSBottomMenuButtonPortraitW;
        self.height = YSBottomMenuButtonH * 3;
        
        for (int i = 0; i<count; i++) {
            UIButton *button = self.subviews[i];
            button.x = 0;
            button.y = i * YSBottomMenuButtonH;
            button.width = YSBottomMenuButtonPortraitW;
            button.height = YSBottomMenuButtonH;
        }

    }
    self.y = self.superview.height - self.height;
}

@end
