//
//  ViewController.m
//  sqlLiteDemo1
//
//  Created by ys on 15/12/10.
//  Copyright (c) 2015年 ys. All rights reserved.
//

#import "ViewController.h"
#import <sqlite3.h>

@interface ViewController ()
{
    sqlite3 *_db;//sqlite实例
}
- (IBAction)insertData;
- (IBAction)updateData;
- (IBAction)deleteData;
- (IBAction)selectData;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
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



- (IBAction)insertData {
    
    for (int i = 0 ; i<30; i++) {
        NSString *name = [NSString stringWithFormat:@"jack%d",arc4random()%30];
        int age = arc4random()%30;
        NSString *sql = [NSString stringWithFormat:@"insert into t_student (name,age) values ('%@' ,%d) ;",name,age];
        char *errorMsg = NULL;
        int sqlResult = sqlite3_exec(_db, sql.UTF8String, NULL, NULL, &errorMsg);
        if (sqlResult == SQLITE_OK) {
            NSLog(@"成功插入表t_student数据");
        }else{
            NSLog(@"插入表数据失败,%s",errorMsg);
        }
    }
    
}

- (IBAction)updateData {
    //略,方法同insertData
}

- (IBAction)deleteData {
     //略,方法同insertData
}

- (IBAction)selectData {
    const char *sql = "select id ,name ,age from t_student;";
    sqlite3_stmt *stmt = NULL;
    
    int result = sqlite3_prepare_v2(_db, sql, -1, &stmt, NULL);
    if (result == SQLITE_OK) {//查询语句合法
        //查询数据
        //int stepResult = sqlite3_step(stmt);
        while(sqlite3_step(stmt) == SQLITE_ROW) {//有一行结果返回
            int sid = sqlite3_column_int(stmt, 0);
            const  unsigned char *sname = sqlite3_column_text(stmt, 1);
            int sage = sqlite3_column_int(stmt, 2);
            NSLog(@"%d,%s,%d",sid,sname,sage);
        }
    }else{
        NSLog(@"sql语句不合法");
    }
}
@end
