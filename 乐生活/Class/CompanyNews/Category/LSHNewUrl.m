//
//  LSHNewUrl.m
//  乐生活
//
//  Created by aDu on 16/3/16.
//  Copyright © 2016年 aDu. All rights reserved.
//

#import "LSHNewUrl.h"

@implementation LSHNewUrl

+ (NSString *)getNewsList
{
    return [NSString stringWithFormat:@"%@/news/getlist.html", K_Url];
}

@end
