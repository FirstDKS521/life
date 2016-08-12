//
//  NSString+LSHString.m
//  乐生活
//
//  Created by aDu on 16/3/21.
//  Copyright © 2016年 aDu. All rights reserved.
//

#import "NSString+LSHString.h"

@implementation NSString (LSHString)

+ (NSString *)getTime:(NSString *)number
{
    NSString * timeStampString = number;
    NSTimeInterval _interval=[timeStampString doubleValue] / 1000.0;
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:_interval];
    NSDateFormatter *objDateformat = [[NSDateFormatter alloc] init];
    [objDateformat setDateFormat:@"yyyy-MM-dd"];
    return [objDateformat stringFromDate:date];
}

+ (NSString *)getTimes:(NSString *)number
{
    NSString * timeStampString = number;
    NSTimeInterval _interval=[timeStampString doubleValue] / 1000.0;
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:_interval];
    NSDateFormatter *objDateformat = [[NSDateFormatter alloc] init];
    [objDateformat setDateFormat:@"yyyy-MM-dd HH:mm:ss.SSS"];
    return [objDateformat stringFromDate:date];
}

+ (NSString *)getUUID
{
    NSString *uuidStr = [[NSUUID UUID] UUIDString];
    NSLog(@"%@", uuidStr);
    return uuidStr;
}

@end
