//
//  YSButtomView.m
//  QQZoneDemo
//
//  Created by ys on 15/12/14.
//  Copyright (c) 2015年 ys. All rights reserved.
//

#import "YSButtomView.h"
#import "Define.h"

@implementation YSButtomView
/**
 *  旋转
 *
 *  @param lanscape 是否为横屏
 */
- (void)rotate:(BOOL)lanscape
{
    if (lanscape) { // 横屏
        self.width = YSBottomMenuButtonLanscapeW * 3;
        self.height = YSBottomMenuButtonH;
    } else { // 竖屏
        self.width = YSBottomMenuButtonPortraitW;
        self.height = YSBottomMenuButtonH * 3;
    }
    self.y = self.superview.height - self.height;
}

@end
