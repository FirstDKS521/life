//
//  LSHNewsModel.m
//  乐生活
//
//  Created by aDu on 16/3/21.
//  Copyright © 2016年 aDu. All rights reserved.
//

#import "LSHNewsModel.h"

@implementation LSHNewsModel

- (void)setValue:(id)value forUndefinedKey:(nonnull NSString *)key
{
    if ([key isEqualToString:@"id"]) {
        self.newsID = value;
    }
}

@end
