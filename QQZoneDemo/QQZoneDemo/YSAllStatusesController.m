//
//  YSAllStatusesController.m
//  QQZoneDemo
//
//  Created by ys on 15/12/15.
//  Copyright (c) 2015年 ys. All rights reserved.
//

#import "YSAllStatusesController.h"
#import "Define.h"

@implementation YSAllStatusesController

-(void)viewDidLoad
{
    NSArray *array = @[@"杨顺1",@"杨顺2",@"杨顺3",@"杨顺4"];
    UISegmentedControl *seg = [[UISegmentedControl alloc]initWithItems:array];
    
    NSMutableDictionary *textAttrsSelected=[NSMutableDictionary dictionary];
    textAttrsSelected[NSForegroundColorAttributeName]=[UIColor blackColor];
    [seg setTitleTextAttributes:textAttrsSelected forState:UIControlStateSelected];
    
    NSMutableDictionary *textAttrs=[NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName]=[UIColor whiteColor];
    [seg setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    
    seg.tintColor = YSColorWithRGBA(222, 222, 222, 1);
    self.navigationController.navigationBar.barTintColor = [UIColor grayColor];
    self.navigationItem.titleView = seg;
    seg.selectedSegmentIndex = 0;
    self.view.backgroundColor = randomColor;
    [seg addTarget:self action:@selector(click:) forControlEvents:UIControlEventValueChanged];
}

-(void)click:(UISegmentedControl *)seg
{
    if (seg.selectedSegmentIndex == 1) {
        self.view.backgroundColor = randomColor;
    }else{
        self.view.backgroundColor = randomColor;
        NSLog(@"selectedSegmentIndex != 1");
    }
}

@end
