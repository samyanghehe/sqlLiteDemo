//
//  Define.h
//  QQZoneDemo
//
//  Created by ys on 15/12/14.
//  Copyright (c) 2015年 ys. All rights reserved.
//

#import "UIImage+YS.h"

#import "UIView+YS.h"

//抖动幅度，单位为点
#define shakeValue 30
//快速自定义颜色
#define YSColorWithRGBA(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a/1.0)]
//全局背景色
#define YSBackgroundColor YSColorWithRGBA(55,55,55,1.0)
//竖屏dock宽度
#define YSDockPortraitW 70
//横屏dock宽度
#define YSDocklanscapeW (YSDockPortraitW * 3)

// 底部菜单按钮的尺寸
#define YSBottomMenuButtonPortraitW 70.0
#define YSBottomMenuButtonLanscapeW 90.0
#define YSBottomMenuButtonH 70.0