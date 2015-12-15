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

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setImage:[UIImage imageWithName:@"qq.jpg"] forState:UIControlStateNormal];
        [self setTitle:@"杨顺" forState:UIControlStateNormal];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.imageView.layer.cornerRadius = 10;
    }
    return self;
}


/**
 *  图片的frame
 */
- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    if (self.width > YSBottomMenuButtonPortraitW) {// 横屏
        CGFloat imageW = self.width;
        CGFloat imageH = imageW;
        return CGRectMake(0, 0, imageW, imageH);
    } else { // 竖屏
        return self.bounds;
    }
}

/**
 *  文字的frame
 */
- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    if (self.width > YSBottomMenuButtonPortraitW) {// 横屏
        CGFloat titleY = self.width;
        CGFloat titleW = self.width;
        CGFloat titleH = self.height - titleY;
        return CGRectMake(0, titleY, titleW, titleH);
    } else { // 竖屏
        return CGRectZero;
    }
}

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
