//
//  LSHFindPassViewController.m
//  乐生活
//
//  Created by aDu on 16/1/27.
//  Copyright © 2016年 aDu. All rights reserved.
//

#import "LSHFindPassViewController.h"
#import "LSHLoginUrl.h"
#import "Header.h"

@interface LSHFindPassViewController ()

@property (nonatomic, strong) UITextField *passwordField;
@property (nonatomic, strong) UITextField *surePassField;

@end

@implementation LSHFindPassViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"找回密码";
    
    [self.view addSubview:self.passwordField];
    [self.passwordField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(16);
        make.top.equalTo(self.view.mas_top).offset(30);
        make.right.equalTo(self.view.mas_right).offset(-16);
        make.height.equalTo(@40);
    }];
    [self leftField:self.passwordField name:@"mima_08"];
    
    [self.view addSubview:self.surePassField];
    [self.surePassField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(16);
        make.top.equalTo(self.passwordField.mas_bottom).offset(16);
        make.right.equalTo(self.view.mas_right).offset(-16);
        make.height.equalTo(@40);
    }];
    [self leftField:self.surePassField name:@"queren_08"];
    
    UIButton *sureButton = [UIButton buttonWithType:UIButtonTypeCustom];
    sureButton.backgroundColor = [UIColor lsh_greenColor];
    [sureButton addTarget:self action:@selector(surePassWord) forControlEvents:UIControlEventTouchUpInside];
    [sureButton setTitle:@"确定" forState:UIControlStateNormal];
    sureButton.titleLabel.font = [UIFont systemFontOfSize:14];
    sureButton.layer.cornerRadius = 4.0;
    [self.view addSubview:sureButton];
    [sureButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(16);
        make.top.equalTo(self.surePassField.mas_bottom).offset(16);
        make.right.equalTo(self.view.mas_right).offset(-16);
        make.height.equalTo(@40);
    }];
    
}

//确定
- (void)surePassWord
{
    __weak LSHFindPassViewController *vc = self;
    if (self.passwordField.text.length != 0 && self.surePassField.text.length != 0 && [self.passwordField.text isEqualToString:self.surePassField.text]) {
        [LSHNetworkingManager postWithURLString:[LSHLoginUrl findCommitUrl] parameters:@{@"mobile":self.phoneNumber, @"newpassword":self.surePassField.text} success:^(NSDictionary *data) {
            [vc cnn_toast:data[@"msg"]];
            if ([[data[@"success"] stringValue] isEqualToString:@"1"]) {
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    [vc.navigationController popToRootViewControllerAnimated:YES];
                });
            }
        } failure:^(NSError *error) {
            
        }];
    } else {
        [self cnn_toast:@"密码输入有误"];
    }
}

#pragma mark - init

- (UITextField *)passwordField
{
    if (!_passwordField) {
        _passwordField = [[UITextField alloc] init];
        _passwordField.backgroundColor =  [UIColor colorWithRed:0.941 green:0.961 blue:0.957 alpha:1.000];
        _passwordField.placeholder = @"请输入新的密码";
        _passwordField.font = [UIFont systemFontOfSize:14];
        _passwordField.clearButtonMode = UITextFieldViewModeAlways;
        _passwordField.secureTextEntry = YES;
        _passwordField.layer.cornerRadius = 4.0;
    }
    return _passwordField;
}

- (UITextField *)surePassField
{
    if (!_surePassField) {
        _surePassField = [[UITextField alloc] init];
        _surePassField.backgroundColor =  [UIColor colorWithRed:0.941 green:0.961 blue:0.957 alpha:1.000];
        _surePassField.placeholder = @"请确认新的密码";
        _surePassField.font = [UIFont systemFontOfSize:14];
        _surePassField.clearButtonMode = UITextFieldViewModeAlways;
        _surePassField.secureTextEntry = YES;
        _surePassField.layer.cornerRadius = 4.0;
    }
    return _surePassField;
}

//取消第一响应者
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

@end
