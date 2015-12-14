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

@interface YSMainViewController ()
@property (nonatomic,weak)YSDock *dockView;
@end

@implementation YSMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = YSBackgroundColor;
    
    YSDock *dockView = [[YSDock alloc]init];
    
    dockView.backgroundColor = YSBackgroundColor;
     //使dockView动态调整高度，即上下与父控件粘连
    dockView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    dockView.height = self.view.height;
    self.dockView = dockView;
    [self.view addSubview:dockView];
    
    [self willRotateToInterfaceOrientation:self.interfaceOrientation duration:0.0];
}

/**
 *  屏幕即将旋转时调用
 *
 *  @param toInterfaceOrientation 旋转方向
 *  @param duration               旋转耗时
 */
-(void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    [self.dockView rotate:UIInterfaceOrientationIsLandscape(toInterfaceOrientation)];
}


@end
