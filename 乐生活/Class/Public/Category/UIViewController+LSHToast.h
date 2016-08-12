//
//  UIViewController+LSHToast.h
//  乐生活
//
//  Created by aDu on 16/1/25.
//  Copyright © 2016年 aDu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (LSHToast)

/**
 * 内容+1秒隐藏
 */
- (void)cnn_toast:(NSString *)content;

/**
 * 内容+1秒隐藏+隐藏回调block
 */
- (void)cnn_toast:(NSString *)content hideBlock:(void (^)())block;

/**
 * 内容+时间
 */
- (void)cnn_toast:(NSString *)content forSeconds:(CGFloat)seconds;

/**
 * 内容+时间+隐藏回调block
 */
- (void)cnn_toast:(NSString *)content forSeconds:(CGFloat)seconds hideBlock:(void (^)())block;

/**
 * 内容+手动隐藏
 */
- (void)cnn_toastShow:(NSString *)content;

////////////////////////////////////////////////////
/**
 * 转圈+1秒隐藏
 */
- (void)cnn_toastProgress;

/**
 * 转圈+1秒隐藏+隐藏回调blcok
 */
- (void)cnn_toastProgressWitHideBlock:(void (^)())block;

/**
 * 转圈+时间
 */
- (void)cnn_toastProgressForSeconds:(CGFloat)seconds;

/**
 * 转圈+1秒隐藏+隐藏回调blcok
 */
- (void)cnn_toastProgressForSeconds:(CGFloat)seconds hideBlock:(void (^)())block;

/**
 * 转圈+手动隐藏
 */
- (void)cnn_toastProgressShow;


////////////////////////////////////////////////////
/**
 * 转圈+内容+1秒隐藏
 */
- (void)cnn_toastProgressWithContent:(NSString *)content;

/**
 * 转圈+内容+1秒隐藏+隐藏回调block
 */
- (void)cnn_toastProgressWithContent:(NSString *)content hideBlock:(void (^)())block;

/**
 * 转圈+内容+时间
 */
- (void)cnn_toastPorgressWithContent:(NSString *)content forSeconds:(CGFloat)seconds;

/**
 * 转圈+内容+时间+隐藏回调block
 */
- (void)cnn_toastPorgressWithContent:(NSString *)content forSeconds:(CGFloat)seconds hideBlock:(void (^)())block;

/**
 * 转圈+内容+手动隐藏
 */
- (void)cnn_toastProgressWithContentShow:(NSString *)content;

////////////////////////////////////////////////////
/**
 * 上传头像百分比进度条
 */
- (void)cnn_toastProgressForUploading:(NSString *)content;

////////////////////////////////////////////////////
/**
 * 隐藏
 */
- (void)cnn_toastHide;

/**
 *  在UIView中调用找到UIViewController
 */
- (UIViewController *)findParentController:(UIView *)currentView;

/**
 *  控制UITextField的左边视图
 */
- (void)leftField:(UITextField *)leftField name:(NSString *)name;

@end
