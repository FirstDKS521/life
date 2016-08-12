//
//  UIColor+LSHColor.m
//  乐生活
//
//  Created by aDu on 16/1/26.
//  Copyright © 2016年 aDu. All rights reserved.
//

#import "UIColor+LSHColor.h"

@implementation UIColor (LSHColor)

+ (UIColor *)cnn_colorWithHexString:(NSString *)str
{
    return [UIColor cnn_colorWithHexString:str alpha:1.0];
}

+ (UIColor *)cnn_colorWithHexString:(NSString *)str alpha:(CGFloat)alpha
{
    const char *cStr = [str cStringUsingEncoding:NSASCIIStringEncoding];
    long x = strtol(cStr+1, NULL, 16);
    return [UIColor cnn_colorWithHex:x alpha:alpha];
}

+ (UIColor *)cnn_colorWithHex:(long)col alpha:(CGFloat)alpha
{
    unsigned char r, g, b;
    b = col & 0xFF;
    g = (col >> 8) & 0xFF;
    r = (col >> 16) & 0xFF;
    return [UIColor colorWithRed:(float)r/255.0f green:(float)g/255.0f blue:(float)b/255.0f alpha:alpha];
}

+ (UIColor *)lsh_greenColor
{
    return [UIColor colorWithRed:0.424 green:0.675 blue:0.184 alpha:1.000];
}

+ (UIColor *)lsh_grayColor
{
    return [UIColor colorWithWhite:0.679 alpha:1.000];;
}

+ (UIColor *)lsh_lineColor
{
    return [UIColor colorWithRed:0.910 green:0.914 blue:0.910 alpha:1.000];
}

@end
