//
//  LSHRegisterViewController.m
//  乐生活
//
//  Created by aDu on 16/1/25.
//  Copyright © 2016年 aDu. All rights reserved.
//

#import "LSHRegisterViewController.h"
#import "LSHPasswordViewController.h"
#import "LSHFindPassViewController.h"
#import "LSHLoginUrl.h"
#import "Header.h"

@interface LSHRegisterViewController ()<UITextFieldDelegate>

@property (strong, nonatomic) UITextField *userField;
@property (strong, nonatomic) UITextField *codeField;
@property (nonatomic, strong) UIButton *codeButton;
@property (nonatomic, strong) NSNumber *time;
@property (nonatomic, strong) NSTimer *timer;

@property (nonatomic, copy) NSString *path;

@end

@implementation LSHRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.userField];
    [self.view addSubview:self.codeField];
    if ([self.title isEqualToString:@"注册"]) {
        self.path = @"reg";
    } else {
        self.path = @"pwd";
    }
    [self addView];
}

//加载试视图
- (void)addView
{
    [self.userField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(16);
        make.top.equalTo(self.view.mas_top).offset(30);
        make.right.equalTo(self.view.mas_right).offset(-16);
        make.height.equalTo(@50);
    }];
    [self leftField:self.userField name:@"call_08"];
    
    [self.codeField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(16);
        make.top.equalTo(self.userField.mas_bottom).offset(16);
        make.right.equalTo(self.view.mas_right).offset(-16);
        make.height.equalTo(@50);
    }];
    [self leftField:self.codeField name:@"renzheng_08"];

    
    self.codeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.codeButton.backgroundColor = [UIColor colorWithRed:0.635 green:0.639 blue:0.639 alpha:0.8];
    [self.codeButton addTarget:self action:@selector(sendCode:) forControlEvents:UIControlEventTouchUpInside];
    [self.codeButton setTitle:@"获取短信验证码" forState:UIControlStateNormal];
    self.codeButton.titleLabel.font = [UIFont systemFontOfSize:13];
    self.codeButton.layer.cornerRadius = 4.0;
    [self.view addSubview:self.codeButton];
    [self.codeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.userField.mas_bottom).offset(16);
        make.right.equalTo(self.view.mas_right).offset(-16);
        make.width.equalTo(@120);
        make.height.equalTo(@50);
    }];
    
    UIButton *nextButton = [UIButton buttonWithType:UIButtonTypeCustom];
    nextButton.backgroundColor = [UIColor lsh_greenColor];
    [nextButton addTarget:self action:@selector(nextMathod:) forControlEvents:UIControlEventTouchUpInside];
    [nextButton setTitle:@"下一步" forState:UIControlStateNormal];
    nextButton.layer.cornerRadius = 4.0;
    nextButton.titleLabel.font = [UIFont systemFontOfSize:16];
    [self.view addSubview:nextButton];
    [nextButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(16);
        make.top.equalTo(self.codeButton.mas_bottom).offset(30);
        make.right.equalTo(self.view.mas_right).offset(-16);
        make.height.equalTo(@50);
    }];
}

#pragma mark - 方法

//获取验证码
- (void)sendCode:(UIButton *)button
{
    if (self.userField.text.length != 11) {
        [self cnn_toast:@"请输入手机号码"];
        return;
    }
    button.userInteractionEnabled = NO;
    __weak LSHRegisterViewController *vc = self;
    NSDictionary *dic = @{@"mobile":self.userField.text, @"type":self.path};
    [LSHNetworkingManager postWithURLString:[LSHLoginUrl getCodeUrl] parameters:dic success:^(NSDictionary *data) {
        [vc cnn_toast:data[@"msg"]];
    } failure:^(NSError *error) {
        
    }];
    self.time = @60;
    [button setTitle:[NSString stringWithFormat:@"%@秒", self.time] forState:UIControlStateNormal];
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeButton) userInfo:nil repeats:YES];
}

- (void)timeButton
{
    NSInteger integer = [self.time integerValue];
    integer--;
    self.time = [NSNumber numberWithInteger:integer];
    if (integer != 0) {
        [self.codeButton setTitle:[NSString stringWithFormat:@"%@秒", self.time] forState:UIControlStateNormal];
    } else {
        [self.codeButton setTitle:@"获取短信验证码" forState:UIControlStateNormal];
        self.codeButton.userInteractionEnabled = YES;
        [self.timer invalidate];
    }
}

//下一步
- (void)nextMathod:(UIButton *)button
{
    if (self.userField.text.length == 0 || self.codeField.text.length == 0) {
        [self cnn_toast:@"请输入手机号或验证码"];
        return;
    }
    NSDictionary *dic = @{@"mobile":self.userField.text, @"code":self.codeField.text, @"type":self.path};
    __weak LSHRegisterViewController *vc = self;
    [LSHNetworkingManager postWithURLString:[LSHLoginUrl valCodeUrl] parameters:dic success:^(NSDictionary *data) {
        [vc cnn_toast:data[@"msg"]];
        if ([[data[@"success"] stringValue] isEqualToString:@"1"]) {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                if ([vc.witchView isEqualToString:@"findPass"]) {
                    LSHFindPassViewController *findVC = [[LSHFindPassViewController alloc] init];
                    findVC.phoneNumber = vc.userField.text;
                    [vc.navigationController pushViewController:findVC animated:YES];
                } else {
                    LSHPasswordViewController *passVC = [[LSHPasswordViewController alloc] init];
                    passVC.phoneNumber = vc.userField.text;
                    [vc.navigationController pushViewController:passVC animated:YES];
                }
            });
        }
    } failure:^(NSError *error) {
        
    }];
}

#pragma mark - UITextField

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if (textField.text.length == 10) {
        self.codeButton.backgroundColor = [UIColor lsh_greenColor];
    }
    return YES;
}

#pragma mark - 初始化属性

- (UITextField *)userField
{
    if (!_userField) {
        _userField = [[UITextField alloc] init];
        _userField.backgroundColor = [UIColor colorWithRed:0.941 green:0.961 blue:0.957 alpha:1.000];
        _userField.placeholder = @"请输入手机号码";
        _userField.layer.cornerRadius = 4.0;
        _userField.delegate = self;
        _userField.clearButtonMode = UITextFieldViewModeAlways;
        _userField.font = [UIFont systemFontOfSize:13];
    }
    return _userField;
}

- (UITextField *)codeField
{
    if (!_codeField) {
        _codeField = [[UITextField alloc] init];
        _codeField.backgroundColor = [UIColor colorWithRed:0.941 green:0.961 blue:0.957 alpha:1.000];
        _codeField.placeholder = @"请输入短信验证码";
        _codeField.layer.cornerRadius = 4.0;
        _codeField.clearButtonMode = UITextFieldViewModeAlways;
        _codeField.font = [UIFont systemFontOfSize:13];
    }
    return _codeField;
}

//取消第一响应者
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

@end
