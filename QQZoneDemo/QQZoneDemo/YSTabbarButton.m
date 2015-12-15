//
//  YSTabbarButton.m
//  QQZoneDemo
//
//  Created by ys on 15/12/14.
//  Copyright (c) 2015年 ys. All rights reserved.
//

#import "YSTabbarButton.h"
#import "Define.h"

@implementation YSTabbarButton

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.imageView.contentMode = UIViewContentModeCenter;
        self.titleLabel.font = [UIFont systemFontOfSize:20];
    }
    return self;
}
- (void)setHighlighted:(BOOL)highlighted {}
/**
 *  重写图片的frame
 */
- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    if (self.width > YSBottomMenuButtonLanscapeW) {// 横屏
        CGFloat imageW = self.width * YSTabBarButtonImageLanscpaeWRatio;
        CGFloat imageH = self.height;
        return CGRectMake(0, 0, imageW, imageH);
    } else { // 竖屏
        return self.bounds;
    }
}

/**
 *  重写文字的frame
 */
- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    if (self.width > YSBottomMenuButtonLanscapeW) {// 横屏
        CGFloat titleX = self.width * YSTabBarButtonImageLanscpaeWRatio;
        CGFloat titleW = self.width - titleX;
        CGFloat titleH = self.height;
        return CGRectMake(titleX, 0, titleW, titleH);
    } else { // 竖屏
        return CGRectZero;
    }
}
@end
