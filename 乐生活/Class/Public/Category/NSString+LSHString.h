//
//  NSString+LSHString.h
//  乐生活
//
//  Created by aDu on 16/3/21.
//  Copyright © 2016年 aDu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (LSHString)

/**
 * 时间戳转时间
 */
+ (NSString *)getTime:(NSString *)number;

/**
 * 时间戳带分钟
 */
+ (NSString *)getTimes:(NSString *)number;

/**
 * 获取设备的UDID
 */
+ (NSString *)getUUID;

@end
