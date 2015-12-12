//
//  YSMenuItem.m
//  UIPopoverController
//
//  Created by ys on 15/12/12.
//  Copyright (c) 2015年 ys. All rights reserved.
//

#import "YSMenuItem.h"

@implementation YSMenuItem




+(instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title
{
    YSMenuItem *menuItem = [[YSMenuItem alloc]init];
    menuItem.icon = icon;
    menuItem.title = title;
    return menuItem;
}

@end
