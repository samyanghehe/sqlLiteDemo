//
//  YSComposeViewController.m
//  QQZoneDemo
//
//  Created by ys on 15/12/15.
//  Copyright (c) 2015年 ys. All rights reserved.
//

#import "YSComposeViewController.h"
#import "Define.h"

@implementation YSComposeViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"爱干嘛干嘛";
    self.view.backgroundColor = randomColor;
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"关闭" style:UIBarButtonItemStyleDone target:self action:@selector(close)];
}

-(void)close
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
