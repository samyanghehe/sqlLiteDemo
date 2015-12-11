//
//  YSStudentTool.h
//  sqlLiteDemo2
//
//  Created by ys on 15/12/11.
//  Copyright (c) 2015年 ys. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YSStudent.h"

@interface YSStudentTool : NSObject

//添加学生
+(BOOL)addStudent:(YSStudent *)student;

//返回所有学生
+(NSArray *)students;

//根据传入的name模糊搜索返回符合条件的所有学生
+(NSArray *)studentsWithCondition:(NSString *)name;
@end
