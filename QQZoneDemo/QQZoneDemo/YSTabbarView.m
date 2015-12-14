//
//  YSTabbarView.m
//  QQZoneDemo
//
//  Created by ys on 15/12/14.
//  Copyright (c) 2015年 ys. All rights reserved.
//

#import "YSTabbarView.h"
#import "Define.h"

@implementation YSTabbarView

/**
 *  旋转
 *
 *  @param lanscape 是否为横屏
 */
- (void)rotate:(BOOL)lanscape
{
    self.width = self.superview.width;
    self.height = YSBottomMenuButtonH * 6;
}


@end
