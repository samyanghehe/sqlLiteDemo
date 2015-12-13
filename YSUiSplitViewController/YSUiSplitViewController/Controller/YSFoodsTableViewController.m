//
//  YSFoodsTableViewController.m
//  YSUiSplitViewController
//
//  Created by ys on 15/12/12.
//  Copyright (c) 2015年 ys. All rights reserved.
//

#import "YSFoodsTableViewController.h"
#import "YSFoodTypesTableViewController.h"
#import "YSFoodTypeModule.h"
#import "MJExtension.h"
#import "YSFoodModule.h"
#import "UIImageView+WebCache.h"
#import "YSFoodDetailViewController.h"
#import "YSfoodsTableViewCell.h"

@interface YSFoodsTableViewController ()<YSFoodTypesTableViewControllerDelegate,UISplitViewControllerDelegate>
@property (nonatomic ,strong)NSMutableArray *foods;
@end

@implementation YSFoodsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(void)foodTypesTableViewController:(YSFoodTypesTableViewController *)YSFoodTypesTableViewController didSelectedFoodType:(YSFoodTypeModule *)foodType
{
    NSString *foodPathName = [NSString stringWithFormat:@"type_%@_foods.plist",foodType.idstr];
    self.foods = [YSFoodModule mj_objectArrayWithFilename:foodPathName];
    self.title = foodType.name;
    [self.tableView reloadData];
    
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.foods.count;
}

-(YSfoodsTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    YSfoodsTableViewCell *cell = [YSfoodsTableViewCell cellWithTableView:tableView];
    YSFoodModule *food = self.foods[indexPath.row];
    cell.food = food;
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    YSFoodDetailViewController *foodDetailVC = [[YSFoodDetailViewController alloc]init];
    foodDetailVC.food  = self.foods[indexPath.row];
    [self.navigationController pushViewController:foodDetailVC animated:YES];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 90;
}


#pragma mark -UISplitViewControllerDelegate

-(void)splitViewController:(UISplitViewController *)svc willShowViewController:(UIViewController *)aViewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    self.navigationItem.leftBarButtonItem = nil;
}

-(void)splitViewController:(UISplitViewController *)svc willHideViewController:(UIViewController *)aViewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)pc
{
    barButtonItem.title = @"菜系";
    self.navigationItem.leftBarButtonItem = barButtonItem;
}

@end
