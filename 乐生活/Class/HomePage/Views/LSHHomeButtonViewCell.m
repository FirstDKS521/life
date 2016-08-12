//
//  LSHHomeButtonViewCell.m
//  乐生活
//
//  Created by aDu on 16/1/31.
//  Copyright © 2016年 aDu. All rights reserved.
//

#import "LSHHomeButtonViewCell.h"
#import "Header.h"

@implementation LSHHomeButtonViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        _label.font = [UIFont systemFontOfSize:14];
        _label.textColor = [UIColor whiteColor];
        _label.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_label];
    }
    return self;
}

@end
