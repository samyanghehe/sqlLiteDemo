//
//  YSColorPickerViewController.h
//  UIPopoverController
//
//  Created by ys on 15/12/12.
//  Copyright (c) 2015年 ys. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YSColorPickerViewController;
/**
 *  点击颜色表代理协议
 */
@protocol YSColorPickerViewControllerDelegate <NSObject>

@optional

-(void)colorPickerViewController:(YSColorPickerViewController *)colorVC didSelectedColor:(UIColor *)color;

@end


@interface YSColorPickerViewController : UIViewController
@property (nonatomic,weak)id<YSColorPickerViewControllerDelegate> delegate;
@end
