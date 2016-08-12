//
//  LSHNetworkingManager.h
//  乐生活
//
//  Created by aDu on 16/1/25.
//  Copyright © 2016年 aDu. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef void(^SuccessBlock)(NSDictionary *data);
typedef void(^FailureBlcok)(NSError *error);

@interface LSHNetworkingManager : NSObject

//+ (instancetype)sharedManager;

@property (nonatomic, copy) SuccessBlock successBlock;
@property (nonatomic, copy) FailureBlcok failureBlock;

/**
 *  发送get请求
 *
 *  @param URLString  请求的网址字符串
 *  @param parameters 请求的参数
 *  @param success    请求成功的回调
 *  @param failure    请求失败的回调
 */
+ (void)getWithURLString:(NSString *)URLString
              parameters:(id)parameters
                 success:(SuccessBlock)success
                 failure:(FailureBlcok)failure;

/**
 *  发送post请求
 *
 *  @param URLString  请求的网址字符串
 *  @param parameters 请求的参数
 *  @param success    请求成功的回调
 *  @param failure    请求失败的回调
 */
+ (void)postWithURLString:(NSString *)URLString
               parameters:(id)parameters
                  success:(SuccessBlock)success
                  failure:(FailureBlcok)failure;


@end
