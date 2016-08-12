//
//  LSHHomeModel.h
//  乐生活
//
//  Created by aDu on 16/3/23.
//  Copyright © 2016年 aDu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <YYModel.h>

@interface LSHHomeModel : NSObject

@property (nonatomic, copy) NSString *addTime;
@property (nonatomic, assign) NSInteger visitTimes;
@property (nonatomic, strong) NSString *ID;
@property (nonatomic, strong) NSString *title;

@end
