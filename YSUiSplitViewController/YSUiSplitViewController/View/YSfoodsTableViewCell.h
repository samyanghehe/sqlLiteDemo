//
//  YSfoodsTableViewCell.h
//  YSUiSplitViewController
//
//  Created by ys on 15/12/13.
//  Copyright (c) 2015年 ys. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YSFoodModule.h"

@interface YSfoodsTableViewCell : UITableViewCell

@property (nonatomic,strong)YSFoodModule *food;
+(instancetype)cellWithTableView:(UITableView *)tableView;

@end
