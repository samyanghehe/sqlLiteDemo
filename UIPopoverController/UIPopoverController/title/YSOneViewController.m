//
//  YSOneViewController.m
//  UIPopoverController
//
//  Created by ys on 15/12/12.
//  Copyright (c) 2015年 ys. All rights reserved.
//

#import "YSOneViewController.h"
#import "YSTwoViewController.h"
@interface YSOneViewController ()
- (IBAction)jumpClick:(UIButton *)sender;

@end

@implementation YSOneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationItem setTitle:@"杨顺的标题"];
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:nil action:nil];
}


- (IBAction)jumpClick:(UIButton *)sender {
    
    YSTwoViewController *twoVC = [[YSTwoViewController alloc]init];
    [self.navigationController pushViewController:twoVC animated:YES];
}
@end
