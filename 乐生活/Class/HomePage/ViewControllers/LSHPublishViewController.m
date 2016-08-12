//
//  LSHPublishViewController.m
//  乐生活
//
//  Created by aDu on 16/2/13.
//  Copyright © 2016年 aDu. All rights reserved.
//

#import "LSHPublishViewController.h"
#import "Header.h"

@interface LSHPublishViewController ()

@property (nonatomic, strong) UITextField *textField;
@property (nonatomic, strong) UITextView *textView;
@property (nonatomic, strong) UITextField *phoneField;

@end

@implementation LSHPublishViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"发表" style:UIBarButtonItemStyleDone target:self action:@selector(rightBarButtonItem:)];
    [self addView];
}

- (void)addView
{
    [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(10);
        make.left.equalTo(self.view.mas_left).offset(16);
        make.right.equalTo(self.view.mas_right).offset(-16);
        make.height.equalTo(@30);
    }];
    
    [self.textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.textField.mas_bottom).offset(10);
        make.left.equalTo(self.view.mas_left).offset(16);
        make.right.equalTo(self.view.mas_right).offset(-16);
        make.height.equalTo(@120);
    }];
    
    if ([self.title isEqualToString:@"发表需求"]) {
        [self.phoneField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.textView.mas_bottom).offset(40);
            make.left.equalTo(self.view.mas_left).offset(16);
            make.right.equalTo(self.view.mas_right).offset(-16);
            make.height.equalTo(@30);
        }];
    }
}

- (void)rightBarButtonItem:(UIBarButtonItem *)item
{
    
}

#pragma mark - UITextViewDelegate

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView
{
    if ([textView.text hasPrefix:@"请输入内容"]) {
        textView.text = @"";
    }
    textView.textColor = [UIColor blackColor];
    return YES;
}

#pragma mark - init

- (UITextField *)textField
{
    if (!_textField) {
        _textField = [[UITextField alloc] init];
        _textField.placeholder = @"    请输入标题（最多30个字）";
        _textField.layer.cornerRadius = 4.0;
        _textField.backgroundColor = [UIColor colorWithWhite:0.945 alpha:1.000];
        _textField.font = [UIFont systemFontOfSize:13];
        [self.view addSubview:_textField];
    }
    return _textField;
}

- (UITextView *)textView
{
    if (!_textView) {
        _textView = [[UITextView alloc] init];
        self.textView.textColor = [UIColor lsh_grayColor];
        _textView.backgroundColor = [UIColor colorWithWhite:0.945 alpha:1.000];
        _textView.delegate = self;
        _textView.layer.cornerRadius = 4.0;
        _textView.font = [UIFont systemFontOfSize:13];
        _textView.text = @"请输入内容";
        [self.view addSubview:_textView];
    }
    return _textView;
}

- (UITextField *)phoneField
{
    if (!_phoneField) {
        _phoneField = [[UITextField alloc] init];
        _phoneField.placeholder = @"    请输入您的手机号码：";
        _phoneField.backgroundColor = [UIColor colorWithWhite:0.945 alpha:1.000];
        _phoneField.layer.cornerRadius = 4.0;
        _phoneField.font = [UIFont systemFontOfSize:13];
        [self.view addSubview:_phoneField];
    }
    return _phoneField;
}

@end
