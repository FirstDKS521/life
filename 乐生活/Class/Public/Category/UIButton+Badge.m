//
//  UIButton+Badge.m
//  乐生活
//
//  Created by aDu on 16/2/16.
//  Copyright © 2016年 aDu. All rights reserved.
//

#import "UIButton+Badge.h"
#import "Header.h"

@implementation UIButton (Badge)

//显示小红点
- (void)showBadgeOnItemIndex:(id)sender{
    //移除之前的小红点
    [self removeBadgeOnItemIndex:sender];
    
    UIButton *btn = (UIButton *)sender;
    if(btn.tag ==0){
        return;
        
    }
    //新建小红点
    UIView *badgeView = [[UIView alloc]init];
    badgeView.tag = 888 + [sender tag];
    badgeView.layer.cornerRadius = 7;//圆形
    badgeView.backgroundColor = [UIColor redColor];//颜色：红色
    CGRect tabFrame = self.frame;
    
    
    if ([btn tag] == 0 ) {
        return;
    }
    //确定小红点的位置
    if ([btn.titleLabel.text isEqualToString:@"消息"]) {
        float percentX = btn.frame.size.width;
        CGFloat x = ceilf(percentX);
        CGFloat y = ceilf(0.1 * tabFrame.size.height - 1);
        badgeView.frame = CGRectMake(x, y, 14, 14);//圆形大小为10
    } else {
        float percentX = btn.frame.size.width;
        CGFloat x = ceilf(percentX);
        CGFloat y = ceilf(0.1 * tabFrame.size.height - 1);
        badgeView.frame = CGRectMake(x, y, 14, 14);//圆形大小为10
    }
    
    UILabel *lab = [[UILabel alloc]initWithFrame:badgeView.frame];
    lab.backgroundColor = [UIColor clearColor];
    
    lab.textAlignment = NSTextAlignmentCenter;
    lab.textColor = [UIColor whiteColor];
    
    if ([btn tag] < 99) {
        lab.text = [NSString stringWithFormat:@"%ld",(long)[btn tag]];
        lab.font = [UIFont fontWithName:@"Arial" size:10];
    } else {
        lab.text = @"···";
        lab.font = [UIFont fontWithName:@"Arial" size:10];
    }
    
    [self addSubview:badgeView];
    [self addSubview:lab];
}

//隐藏小红点
- (void)hideBadgeOnItemIndex:(id)sender{
    //移除小红点
    [self removeBadgeOnItemIndex:sender];
}

//移除小红点
- (void)removeBadgeOnItemIndex:(id)index{
    //按照tag值进行移除
    for (UIView *subView in self.subviews) {
        if (subView.tag == 888+[index tag]) {
            [subView removeFromSuperview];
        }
    }
}

/**
 *  点击的时候会调用这个方法去掉红点儿
 */
- (void)selectBtn:(UIButton *)sender
{
    if (sender.selected ==YES) {
        sender.selected = NO;
        [sender showBadgeOnItemIndex:sender];
    } else {
        sender.selected = YES;
        [sender hideBadgeOnItemIndex:sender];
    }
}

@end
