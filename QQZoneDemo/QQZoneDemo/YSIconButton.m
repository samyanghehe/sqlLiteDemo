//
//  YSIconButton.m
//  QQZoneDemo
//
//  Created by ys on 15/12/14.
//  Copyright (c) 2015年 ys. All rights reserved.
//

#import "YSIconButton.h"
#import "Define.h"

@implementation YSIconButton


/**
 *  旋转
 *
 *  @param lanscape 是否为横屏
 */
- (void)rotate:(BOOL)lanscape
{
    if (lanscape) { // 横屏
        self.width = self.superview.width * 0.35;
        self.height = self.width + 30;
        self.y = 60;
        self.x = (self.superview.width - self.width) * 0.5;
    } else { // 竖屏
        self.y = 40;
        self.x = 10;
        self.width = self.superview.width - 2 * self.x;
        self.height = self.width;
    }
}

@end
