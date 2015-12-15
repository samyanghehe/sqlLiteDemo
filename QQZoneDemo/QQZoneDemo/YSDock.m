//
//  YSDock.m
//  QQZoneDemo
//
//  Created by ys on 15/12/14.
//  Copyright (c) 2015年 ys. All rights reserved.
//

#import "YSDock.h"
#import "YSIconButton.h"
#import "YSTabbarView.h"
#import "YSBottomView.h"
#import "Define.h"

@interface YSDock()


@end

@implementation YSDock

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        // 1.头像
        [self setupIconButton];
        
        // 2.选项卡
        [self setupTabBarView];
        
        // 3.底部菜单
        [self setupBottomMenu];
    }
    return self;
}
// 1.头像
-(void)setupIconButton
{
    YSIconButton *iconButton = [[YSIconButton alloc]init];
    _iconButton = iconButton;
    [self addSubview:iconButton];
}
// 2.选项卡
-(void)setupTabBarView
{
    YSTabbarView *tabbarView = [[YSTabbarView alloc]init];
    _tabbarView = tabbarView;
    [self addSubview:tabbarView];
    //使tabbarView动态调整与父控件顶部的距离，即底部粘连
    tabbarView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
}
// 3.底部菜单
-(void)setupBottomMenu
{
    YSBottomView *bottomView = [[YSBottomView alloc]init];
    _bottomView = bottomView;
    [self addSubview:bottomView];
    //使bottomView动态调整与父控件顶部的距离，即底部粘连
    bottomView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
}

/**
 *  旋转
 *
 *  @param lanscape 是否为横屏
 */
- (void)rotate:(BOOL)lanscape
{
    // 1.调整底部菜单
    [self.bottomView rotate:lanscape];
    
    // 2.根据底部菜单宽度调整dock宽度
    self.width = self.bottomView.width;
    
    // 3.调整tabbarView
    [self.tabbarView rotate:lanscape];
    
    // 4.根据底部view和自身高度调整tabbarView.y
    self.tabbarView.y = self.bottomView.y - self.tabbarView.height;
    
    // 5.调整头像
    [_iconButton rotate:lanscape];

}
@end
