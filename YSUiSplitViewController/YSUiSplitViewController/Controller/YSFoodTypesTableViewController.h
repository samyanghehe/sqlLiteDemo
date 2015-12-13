//
//  YSFoodTypesTableViewController.h
//  YSUiSplitViewController
//
//  Created by ys on 15/12/12.
//  Copyright (c) 2015年 ys. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YSFoodTypesTableViewController;
#import "YSFoodTypeModule.h"

@protocol YSFoodTypesTableViewControllerDelegate <NSObject>
@optional

-(void)foodTypesTableViewController:(YSFoodTypesTableViewController *)YSFoodTypesTableViewController didSelectedFoodType:(YSFoodTypeModule *)foodType;

@end

@interface YSFoodTypesTableViewController : UITableViewController

@property (nonatomic,weak)id<YSFoodTypesTableViewControllerDelegate> delegate;

@end
