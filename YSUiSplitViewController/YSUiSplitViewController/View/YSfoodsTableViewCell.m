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

@implementation YSfoodsTableViewCell

-(void)layoutSubviews
{
    UIImage *img = self.imageView.image;
    self.imageView.image = [UIImage imageNamed:@"image_placeholder"];
    [super layoutSubviews];
    self.imageView.image = img;
}

@end
