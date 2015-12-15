//
//  YSTabbarView.m
//  QQZoneDemo
//
//  Created by ys on 15/12/14.
//  Copyright (c) 2015年 ys. All rights reserved.
//

#import "YSTabbarView.h"
#import "Define.h"
#import "YSTabbarButton.h"

@interface YSTabbarView()
@property (weak, nonatomic) YSTabbarButton *selectedButton;
@end

@implementation YSTabbarView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // 初始化6个按钮
        [self setupButtonWithIcon:@"tab_bar_feed_icon" title:@"全部动态"];
        [self setupButtonWithIcon:@"tab_bar_passive_feed_icon" title:@"与我相关"];
        [self setupButtonWithIcon:@"tab_bar_pic_wall_icon" title:@"照片墙"];
        [self setupButtonWithIcon:@"tab_bar_e_album_icon" title:@"电子相框"];
        [self setupButtonWithIcon:@"tab_bar_friend_icon" title:@"好友"];
        [self setupButtonWithIcon:@"tab_bar_e_more_icon" title:@"更多"];
    };
    return self;
}

-(void)unselectTabbar
{
    self.selectedButton.selected = NO;
}


- (void)setupButtonWithIcon:(NSString *)icon title:(NSString *)title
{
    YSTabbarButton *button = [[YSTabbarButton alloc] init];
    button.tag = self.subviews.count;
    [button setImage:[UIImage imageWithName:icon] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage resizedImageWithName:@"tabbar_separate_selected_bg"] forState:UIControlStateSelected];
    [button setTitle:title forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchDown];
    [self addSubview:button];
}

/**
 *  监听按钮点击
 */
- (void)buttonClick:(YSTabbarButton *)button
{
    if([self.deletage respondsToSelector:@selector(tabbarView:didSelectedFrom:to:)]){
        [self.deletage tabbarView:self didSelectedFrom:(int)self.selectedButton.tag to:(int)button.tag];
    }
    self.selectedButton.selected = NO;
    button.selected = YES;
    self.selectedButton = button;
}


/**
 *  旋转
 *
 *  @param lanscape 是否为横屏
 */
- (void)rotate:(BOOL)lanscape
{
    int count = (int)self.subviews.count;
    
    self.width = self.superview.width;
    self.height = YSBottomMenuButtonH * 6;
    
    for (int i = 0; i<count; i++) {
        YSTabbarButton *button = self.subviews[i];
        button.width = self.width;
        button.height = YSBottomMenuButtonH;
        button.x = 0;
        button.y = i * button.height;
    }
    
}


@end
