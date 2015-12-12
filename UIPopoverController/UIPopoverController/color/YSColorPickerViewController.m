//
//  YSColorPickerViewController.m
//  UIPopoverController
//
//  Created by ys on 15/12/12.
//  Copyright (c) 2015年 ys. All rights reserved.
//

#import "YSColorPickerViewController.h"
#import "UIImage+MJ.h"
@interface YSColorPickerViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation YSColorPickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.preferredContentSize = self.imageView.frame.size;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if ([self.delegate respondsToSelector:@selector(colorPickerViewController:didSelectedColor:)]) {
        UITouch *touch = [touches anyObject];
        CGPoint loc = [touch locationInView:touch.view];
        UIColor *color = [self.imageView.image pixelColorAtLocation:loc];
        [self.delegate colorPickerViewController:self didSelectedColor:color];
    }
}

@end
