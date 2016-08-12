//
//  UIViewController+LSHToast.m
//  乐生活
//
//  Created by aDu on 16/1/25.
//  Copyright © 2016年 aDu. All rights reserved.
//

#import "UIViewController+LSHToast.h"
#import <MBProgressHUD.h>

static const double delay = 1.5;

@implementation UIViewController (LSHToast)

// 内容+1秒隐藏
- (void)cnn_toast:(NSString *)content
{
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.mode = MBProgressHUDModeCustomView;
    hud.detailsLabelText = content;
    
    double delayInSeconds = delay;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void) {
        [hud hide:YES];
    });
}

// 内容+1秒隐藏+隐藏回调block
- (void)cnn_toast:(NSString *)content hideBlock:(void (^)())block
{
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.mode = MBProgressHUDModeCustomView;
    hud.detailsLabelText = content;
    
    double delayInSeconds = delay;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void) {
        [hud hide:YES];
        
        if (block) {
            block();
        }
    });
}

// 内容+时间
- (void)cnn_toast:(NSString *)content forSeconds:(CGFloat)seconds
{
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.mode = MBProgressHUDModeCustomView;
    hud.detailsLabelText = content;
    
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, seconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void) {
        [hud hide:YES];
    });
}

// 内容+时间+隐藏回调block
- (void)cnn_toast:(NSString *)content forSeconds:(CGFloat)seconds hideBlock:(void (^)())block
{
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.mode = MBProgressHUDModeCustomView;
    hud.detailsLabelText = content;
    
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, seconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void) {
        [hud hide:YES];
        
        if (block) {
            block();
        }
    });
}

// 内容+手动隐藏
- (void)cnn_toastShow:(NSString *)content
{
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.mode = MBProgressHUDModeCustomView;
    hud.detailsLabelText = content;
}


// 转圈+1秒隐藏
- (void)cnn_toastProgress
{
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.mode = MBProgressHUDModeIndeterminate;
    double delayInSeconds = delay;
    
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void) {
        [hud hide:YES];
    });
}

// 转圈+1秒隐藏+隐藏回调blcok
- (void)cnn_toastProgressWitHideBlock:(void (^)())block;
{
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.mode = MBProgressHUDModeIndeterminate;
    double delayInSeconds = delay;
    
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void) {
        [hud hide:YES];
        
        if (block) {
            block();
        }
    });
}

// 转圈+时间
- (void)cnn_toastProgressForSeconds:(CGFloat)seconds
{
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.mode = MBProgressHUDModeIndeterminate;
    
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, seconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void) {
        [hud hide:YES];
    });
}

// 转圈+1秒隐藏+隐藏回调blcok
- (void)cnn_toastProgressForSeconds:(CGFloat)seconds hideBlock:(void (^)())block
{
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.mode = MBProgressHUDModeIndeterminate;
    
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, seconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void) {
        [hud hide:YES];
        
        if (block) {
            block();
        }
    });
}

// 转圈+手动隐藏
- (void)cnn_toastProgressShow
{
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.mode = MBProgressHUDModeIndeterminate;
}

// 转圈+内容+1秒隐藏
- (void)cnn_toastProgressWithContent:(NSString *)content
{
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.mode = MBProgressHUDModeIndeterminate;
    hud.detailsLabelText = content;
    double delayInSeconds = delay;
    
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void) {
        [hud hide:YES];
    });
}

// 转圈+内容+1秒隐藏+隐藏回调block
- (void)cnn_toastProgressWithContent:(NSString *)content hideBlock:(void (^)())block
{
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.mode = MBProgressHUDModeIndeterminate;
    hud.detailsLabelText = content;
    double delayInSeconds = delay;
    
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void) {
        [hud hide:YES];
        
        if (block) {
            block();
        }
    });
}

// 转圈+内容+时间
- (void)cnn_toastPorgressWithContent:(NSString *)content forSeconds:(CGFloat)seconds
{
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.mode = MBProgressHUDModeIndeterminate;
    hud.detailsLabelText = content;
    
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, seconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void) {
        [hud hide:YES];
    });
}

// 转圈+内容+时间+隐藏回调block
- (void)cnn_toastPorgressWithContent:(NSString *)content forSeconds:(CGFloat)seconds hideBlock:(void (^)())block
{
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.mode = MBProgressHUDModeIndeterminate;
    hud.detailsLabelText = content;
    
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, seconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void) {
        [hud hide:YES];
        
        if (block) {
            block();
        }
    });
}

// 转圈+内容+手动隐藏
- (void)cnn_toastProgressWithContentShow:(NSString *)content
{
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.mode = MBProgressHUDModeIndeterminate;
    hud.detailsLabelText = content;
}

// 上传头像百分比进度条
- (void)cnn_toastProgressForUploading:(NSString *)content
{
    MBProgressHUD *hud = [MBProgressHUD HUDForView:self.view];
    if (hud) {
        hud.detailsLabelText = content;
    } else {
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        hud.mode = MBProgressHUDModeCustomView;
    }
}

// 隐藏
- (void)cnn_toastHide
{
    [MBProgressHUD hideHUDForView:self.view animated:YES];
}

//在UIView中调用的方法
- (UIViewController *)findParentController:(UIView *)currentView
{
    for (UIView* next = [currentView superview]; next; next = next.superview) {
        UIResponder *nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)nextResponder;
        }
    }
    return nil;
}

- (void)leftField:(UITextField *)leftField name:(NSString *)name
{
    UIImageView *view = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 40, 30)];
    view.image = [UIImage imageNamed:name];
    leftField.leftView = view;
    leftField.leftViewMode = UITextFieldViewModeAlways;
}

@end
