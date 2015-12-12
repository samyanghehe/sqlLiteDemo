//
//  ViewController.m
//  UIPopoverController
//
//  Created by ys on 15/12/12.
//  Copyright (c) 2015年 ys. All rights reserved.
//

#import "ViewController.h"
#import "YSOneViewController.h"
#import "YSTableViewController.h"
#import "YSColorPickerViewController.h"

@interface ViewController ()<YSColorPickerViewControllerDelegate>

- (IBAction)menuClick:(UIBarButtonItem *)sender;
- (IBAction)titleClick:(UIButton *)sender;
- (IBAction)selectColor:(UIButton *)sender;

@property (nonatomic,weak)UIButton *colorButton;//记录被点击的按钮

@property (nonatomic,strong)UIPopoverController *menuPopoverC;
@property (nonatomic,strong)UIPopoverController *titlePopoverC;
@property (nonatomic,strong)UIPopoverController *colorPopoverC;

@end


@implementation ViewController
/**
 *  懒加载菜单控制器
 */
-(UIPopoverController *)menuPopoverC
{
    if (_menuPopoverC == nil) {
        YSTableViewController *tableViewC = [[YSTableViewController alloc]init];
        self.menuPopoverC = [[UIPopoverController alloc]initWithContentViewController:tableViewC];
    }
    return _menuPopoverC;
}
/**
 *  懒加载标题控制器
 */
-(UIPopoverController *)titlePopoverC
{
    if (_titlePopoverC == nil) {
        YSOneViewController *oneVC = [[YSOneViewController alloc]init];
        UINavigationController *navC = [[UINavigationController alloc]initWithRootViewController:oneVC];
        self.titlePopoverC = [[UIPopoverController alloc]initWithContentViewController:navC];
    }
    return _titlePopoverC;
}
/**
 *  懒加载颜色表控制器
 */
-(UIPopoverController *)colorPopoverC
{
    if (_colorPopoverC == nil) {
        YSColorPickerViewController *colorVC = [[YSColorPickerViewController alloc]init];
        colorVC.delegate = self;
        self.colorPopoverC = [[UIPopoverController alloc]initWithContentViewController:colorVC];
        //这个属性可以让数组中的view被点击时不隐藏colorPopoverC
        self.colorPopoverC.passthroughViews = @[self.colorButton];
    }
    return _colorPopoverC;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
}

/**
 *  点击菜单,方法1presentPopoverFromBarButtonItem
 */
- (IBAction)menuClick:(UIBarButtonItem *)sender {
    [self.menuPopoverC presentPopoverFromBarButtonItem:sender permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
}
/**
 *  点击标题,方法2presentPopoverFromRect
 */
- (IBAction)titleClick:(UIButton *)sender {
    [self.titlePopoverC presentPopoverFromRect:sender.bounds inView:sender permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
}
/**
 *  点击颜色块,方法2presentPopoverFromRect
 */
- (IBAction)selectColor:(UIButton *)sender {
    self.colorButton = sender;
    [self.colorPopoverC presentPopoverFromRect:sender.bounds inView:sender permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
}
/**
 *  颜色表点击代理方法实现
 *
 *  @param colorVC 颜色表控制器
 *  @param color   所选颜色
 */
-(void)colorPickerViewController:(YSColorPickerViewController *)colorVC didSelectedColor:(UIColor *)color
{
    self.colorButton.backgroundColor = color;
}
@end
