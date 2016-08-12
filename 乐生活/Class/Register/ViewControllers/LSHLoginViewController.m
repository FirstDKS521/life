//
//  LSHLoginViewController.m
//  乐生活
//
//  Created by aDu on 16/1/25.
//  Copyright © 2016年 aDu. All rights reserved.
//

#import "LSHLoginViewController.h"
#import "LSHRegisterViewController.h"
#import "LSHRootViewController.h"
#import "LSHLoginUrl.h"
#import "NSString+LSHString.h"
#import "Header.h"

@interface LSHLoginViewController ()<UITextFieldDelegate>

@end

@implementation LSHLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"登录";
    
    [self.view addSubview:self.imageView];
    [self.view addSubview:self.userField];
    [self.view addSubview:self.passwordField];
    [self.view addSubview:self.loginButton];
    [self.view addSubview:self.registerButton];
    [self.view addSubview:self.forgetButton];
    
    [self addView];
}

//加载试视图
- (void)addView
{
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(0);
        make.top.equalTo(self.view.mas_top).offset(0);
        make.right.equalTo(self.view.mas_right).offset(0);
        make.height.equalTo(@150);
    }];
    
    [self.userField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(16);
        make.top.equalTo(self.imageView.mas_bottom).offset(30);
        make.right.equalTo(self.view.mas_right).offset(-16);
        make.height.equalTo(@40);
    }];
    [self leftField:self.userField name:@"call_08"];
    
    [self.passwordField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(16);
        make.top.equalTo(self.userField.mas_bottom).offset(16);
        make.right.equalTo(self.view.mas_right).offset(-16);
        make.height.equalTo(@40);
    }];
    [self leftField:self.passwordField name:@"mima_08"];

    [self.loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(16);
        make.top.equalTo(self.passwordField.mas_bottom).offset(22);
        make.right.equalTo(self.view.mas_right).offset(-16);
        make.height.equalTo(@40);
    }];
    
    [self.registerButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.loginButton.mas_bottom).offset(20);
        make.right.equalTo(self.loginButton.mas_centerX).offset(-15);
        make.height.equalTo(@20);
        make.width.equalTo(@60);
    }];
    
    [self.forgetButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.loginButton.mas_bottom).offset(20);
        make.left.equalTo(self.loginButton.mas_centerX).offset(15);
        make.height.equalTo(@20);
        make.width.equalTo(@60);
    }];
}

/**
 *登录
 */
- (void)loginButton:(id)sender
{
    __weak LSHLoginViewController *loginVC = self;
    NSDictionary *dic = @{@"mobile":self.userField.text, @"password":self.passwordField.text, @"imei":[NSString getUUID]};
    if (self.userField.text.length != 0 || self.passwordField.text.length != 0) {
        [LSHNetworkingManager postWithURLString:[LSHLoginUrl loginUrl] parameters:dic success:^(NSDictionary *data) {
            [loginVC cnn_toastProgressWithContent:data[@"msg"] hideBlock:nil];
            if ([[data[@"success"] stringValue] isEqualToString:@"1"]) {
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    [K_UserDefaults setObject:loginVC.userField.text forKey:K_UserID];
                    loginVC.view.window.rootViewController = [[LSHRootViewController alloc] init];
                });
            }
        } failure:^(NSError *error) {
            
        }];
    } else {
        [self cnn_toast:@"账号或密码错误"];
    }
}

/**
 *注册账户
 */
- (void)registerButton:(id)sender
{
    LSHRegisterViewController * registerVC = [[LSHRegisterViewController alloc] init];
    registerVC.title = @"注册";
    [self.navigationController pushViewController:registerVC animated:YES];
}

/**
 *找回密码
 */
- (void)forgetButton:(id)sender
{
    LSHRegisterViewController * registerVC = [[LSHRegisterViewController alloc] init];
    registerVC.title = @"找回密码";
    registerVC.witchView = @"findPass";
    [self.navigationController pushViewController:registerVC animated:YES];
}

/**
 *如果是已经登录了
 */
- (void)isLogin
{
    LSHRootViewController *rootVC = [[LSHRootViewController alloc] init];
    [self.navigationController pushViewController:rootVC animated:NO];
}

/**
 *手机号码验证
 */
+ (BOOL)validateMobile:(NSString *)mobile
{
    if (mobile.length != 11) {
        return NO;
    }
    //手机号以13， 15，18开头，八个 \d 数字字符
    NSString *phoneRegex = @"^1[3|4|5|6|7|8|9][0-9]\\d{8}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:mobile];
}

#pragma mark - 初始化属性

- (UIImageView *)imageView
{
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
        _imageView.image = [UIImage imageNamed:@"dlu_mg_07"];
    }
    return _imageView;
}

- (UITextField *)userField
{
    if (!_userField) {
        _userField = [[UITextField alloc] init];
        _userField.backgroundColor = [UIColor colorWithRed:0.941 green:0.961 blue:0.957 alpha:1.000];
        _userField.placeholder = @"请输入手机号码";
        _userField.layer.cornerRadius = 4.0;
        _userField.delegate = self;
        _userField.clearButtonMode = UITextFieldViewModeAlways;
        _userField.font = [UIFont systemFontOfSize:14];
    }
    return _userField;
}

- (UITextField *)passwordField
{
    if (!_passwordField) {
        _passwordField = [[UITextField alloc] init];
        _passwordField.backgroundColor =  [UIColor colorWithRed:0.941 green:0.961 blue:0.957 alpha:1.000];
        _passwordField.placeholder = @"请输入登录密码";
        _passwordField.font = [UIFont systemFontOfSize:14];
        _passwordField.clearButtonMode = UITextFieldViewModeAlways;
        _passwordField.secureTextEntry = YES;
        _passwordField.layer.cornerRadius = 4.0;
        _passwordField.delegate = self;
    }
    return _passwordField;
}

- (UIButton *)loginButton
{
    if (!_loginButton) {
        _loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _loginButton.backgroundColor = [UIColor lsh_greenColor];
        [_loginButton setTitle:@"登录" forState:UIControlStateNormal];
        [_loginButton addTarget:self action:@selector(loginButton:) forControlEvents:UIControlEventTouchUpInside];
        _loginButton.titleLabel.font = [UIFont systemFontOfSize:16];
        _loginButton.layer.cornerRadius = 4.0;
    }
    return _loginButton;
}

- (UIButton *)registerButton
{
    if (!_registerButton) {
        _registerButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_registerButton setTitleColor:[UIColor colorWithRed:0.604 green:0.773 blue:0.451 alpha:1.000] forState:UIControlStateNormal];
        [_registerButton setTitle:@"免费注册" forState:UIControlStateNormal];
        [_registerButton addTarget:self action:@selector(registerButton:) forControlEvents:UIControlEventTouchUpInside];
        _registerButton.titleLabel.font = [UIFont systemFontOfSize:12];
    }
    return _registerButton;
}

- (UIButton *)forgetButton
{
    if (!_forgetButton) {
        _forgetButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_forgetButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_forgetButton setTitle:@"忘记密码？" forState:UIControlStateNormal];
        [_forgetButton addTarget:self action:@selector(forgetButton:) forControlEvents:UIControlEventTouchUpInside];
        _forgetButton.titleLabel.font = [UIFont systemFontOfSize:12];
    }
    return _forgetButton;
}

#pragma mark - 键盘处理

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

@end
