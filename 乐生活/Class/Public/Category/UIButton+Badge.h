//
//  UIButton+Badge.h
//  乐生活
//
//  Created by aDu on 16/2/16.
//  Copyright © 2016年 aDu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Badge)

- (void)showBadgeOnItemIndex:(id)sender;   //显示小红点
- (void)hideBadgeOnItemIndex:(id)sender; //隐藏小红点
- (void)selectBtn:(UIButton *)sender;

@end
