//
//  YSMainViewController.m
//  QQZoneDemo
//
//  Created by ys on 15/12/14.
//  Copyright (c) 2015年 ys. All rights reserved.
//

#import "YSMainViewController.h"
#import "YSDock.h"
#import "Define.h"
#import "YSTabbarView.h"
#import "YSIconButton.h"
#import "YSAllStatusesController.h"
#import "YSBottomView.h"
#import "YSComposeViewController.h"

#define YSContentViewW 600
@interface YSMainViewController ()<YSTabbarViewDelegate,YSBottomViewDelegate>
@property (nonatomic,weak)YSDock *dockView;
@property (nonatomic,weak)UIView *contentView;
@end

@implementation YSMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = YSBackgroundColor;
    [self setupDock];
    [self setupChildViewControllers];
    [self setupContentView];
    [self tabbarView:nil didSelectedFrom:0 to:0];
    [self willRotateToInterfaceOrientation:self.interfaceOrientation duration:0.0];
}

-(void)setupContentView
{
    UIView *contentView = [[UIView alloc]init];
    contentView.y = 0;
    contentView.x = self.dockView.width;
    contentView.height = self.view.height;
    contentView.width = YSContentViewW;
    self.contentView = contentView;
    self.contentView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:contentView];
}

-(void)setupChildViewControllers
{
    //仅实现了第一个
    //动态对应控制器
    YSAllStatusesController *vc1 = [[YSAllStatusesController alloc]init];
    UINavigationController *nav1 = [[UINavigationController alloc]initWithRootViewController:vc1];
    [self addChildViewController:nav1];
    
    //与我相关对应控制器
    UIViewController *vc2 = [[UIViewController alloc]init];
    UINavigationController *nav2 = [[UINavigationController alloc]initWithRootViewController:vc2];
    nav2.navigationBar.barTintColor = [UIColor grayColor];
    vc2.view.backgroundColor = randomColor;
    [self addChildViewController:nav2];
    //照片墙对应控制器
    UIViewController *vc3 = [[UIViewController alloc]init];
    UINavigationController *nav3 = [[UINavigationController alloc]initWithRootViewController:vc3];
    nav3.navigationBar.barTintColor = [UIColor grayColor];
    vc3.view.backgroundColor = randomColor;
    [self addChildViewController:nav3];
    //电子相框对应控制器
    UIViewController *vc4 = [[UIViewController alloc]init];
    UINavigationController *nav4 = [[UINavigationController alloc]initWithRootViewController:vc4];
    nav4.navigationBar.barTintColor = [UIColor grayColor];
    vc4.view.backgroundColor = randomColor;
    [self addChildViewController:nav4];
    //好友对应控制器
    UIViewController *vc5 = [[UIViewController alloc]init];
    UINavigationController *nav5 = [[UINavigationController alloc]initWithRootViewController:vc5];
    nav5.navigationBar.barTintColor = [UIColor grayColor];
    vc5.view.backgroundColor = randomColor;
    [self addChildViewController:nav5];
    //更多对应控制器
    UIViewController *vc6 = [[UIViewController alloc]init];
    UINavigationController *nav6 = [[UINavigationController alloc]initWithRootViewController:vc6];
    nav6.navigationBar.barTintColor = [UIColor grayColor];
    vc6.view.backgroundColor = randomColor;
    [self addChildViewController:nav6];
    //头像对应控制器
    UIViewController *vc0 = [[UIViewController alloc]init];
    UINavigationController *nav0 = [[UINavigationController alloc]initWithRootViewController:vc0];
    nav0.navigationBar.barTintColor = [UIColor grayColor];
    vc0.view.backgroundColor = randomColor;
    [self addChildViewController:nav0];
}

-(void)setupDock
{
    YSDock *dockView = [[YSDock alloc]init];
    
    dockView.backgroundColor = YSBackgroundColor;
    dockView.height = self.view.height;
    self.dockView = dockView;
    [self.view addSubview:dockView];
    dockView.tabbarView.deletage = self;
    dockView.bottomView.delegate = self;
    //使dockView动态调整高度，即上下与父控件粘连
    dockView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    
    //监听iconButton点击
    [self.dockView.iconButton addTarget:self action:@selector(iconButtonClick:) forControlEvents:UIControlEventTouchDown];
}

-(void)iconButtonClick:(YSIconButton *)iconButton
{
    [self tabbarView:nil didSelectedFrom:0 to:6];
    [self.dockView.tabbarView unselectTabbar];
}

/**
 *  屏幕即将旋转时调用
 *
 *  @param toInterfaceOrientation 旋转方向
 *  @param duration               旋转耗时
 */

-(void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    [UIView animateWithDuration:0.5 animations:^{
        [self.dockView rotate:UIInterfaceOrientationIsLandscape(toInterfaceOrientation)];
        self.contentView.x = self.dockView.width;
        self.contentView.width = YSContentViewW;
        self.contentView.height = self.dockView.height;
    }];
}


-(void)tabbarView:(YSTabbarView *)tabbarView didSelectedFrom:(int)from to:(int)to
{
    //新控制器
    UINavigationController *newNav = self.childViewControllers[to];
    if (newNav.view.superview) return;//防止重复点击重复切换同一个view
    newNav.view.frame = self.contentView.bounds;
    
    //从contentView中取出旧控制器的view，可能为空，下一个if做判断
    UIView *oldNavView = [self.contentView.subviews firstObject];
    

    if (oldNavView.superview) {//oldNavView有父view
        [oldNavView removeFromSuperview];
        [self.contentView addSubview:newNav.view];
        //转场动画
        CATransition *transition = [[CATransition alloc]init];
        transition.type = @"reveal";
        transition.duration = 0.5;
        [self.contentView.layer addAnimation:transition forKey:nil];
    }else{//从contentView中取出旧控制器的view为空，oldNavView.superview则也为空，即第一次添加view到contentView，不需要做转场动画
        [self.contentView addSubview:newNav.view];
    }
}

-(void)bottomView:(YSBottomView *)bottomView didSelectedWithType:(YSBottomViewButtonType)YSBottomViewButtonType
{
    switch (YSBottomViewButtonType) {
        case YSBottomViewButtonTypeMood:
        {
            YSComposeViewController *compose = [[YSComposeViewController alloc]init];
            UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:compose];
            nav.modalPresentationStyle = UIModalPresentationPageSheet;
            [self presentViewController:nav animated:YES completion:nil];
            
        }
            break;
        case YSBottomViewButtonTypePhoto:
        {
            YSComposeViewController *compose = [[YSComposeViewController alloc]init];
            UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:compose];
            nav.modalPresentationStyle = UIModalPresentationPageSheet;
            [self presentViewController:nav animated:YES completion:nil];
            
        }
            break;
            
        case YSBottomViewButtonTypeBlog:
        {
            YSComposeViewController *compose = [[YSComposeViewController alloc]init];
            UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:compose];
            nav.modalPresentationStyle = UIModalPresentationPageSheet;
            [self presentViewController:nav animated:YES completion:nil];
            
        }
            break;
        default:
            break;
    }
}

@end
