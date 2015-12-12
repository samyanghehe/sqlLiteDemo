//
//  YSMenuItem.h
//  UIPopoverController
//
//  Created by ys on 15/12/12.
//  Copyright (c) 2015年 ys. All rights reserved.
//  模型

#import <Foundation/Foundation.h>

@interface YSMenuItem : NSObject

@property (nonatomic,strong)NSString *icon;
@property (nonatomic,strong)NSString *title;

+(instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title;
@end
