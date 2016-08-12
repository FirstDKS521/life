//
//  LSHGovernmentViewCell.m
//  乐生活
//
//  Created by aDu on 16/2/2.
//  Copyright © 2016年 aDu. All rights reserved.
//

#import "LSHGovernmentViewCell.h"
#import "LSHNewsModel.h"
#import "NSString+LSHString.h"
#import "Header.h"

@implementation LSHGovernmentViewCell

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
            make.top.equalTo(self.mas_top);
            make.left.equalTo(@16);
            make.bottom.equalTo(self.mas_bottom);
            make.width.equalTo(@240);
        }];
        
        [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.mas_top);
            make.left.equalTo(self.titleLabel.mas_right);
            make.bottom.equalTo(self.mas_bottom);
            make.right.equalTo(self.mas_right).offset(-30);
        }];
    }
    return self;
}

- (void)setModel:(LSHNewsModel *)model
{
    if (_model != model) {
        self.titleLabel.text = model.content;
        self.timeLabel.text = [NSString getTime:model.addTime];
    }
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
        _timeLabel.font = [UIFont systemFontOfSize:K_Font_Size];
        _timeLabel.textColor = [UIColor lsh_grayColor];
        _timeLabel.textAlignment = NSTextAlignmentRight;
        [self addSubview:_timeLabel];
    }
    return _timeLabel;
}

@end
