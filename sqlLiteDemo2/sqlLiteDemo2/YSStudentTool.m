//
//  YSStudentTool.m
//  sqlLiteDemo2
//
//  Created by ys on 15/12/11.
//  Copyright (c) 2015年 ys. All rights reserved.
//

#import "YSStudentTool.h"
#import <sqlite3.h>
#import "YSStudent.h"
//static 保证_db只能被此文件中方法访问
static sqlite3 *_db;

@implementation YSStudentTool

+(void)initialize
{
    //获取沙盒document路径
    NSString *fileName = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject]stringByAppendingPathComponent:@"student.sqlite"];
    NSLog(@"%@",fileName);
    //创建(打开)数据库
    int result = sqlite3_open(fileName.UTF8String, &_db);
    if (result == SQLITE_OK) {
        NSLog(@"成功打开数据库");
        //创建表
        const char *sql = "create table if not exists t_student (id integer primary key autoincrement ,name text ,age integer);";
        char *errorMsg = NULL;
        int sqlResult = sqlite3_exec(_db, sql, NULL, NULL, &errorMsg);
        if (sqlResult == SQLITE_OK) {
            NSLog(@"成功创建表t_student");
        }else{
            NSLog(@"创建表失败,%s",errorMsg);
        }
    }else{
        NSLog(@"打开数据库失败");
    }
    

}

+(BOOL)addStudent:(YSStudent *)student
{
    
    NSString *name = student.name;
    int age = student.age;
    NSString *sql = [NSString stringWithFormat:@"insert into t_student (name,age) values ('%@' ,%d) ;",name,age];
    char *errorMsg = NULL;
    int sqlResult = sqlite3_exec(_db, sql.UTF8String, NULL, NULL, &errorMsg);
    if (sqlResult == SQLITE_OK) {
        NSLog(@"成功插入表t_student数据");
    }else{
        NSLog(@"插入表数据失败,%s",errorMsg);
        return NO;
    }
    return YES;
}

+(NSArray *)students
{
    NSMutableArray *studentsArray = nil;
    const char *sql = "select id ,name ,age from t_student;";
    sqlite3_stmt *stmt = NULL;
    
    int result = sqlite3_prepare_v2(_db, sql, -1, &stmt, NULL);
    if (result == SQLITE_OK) {//查询语句合法
        //查询数据
        //int stepResult = sqlite3_step(stmt);
        studentsArray = [NSMutableArray array];
        while(sqlite3_step(stmt) == SQLITE_ROW) {//有一行结果返回
            YSStudent *student = [[YSStudent alloc]init];
            student.ID = sqlite3_column_int(stmt, 0);
            student.name = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 1)];
            student.age = sqlite3_column_int(stmt, 2);
            [studentsArray addObject:student];
        }
        if (studentsArray.count) return studentsArray;
    }else{
        NSLog(@"sql语句不合法");
    }
    return nil;
}


+(NSArray *)studentsWithCondition:(NSString *)name
{
    NSMutableArray *studentsArray = nil;
    NSString *sqlStr = [NSString stringWithFormat:@"select id ,name ,age from t_student where name like '%%%@%%';",name];
    sqlite3_stmt *stmt = NULL;
    int result = sqlite3_prepare_v2(_db, sqlStr.UTF8String, -1, &stmt, NULL);
    if (result == SQLITE_OK) {//查询语句合法
        //查询数据
        //int stepResult = sqlite3_step(stmt);
        studentsArray = [NSMutableArray array];
        while(sqlite3_step(stmt) == SQLITE_ROW) {//有一行结果返回
            YSStudent *student = [[YSStudent alloc]init];
            student.ID = sqlite3_column_int(stmt, 0);
            student.name = [NSString stringWithUTF8String:(const char *)sqlite3_column_text(stmt, 1)];
            student.age = sqlite3_column_int(stmt, 2);
            [studentsArray addObject:student];
        }
        if (studentsArray.count) return studentsArray;
    }else{
        NSLog(@"sql语句不合法");
    }
    return nil;

}
@end
