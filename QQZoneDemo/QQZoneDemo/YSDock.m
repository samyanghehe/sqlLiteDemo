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
#import "YSButtomView.h"
#import "Define.h"

@interface YSDock()
@property (nonatomic,weak) YSIconButton *iconButton;
@property (nonatomic,weak) YSTabbarView *tabbarView;
@property (nonatomic,weak) YSButtomView *buttomView;
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
    self.iconButton = iconButton;
    [self addSubview:iconButton];
    
    iconButton.backgroundColor = [UIColor greenColor];
}
// 2.选项卡
-(void)setupTabBarView
{
    YSTabbarView *tabbarView = [[YSTabbarView alloc]init];
    self.tabbarView = tabbarView;
    [self addSubview:tabbarView];
    //使tabbarView动态调整与父控件顶部的距离，即底部粘连
    tabbarView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
    tabbarView.backgroundColor = [UIColor redColor];
}
// 3.底部菜单
-(void)setupBottomMenu
{
    YSButtomView *buttomView = [[YSButtomView alloc]init];
    self.buttomView = buttomView;
    [self addSubview:buttomView];
    //使buttomView动态调整与父控件顶部的距离，即底部粘连
    buttomView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
    buttomView.backgroundColor = [UIColor yellowColor];
}

/**
 *  旋转
 *
 *  @param lanscape 是否为横屏
 */
- (void)rotate:(BOOL)lanscape
{
    // 1.调整底部菜单
    [self.buttomView rotate:lanscape];
    
    // 2.根据底部菜单宽度调整dock宽度
    self.width = self.buttomView.width;
    
    // 3.调整tabbarView
    [self.tabbarView rotate:lanscape];
    
    // 4.根据底部view和自身高度调整tabbarView.y
    self.tabbarView.y = self.buttomView.y - self.tabbarView.height;
    
    // 5.调整头像
    [self.iconButton rotate:lanscape];

}
@end
