//
//  ViewController.m
//  sqlLiteDemo2
//
//  Created by ys on 15/12/11.
//  Copyright (c) 2015年 ys. All rights reserved.
//

#import "ViewController.h"
#import "YSStudentTool.h"

@interface ViewController ()

- (IBAction)insertData;
- (IBAction)selectData;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)insertData {
    for (int i = 0; i<30; i++) {
        YSStudent *studnet = [[YSStudent alloc]init];
        studnet.name = [NSString stringWithFormat:@"jack%d",arc4random()%30];
        studnet.age = arc4random()%30;
        BOOL result = [YSStudentTool addStudent:studnet];
        if (result) {
            NSLog(@"添加学生成功");
        }else{
            NSLog(@"添加学生失败");
        }
    }
    
}

- (IBAction)selectData {
    
    NSArray * students = [YSStudentTool students];
    for (YSStudent *stu in students) {
        NSLog(@"%d,%@,%d",stu.ID,stu.name,stu.age);
    }
}
@end
