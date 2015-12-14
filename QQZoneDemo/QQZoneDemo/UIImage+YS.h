//
//  UIImage+YS.h
//  ysWeibo
//
//  Created by ys on 15/11/29.
//  Copyright (c) 2015年 ys. All rights reserved.
//
#import <UIKit/UIKit.h>

@interface UIImage (YS)
+(UIImage *)imageWithName:(NSString *)name;
+(UIImage *)resizeImageWithName:(NSString *)name;
+(UIImage *)resizeImageWithName:(NSString *)name left:(CGFloat)left top:(CGFloat)top;
@end
