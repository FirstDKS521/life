//
//  LSHHomeTableViewCell.m
//  乐生活
//
//  Created by aDu on 16/1/31.
//  Copyright © 2016年 aDu. All rights reserved.
//

#import "LSHHomeTableViewCell.h"
#import "Header.h"

@interface LSHHomeTableViewCell ()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) UILabel *lookLabel;
@property (nonatomic, strong) UIImageView *lookImage;
@property (nonatomic, strong) UIImageView *image;

@end

@implementation LSHHomeTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.contentView.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.titleLabel];
        [self addSubview:self.timeLabel];
        [self addSubview:self.lookImage];
        [self addSubview:self.lookLabel];
        [self addSubview:self.image];
        
        [self initConstraint];
    }
    return self;
}

- (void)initConstraint
{
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(16);
        make.top.equalTo(self.mas_top).offset(5);
        make.width.equalTo(@250);
        make.height.equalTo(@30);
    }];
    
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(16);
        make.bottom.equalTo(self.mas_bottom).offset(-5);
        make.width.equalTo(@80);
        make.height.equalTo(@30);
    }];
    
    [self.lookImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.timeLabel.mas_right).offset(5);
        make.bottom.equalTo(self.mas_bottom).offset(-15);
        make.width.equalTo(@15);
        make.height.equalTo(@10);
    }];
    
    [self.lookLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.lookImage.mas_right).offset(5);
        make.bottom.equalTo(self.mas_bottom).offset(-5);
        make.width.equalTo(@40);
        make.height.equalTo(@30);
    }];
    
    [self.image mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right).offset(-16);
        make.top.equalTo(self.mas_top).offset(10);
        make.width.equalTo(@55);
        make.height.equalTo(@55);
    }];
}

#pragma mark - 初始化

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont systemFontOfSize:K_Font_Size];
        _titleLabel.text = @"这些全部是测试数据，加油少年";
    }
    return _titleLabel;
}

- (UILabel *)timeLabel
{
    if (!_timeLabel) {
        _timeLabel = [[UILabel alloc] init];
        _timeLabel.font = [UIFont systemFontOfSize:13.0];
        _timeLabel.text = @"2016-1-30";
        _timeLabel.textColor = [UIColor colorWithWhite:0.659 alpha:1.000];
    }
    return _timeLabel;
}

- (UIImageView *)lookImage
{
    if (!_lookImage) {
        _lookImage = [[UIImageView alloc] init];
        _lookImage.image = [UIImage imageNamed:@"yulan_2_08"];
    }
    return _lookImage;
}

- (UILabel *)lookLabel
{
    if (!_lookLabel) {
        _lookLabel = [[UILabel alloc] init];
        _lookLabel.font = [UIFont systemFontOfSize:13.0];
        _lookLabel.textColor = [UIColor colorWithWhite:0.659 alpha:1.000];
        _lookLabel.text = @"2344";
    }
    return _lookLabel;
}

- (UIImageView *)image
{
    if (!_image) {
        _image = [[UIImageView alloc] init];
        _image.backgroundColor = [UIColor orangeColor];
    }
    return _image;
}

@end
