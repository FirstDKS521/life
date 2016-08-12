//
//  LSHPersonUrl.m
//  乐生活
//
//  Created by aDu on 16/3/16.
//  Copyright © 2016年 aDu. All rights reserved.
//

#import "LSHPersonUrl.h"

@implementation LSHPersonUrl

/**
 *  get请求
 *
 *  @return type值为a表示帖子,为b表示供需，为c 表示建议
 */
+ (NSString *)getMyCardListUrl
{
    return [NSString stringWithFormat:@"%@/card/mycardlist.html", K_Url];
}

@end
