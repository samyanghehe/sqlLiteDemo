//
//  YSfoodsTableViewCell.m
//  YSUiSplitViewController
//
//  Created by ys on 15/12/13.
//  Copyright (c) 2015年 ys. All rights reserved.
//

#import "YSfoodsTableViewCell.h"
#import<UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "UIImageView+WebCache.h"

@implementation YSfoodsTableViewCell


+(instancetype)cellWithTableView:(UITableView *)tableView
{
    NSString *ID = @"food";
    YSfoodsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[self alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    return cell;
}

-(void)setFood:(YSFoodModule *)food
{
    _food = food;
    NSURL *imageUrl = [NSURL URLWithString:food.imageUrl];
    [self.imageView setImageWithURL:imageUrl placeholderImage:[UIImage imageNamed:@"image_placeholder"]];
    self.textLabel.text = food.name;
    self.detailTextLabel.text = [NSString stringWithFormat:@"    难点:%@  耗时:%@",food.diff,food.time];
}


-(void)layoutSubviews
{
    UIImage *img = self.imageView.image;
    self.imageView.image = [UIImage imageNamed:@"image_placeholder"];
    self.textLabel.font = [UIFont systemFontOfSize:25];
    self.detailTextLabel.font = [UIFont systemFontOfSize:20];
    [super layoutSubviews];
    self.imageView.image = img;
    }
@end
