//
//  UIColor+LSHColor.h
//  乐生活
//
//  Created by aDu on 16/1/26.
//  Copyright © 2016年 aDu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (LSHColor)

+ (UIColor *)cnn_colorWithHexString:(NSString *)str;
+ (UIColor *)cnn_colorWithHex:(long)col alpha:(CGFloat)alpha;
+ (UIColor *)cnn_colorWithHexString:(NSString *)str alpha:(CGFloat)alpha;

/**
 *  主题颜色
 */
+ (UIColor *)lsh_greenColor;
/**
 *  灰色字体
 */
+ (UIColor *)lsh_grayColor;
/**
 *  灰色线条
 */
+ (UIColor *)lsh_lineColor;

@end
