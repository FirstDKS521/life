//
//  LSHPersonHeadView.m
//  乐生活
//
//  Created by aDu on 16/2/9.
//  Copyright © 2016年 aDu. All rights reserved.
//

#import "LSHPersonHeadView.h"
#import "UIButton+Badge.h"
#import "Header.h"

@interface LSHPersonHeadView ()

@property (nonatomic, strong) UILabel *tieZiLabel;
@property (nonatomic, strong) UILabel *jianYiLabel;
@property (nonatomic, strong) UILabel *xuQiuLabel;

@end

@implementation LSHPersonHeadView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self.jianYiButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.mas_centerX);
            make.top.equalTo(self.mas_top).offset(10);
            make.height.equalTo(@30);
            make.width.equalTo(@30);
        }];

        [self.jianYiLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.jianYiButton.mas_bottom);
            make.height.equalTo(@20);
            make.width.equalTo(@80);
            make.centerX.equalTo(self.jianYiButton.mas_centerX);
        }];
        
        [self.tieZiButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.mas_top).offset(10);
            make.right.equalTo(self.jianYiButton.mas_left).offset(-60);
            make.height.equalTo(@30);
            make.width.equalTo(@30);
        }];
        
        [self.tieZiLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.jianYiButton.mas_bottom);
            make.height.equalTo(@20);
            make.width.equalTo(@80);
            make.centerX.equalTo(self.tieZiButton.mas_centerX);
        }];
        
        [self.xuQiuButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.mas_top).offset(10);
            make.left.equalTo(self.jianYiButton.mas_right).offset(60);
            make.height.equalTo(@30);
            make.width.equalTo(@30);
        }];
        
        [self.xuQiuLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.xuQiuButton.mas_bottom);
            make.height.equalTo(@20);
            make.width.equalTo(@80);
            make.centerX.equalTo(self.xuQiuButton.mas_centerX);
        }];
        
        UIView *line = [[UIView alloc] init];
        line.backgroundColor = [UIColor colorWithRed:0.910 green:0.914 blue:0.910 alpha:1.000];
        [self addSubview:line];
        [line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.and.right.equalTo(self);
            make.height.equalTo(@0.5);
            make.top.equalTo(self.xuQiuLabel.mas_bottom).offset(10);
        }];
    }
    return self;
}

#pragma mark - init

- (UIButton *)tieZiButton
{
    if (!_tieZiButton) {
        _tieZiButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_tieZiButton setBackgroundImage:[UIImage imageNamed:@"huifu_3_08"] forState:UIControlStateNormal];
        [self addSubview:_tieZiButton];
    }
    return _tieZiButton;
}

- (UIButton *)jianYiButton
{
    if (!_jianYiButton) {
        _jianYiButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_jianYiButton setBackgroundImage:[UIImage imageNamed:@"huifu_2_08"] forState:UIControlStateNormal];
        [self addSubview:_jianYiButton];
    }
    return _jianYiButton;
}

- (UIButton *)xuQiuButton
{
    if (!_xuQiuButton) {
        _xuQiuButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_xuQiuButton setBackgroundImage:[UIImage imageNamed:@"huifu_1_08"] forState:UIControlStateNormal];
        [self addSubview:_xuQiuButton];
    }
    return _xuQiuButton;
}

- (UILabel *)tieZiLabel
{
    if (!_tieZiLabel) {
        _tieZiLabel = [[UILabel alloc] init];
        _tieZiLabel.textAlignment = NSTextAlignmentCenter;
        _tieZiLabel.font = [UIFont systemFontOfSize:11];
        _tieZiLabel.textColor = [UIColor lsh_grayColor];
        _tieZiLabel.text = @"最新帖子回复";
        [self addSubview:_tieZiLabel];
    }
    return _tieZiLabel;
}

- (UILabel *)jianYiLabel
{
    if (!_jianYiLabel) {
        _jianYiLabel = [[UILabel alloc] init];
        _jianYiLabel.textAlignment = NSTextAlignmentCenter;
        _jianYiLabel.font = [UIFont systemFontOfSize:11];
        _jianYiLabel.textColor = [UIColor lsh_grayColor];
        _jianYiLabel.text = @"最新建议回复";
        [self addSubview:_jianYiLabel];
    }
    return _jianYiLabel;
}

- (UILabel *)xuQiuLabel
{
    if (!_xuQiuLabel) {
        _xuQiuLabel = [[UILabel alloc] init];
        _xuQiuLabel.textAlignment = NSTextAlignmentCenter;
        _xuQiuLabel.font = [UIFont systemFontOfSize:11];
        _xuQiuLabel.textColor = [UIColor lsh_grayColor];
        _xuQiuLabel.text = @"最新需求回复";
        [self addSubview:_xuQiuLabel];
    }
    return _xuQiuLabel;
}

@end
