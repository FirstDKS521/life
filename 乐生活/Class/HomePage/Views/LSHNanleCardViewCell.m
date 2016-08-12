//
//  LSHNanleCardViewCell.m
//  乐生活
//
//  Created by aDu on 16/2/12.
//  Copyright © 2016年 aDu. All rights reserved.
//

#import "LSHNanleCardViewCell.h"
#import "LSHHomeModel.h"
#import "NSString+LSHString.h"
#import "Header.h"

@interface LSHNanleCardViewCell ()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) UILabel *numberLabel;

@end

@implementation LSHNanleCardViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.mas_top).offset(2);
            make.left.equalTo(self.mas_left).offset(16);
            make.width.equalTo(@200);
            make.height.equalTo(@20);
        }];
        
        [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.titleLabel.mas_bottom);
            make.bottom.equalTo(self.mas_bottom);
            make.left.equalTo(self.mas_left).offset(16);
            make.width.equalTo(@200);
        }];
        
        [self.numberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.mas_bottom);
            make.right.equalTo(self.mas_right).offset(-16);
            make.width.equalTo(@80);
            make.height.equalTo(@22);
        }];
    }
    return self;
}

- (void)setModel:(LSHHomeModel *)model
{
    if (_model != model) {
        _titleLabel.text = model.title;
        _timeLabel.text = [NSString getTimes:model.addTime];
        _numberLabel.text = [NSString stringWithFormat:@"%ld回帖", model.visitTimes];
    }
    _model = model;
}

#pragma mark - init

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont systemFontOfSize:K_Font_Size];
        [self addSubview:_titleLabel];
    }
    return _titleLabel;
}

- (UILabel *)timeLabel
{
    if (!_timeLabel) {
        _timeLabel = [[UILabel alloc] init];
        _timeLabel.font = [UIFont systemFontOfSize:13];
        _timeLabel.textColor = [UIColor lsh_grayColor];
        [self addSubview:_timeLabel];
    }
    return _timeLabel;
}

- (UILabel *)numberLabel
{
    if (!_numberLabel) {
        _numberLabel = [[UILabel alloc] init];
        _numberLabel.font = [UIFont systemFontOfSize:13];
        _numberLabel.textAlignment = NSTextAlignmentRight;
        _numberLabel.textColor = [UIColor lsh_grayColor];
        [self addSubview:_numberLabel];
    }
    return _numberLabel;
}

@end
