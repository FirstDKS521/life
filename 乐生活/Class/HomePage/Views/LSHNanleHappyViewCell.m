//
//  LSHNanleHappyViewCell.m
//  乐生活
//
//  Created by aDu on 16/2/12.
//  Copyright © 2016年 aDu. All rights reserved.
//

#import "LSHNanleHappyViewCell.h"
#import "Header.h"

@implementation LSHNanleHappyViewCell

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
            make.bottom.equalTo(self.mas_bottom);
            make.left.equalTo(self.mas_left).offset(16);
            make.width.equalTo(@150);
        }];
        
        [self.button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.mas_top).offset(15);
            make.bottom.equalTo(self.mas_bottom).offset(-15);
            make.right.equalTo(self.mas_right).offset(-16);
            make.width.equalTo(@80);
        }];
    }
    return self;
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

- (UIButton *)button
{
    if (!_button) {
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:_button];
    }
    return _button;
}

@end
