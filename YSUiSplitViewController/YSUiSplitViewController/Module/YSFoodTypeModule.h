//
//  YSFoodTypeModule.h
//  YSUiSplitViewController
//
//  Created by ys on 15/12/12.
//  Copyright (c) 2015年 ys. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YSFoodTypeModule : NSObject

@property (nonatomic,copy)NSString *idstr;

@property (nonatomic,copy)NSString *name;
//若使用MJExtension则不用写以下两个方法
-(instancetype)initWithDict:(NSDictionary *)dict;

+(instancetype)foodTypeWithDict:(NSDictionary *)dict;

@end
