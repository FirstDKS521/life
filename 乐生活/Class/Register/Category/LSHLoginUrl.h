//
//  LSHLoginUrl.h
//  乐生活
//
//  Created by aDu on 16/3/16.
//  Copyright © 2016年 aDu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LSHLoginUrl : NSObject

/**
 * 登录
 */
+ (NSString *)loginUrl;

/**
 * 退出
 */
+ (NSString *)logoutUrl;

/**
 * 注册-获取验证码
 */
+ (NSString *)getCodeUrl;

/**
 * 注册-验证验证码
 */
+ (NSString *)valCodeUrl;

/**
 * 提交注册
 */
+ (NSString *)doreGistUrl;

/**
 * 找回密码-获取验证码
 */
+ (NSString *)findGetCodeUrl;

/**
 *  找回密码-验证码验证
 */
+ (NSString *)findValCodeUrl;

/**
 * 找回密码-提交修改
 */
+ (NSString *)findCommitUrl;

/**
 * 修改密码
 */
+ (NSString *)changePassWordUrl;

/**
 * 修改昵称
 */
+ (NSString *)chagneNameUrl;

/**
 * 上传图像
 */
+ (NSString *)uploadImageUrl;

/**
 *  是否登录
 */
+ (NSString *)isOrNotLogin;

@end
