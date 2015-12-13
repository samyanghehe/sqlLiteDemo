//
//  YSFoodDetailViewController.m
//  YSUiSplitViewController
//
//  Created by ys on 15/12/13.
//  Copyright (c) 2015年 ys. All rights reserved.
//

#import "YSFoodDetailViewController.h"


@interface YSFoodDetailViewController ()
@property (nonatomic,strong)UIWebView *webView;


@end

@implementation YSFoodDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *htmlPath = [NSString stringWithFormat:@"/Html/food/%@.html",self.food.idstr];
    NSString *urlPath = [[NSBundle mainBundle]pathForResource:htmlPath ofType:nil];
    NSURL *url = [NSURL URLWithString:urlPath];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
    self.navigationItem.title = self.food.name;
}

-(void)loadView
{
    UIWebView *webView = [[UIWebView alloc]init];
    webView.frame = [UIScreen mainScreen].applicationFrame;
    self.view = webView;
    self.webView = webView;
    
}

@end


