//
//  YSLoginViewController.m
//  QQZoneDemo
//
//  Created by ys on 15/12/14.
//  Copyright (c) 2015年 ys. All rights reserved.
//

#import "YSLoginViewController.h"
#import "YSMainViewController.h"
#import "Define.h"

@interface YSLoginViewController ()<UITextFieldDelegate>

/**
 *  整个登陆框
 */
@property (weak, nonatomic) IBOutlet UIView *LoginView;
/**
 *  帐号框
 */
@property (weak, nonatomic) IBOutlet UITextField *accountField;
/**
 *  密码框
 */
@property (weak, nonatomic) IBOutlet UITextField *pwdField;
/**
 *  登陆按钮
 */
@property (weak, nonatomic) IBOutlet UIButton *LoginButton;
/**
 *  联网指示器
 */
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activity;
/**
 *  记住密码按钮
 */
@property (weak, nonatomic) IBOutlet UIButton *rememberPwdButton;
/**
 *  自动登陆按钮
 */
@property (weak, nonatomic) IBOutlet UIButton *autoLoginButton;
/**
 *  preference数据存储，在沙盒/library/Preferences
 */
@property (nonatomic,strong) NSUserDefaults *userdefault;
/**
 *  登陆按钮点击事件
 */
- (IBAction)LoginButtonClick;
/**
 *  记住密码或自动登陆按钮点击事件
 */
- (IBAction)rememberORautoClick:(UIButton *)sender;

@end


@implementation YSLoginViewController

-(NSUserDefaults *)userdefault
{
    if (_userdefault == nil) {
        _userdefault  = [NSUserDefaults standardUserDefaults];
    }
    return _userdefault;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupView];
    [self loadPreferences];
}
#pragma mark -设置view背景
-(void)setupView
{
    [self.LoginButton setBackgroundImage:[UIImage resizedImageWithName:@"login_button_normal"] forState:UIControlStateNormal];
    [self.LoginButton setBackgroundImage:[UIImage resizedImageWithName:@"login_button_pressed"] forState:UIControlStateHighlighted];
    self.view.backgroundColor = YSBackgroundColor;
}
#pragma mark -读取程序配置
-(void)loadPreferences
{
    NSString *account = [self.userdefault objectForKey:@"account"];
    NSString *password = [self.userdefault objectForKey:@"password"];
    BOOL rememberPassword = [self.userdefault boolForKey:@"rememberPassword"];
    BOOL autoLogin = [self.userdefault boolForKey:@"autoLogin"];
    if(account){
        self.accountField.text = account;
    }
    if (rememberPassword) {
        self.pwdField.text = password;
    }else{
        self.pwdField.text = nil;
    }
    if (autoLogin) {
        [self LoginButtonClick];
    }
    self.rememberPwdButton.selected = rememberPassword;
    self.autoLoginButton.selected = autoLogin;
}



#pragma mark -登陆按钮点击事件
- (IBAction)LoginButtonClick {

    [self.view endEditing:YES];
    if (!self.accountField.text.length) {
        [self showErr:@"请输入帐号"];
        return;
    }
    if (!self.pwdField.text.length) {
        [self showErr:@"请输入密码"];
        return;
    }
    self.view.userInteractionEnabled = NO;
    [self.activity startAnimating];
    CGFloat time = 0.5;//模拟联网验证登陆
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(time * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.activity stopAnimating];
        self.view.userInteractionEnabled = YES;
        if (![self.accountField.text isEqualToString:@"123"]) {
            [self showErr:@"帐号错误"];
            return;
        }
        if (![self.pwdField.text isEqualToString:@"123"]) {
            [self showErr:@"密码错误"];
            return;
        }
        //检查是否保存用户密码
        [self checkSave];
        //切换控制器
        self.view.window.rootViewController = [[YSMainViewController alloc]init];
    });

    
}

#pragma mark -检查是否保存用户密码
-(void)checkSave
{
    //这里不进行数据加密，仅作为测试保存帐户到属性列表
    [self.userdefault setObject:self.accountField.text forKey:@"account"];
    [self.userdefault setBool:[self.rememberPwdButton isSelected] forKey:@"rememberPassword"];
    [self.userdefault setBool:[self.autoLoginButton isSelected] forKey:@"autoLogin"];
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)firstObject];
    NSLog(@"%@",path);
    if ([self.rememberPwdButton isSelected]) {
        //保存密码
        [self.userdefault setObject:self.pwdField.text forKey:@"password"];
    }
    //同步数据到沙盒/library/preferences
    [self.userdefault synchronize];
}


#pragma mark -记住密码或自动登陆按钮点击事件
- (IBAction)rememberORautoClick:(UIButton *)sender {
    
    if (sender == self.rememberPwdButton) {//点击的是记住密码按钮
        if(sender.selected){//原记住密码按钮是选中状态
            self.autoLoginButton.selected = NO;
        }
            
    }else{//点击的是自动登陆按钮
        if (!sender.selected) {//原自动登陆按钮是选中状态
            self.rememberPwdButton.selected = YES;
        }
    }
    sender.selected = !sender.selected;
    
}


#pragma mark -弹出错误框
-(void)showErr:(NSString *)errMsg
{
    
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"登陆失败" message:errMsg delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alert show];
    
    /**
     *  整个登陆框抖动
     */
    CAKeyframeAnimation *shake = [CAKeyframeAnimation animation];
    shake.keyPath = @"transform.translation.x";
    shake.values = @[@0 , @shakeValue ,@-shakeValue, @0];
    shake.repeatCount = 3;
    shake.duration = 0.1;
    
    [self.LoginView.layer addAnimation:shake forKey:nil];
}

#pragma mark -触摸非输入view使键盘隐藏
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}


#pragma mark -accountField,pwdField代理方法处理return key
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField == self.accountField) {
        [self.pwdField becomeFirstResponder];
    }else{
        [self LoginButtonClick];
    }
    return YES;
}
@end
