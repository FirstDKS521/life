//
//  LSHLoginUrl.m
//  乐生活
//
//  Created by aDu on 16/3/16.
//  Copyright © 2016年 aDu. All rights reserved.
//

#import "LSHLoginUrl.h"

@implementation LSHLoginUrl

/**
 * 登录
 */
+ (NSString *)loginUrl
{
    return [NSString stringWithFormat:@"%@/view/user/dologin.html", K_Url];
}

/**
 * 退出
 */
+ (NSString *)logoutUrl
{
    return [NSString stringWithFormat:@"%@/view/user/doexit.html", K_Url];
}

/**
 * 注册-获取验证码
 */
+ (NSString *)getCodeUrl
{
    return [NSString stringWithFormat:@"%@/view/user/getcode.html", K_Url];
}

/**
 * 注册-验证验证码
 */
+ (NSString *)valCodeUrl
{
    return [NSString stringWithFormat:@"%@/view/user/valcode.html", K_Url];
}

/**
 * 提交注册
 */
+ (NSString *)doreGistUrl
{
    return [NSString stringWithFormat:@"%@/view/user/doregist.html", K_Url];
}

/**
 * 找回密码-获取验证码
 */
+ (NSString *)findGetCodeUrl
{
    return [NSString stringWithFormat:@"%@/view/user/getcode.html", K_Url];
}

/**
 *  找回密码-验证码验证
 */
+ (NSString *)findValCodeUrl
{
    return [NSString stringWithFormat:@"%@/view/user/valcode.html", K_Url];
}

/**
 * 找回密码-提交修改
 */
+ (NSString *)findCommitUrl
{
    return [NSString stringWithFormat:@"%@/view/user/findpwd.html", K_Url];
}

/**
 * 修改密码
 */
+ (NSString *)changePassWordUrl
{
    return [NSString stringWithFormat:@"%@/view/doupdpwd.html", K_Url];
}

/**
 * 修改昵称
 */
+ (NSString *)chagneNameUrl
{
    return [NSString stringWithFormat:@"%@/view/user/updnicke.html", K_Url];
}

/**
 * 上传图像
 */
+ (NSString *)uploadImageUrl
{
    return [NSString stringWithFormat:@"%@/view/user/upload.html", K_Url];
}

/**
 *  是否登录
 */
+ (NSString *)isOrNotLogin
{
    return [NSString stringWithFormat:@"%@/view/user/islogin.html", K_Url];
}

@end
