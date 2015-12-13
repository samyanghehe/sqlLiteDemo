//
//  YSFoodTypeModule.m
//  YSUiSplitViewController
//
//  Created by ys on 15/12/12.
//  Copyright (c) 2015年 ys. All rights reserved.
//

#import "YSFoodTypeModule.h"

@implementation YSFoodTypeModule

+(instancetype)foodTypeWithDict:(NSDictionary *)dict
{
    return [[self alloc]initWithDict:dict];
}

-(instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        
        self.name = dict[@"name"];
        self.idstr = dict[@"idstr"];
//        //or KVC,其缺点是字典键在模型中必须有对应属性,否则崩溃,而MJExtension则可以解决这个问题
//        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

@end
