//
//  LSHCompanyViewCell.h
//  乐生活
//
//  Created by aDu on 16/2/2.
//  Copyright © 2016年 aDu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LSHNewsModel;
@interface LSHCompanyViewCell : UITableViewCell

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) LSHNewsModel *model;

- (void)setModel:(LSHNewsModel *)model;

@end
