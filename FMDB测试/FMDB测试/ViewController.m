//
//  ViewController.m
//  FMDB测试
//
//  Created by ys on 15/12/11.
//  Copyright (c) 2015年 ys. All rights reserved.
//

#import "ViewController.h"
#import "FMDatabase.h"
@interface ViewController ()
@property (nonatomic,strong)FMDatabase *dataBase;
- (IBAction)insert;
- (IBAction)delete;
- (IBAction)update;
- (IBAction)select;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *fileName = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject]stringByAppendingPathComponent:@"student.sqlite"];
    NSLog(@"%@",fileName);
    self.dataBase = [FMDatabase databaseWithPath:fileName];
    if ([self.dataBase open]) {
        NSLog(@"数据库打开成功");
        BOOL result = [self.dataBase executeUpdate:@"create table if not exists t_student (id integer primary key autoincrement,name text,age integer);"];
        if (result) {
            NSLog(@"创表成功");
        }else{
            NSLog(@"创表失败");
        }
    }else{
        NSLog(@"数据库打开失败");
    }
}



- (IBAction)insert {
    
    for (int i = 0; i<30; i++) {
        NSString *name = [NSString stringWithFormat:@"jack%d",arc4random()%30];
        int age = arc4random()%30+1;
        BOOL result = [self.dataBase executeUpdateWithFormat:@"insert into t_student (name,age) values (%@,%d);",name,age];
        if (result) {
            NSLog(@"插入数据成功");
        }else{
            NSLog(@"插入数据失败");
        }
        
    }
    
}

- (IBAction)delete {
    if (![self.dataBase executeUpdate:@"delete from t_student where name = 'jack';"]) {
        NSLog(@"删除失败");
    }else{
        NSLog(@"删除成功");
    }
}

- (IBAction)update {
    if (![self.dataBase executeUpdate:@"update t_student set age = 20 where name = 'jack3';"]) {
        NSLog(@"更新失败");
    }else{
        NSLog(@"更新成功");
    }
}

- (IBAction)select {
    FMResultSet *resultSet = [self.dataBase executeQuery:@"select * from t_student where age>20 order by age desc;"];
    
    while (resultSet.next) {
        int ID = [resultSet intForColumn:@"ID"];
        NSString *name = [resultSet stringForColumn:@"name"];
        int age = [resultSet intForColumn:@"age"];
        NSLog(@"%d,%@,%d",ID,name,age);
    }
    
}
@end
