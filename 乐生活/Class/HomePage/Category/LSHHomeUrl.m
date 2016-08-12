//
//  LSHHomeUrl.m
//  乐生活
//
//  Created by aDu on 16/3/16.
//  Copyright © 2016年 aDu. All rights reserved.
//

#import "LSHHomeUrl.h"

@implementation LSHHomeUrl

+ (NSString *)getListUrl
{
    return [NSString stringWithFormat:@"%@/card/getlist.html", K_Url];
}

+ (NSString *)getAdListUrl
{
    return [NSString stringWithFormat:@"%@/ad/getlist.html", K_Url];
}

@end
