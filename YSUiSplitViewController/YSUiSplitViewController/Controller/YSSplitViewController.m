//
//  YSSplitViewController.m
//  YSUiSplitViewController
//
//  Created by ys on 15/12/13.
//  Copyright (c) 2015年 ys. All rights reserved.
//

#import "YSSplitViewController.h"
#import "YSFoodTypesTableViewController.h"
#import "YSFoodsTableViewController.h"

@interface YSSplitViewController ()

@end

@implementation YSSplitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UINavigationController *foodsTypeNav = [self.viewControllers firstObject];
    YSFoodTypesTableViewController *foodTypesVC = [foodsTypeNav.viewControllers firstObject];
    
    UINavigationController *foodsNav = [self.viewControllers lastObject];
    YSFoodsTableViewController<YSFoodTypesTableViewControllerDelegate,UISplitViewControllerDelegate> *foodsVC = [foodsNav.viewControllers firstObject];
    
    foodTypesVC.delegate = foodsVC;
    
    self.delegate = foodsVC;
}

@end
