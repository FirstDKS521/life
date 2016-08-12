//
//  LSHPasswordViewController.m
//  乐生活
//
//  Created by aDu on 16/1/27.
//  Copyright © 2016年 aDu. All rights reserved.
//

#import "LSHPasswordViewController.h"
#import "LSHLoginUrl.h"
#import "Header.h"

@interface LSHPasswordViewController ()

@property (nonatomic, strong) UITextField *passwordField;

@end

@implementation LSHPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"注册";
    
    [self.view addSubview:self.passwordField];
    [self.passwordField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(16);
        make.top.equalTo(self.view.mas_top).offset(30);
        make.right.equalTo(self.view.mas_right).offset(-16);
        make.height.equalTo(@40);
    }];
    [self leftField:self.passwordField name:@"mima_08"];
    
    UIButton *sureButton = [UIButton buttonWithType:UIButtonTypeCustom];
    sureButton.backgroundColor = [UIColor lsh_greenColor];
    [sureButton addTarget:self action:@selector(nextMathod:) forControlEvents:UIControlEventTouchUpInside];
    [sureButton setTitle:@"确定" forState:UIControlStateNormal];
    sureButton.titleLabel.font = [UIFont systemFontOfSize:16];
    sureButton.layer.cornerRadius = 4.0;
    [self.view addSubview:sureButton];
    [sureButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(16);
        make.top.equalTo(self.passwordField.mas_bottom).offset(16);
        make.right.equalTo(self.view.mas_right).offset(-16);
        make.height.equalTo(@40);
    }];
}

- (void)nextMathod:(UIButton *)button
{
    if (self.passwordField.text.length < 6 || self.passwordField.text.length > 15) {
        [self cnn_toast:@"密码在6到15位之间"];
        return;
    }
    NSDictionary *dic = @{@"mobile":self.phoneNumber, @"password":self.passwordField.text};
    __weak LSHPasswordViewController *vc = self;
    [LSHNetworkingManager postWithURLString:[LSHLoginUrl doreGistUrl] parameters:dic success:^(NSDictionary *data) {
        [vc cnn_toast:data[@"msg"]];
        if ([[data[@"success"] stringValue] isEqualToString:@"1"]) {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [vc.navigationController popToRootViewControllerAnimated:YES];
            });
        }
    } failure:^(NSError *error) {
        
    }];
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
    }
    return _passwordField;
}

//取消第一响应者
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

@end
