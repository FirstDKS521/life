//
//  UIViewController+LSHNavigation.m
//  乐生活
//
//  Created by aDu on 16/1/26.
//  Copyright © 2016年 aDu. All rights reserved.
//

#import "UIViewController+LSHNavigation.h"
#import "UIColor+LSHColor.h"

@implementation UIViewController (LSHNavigation)

- (void)navigation
{
    UIBarButtonItem * back = [[UIBarButtonItem alloc] init];
    back.title = @"";
    self.navigationItem.backBarButtonItem = back;
    
    //修改返回按钮的颜色
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    //修改导航栏的背景颜色
    self.navigationController.navigationBar.barTintColor = [UIColor lsh_greenColor];
    //修改导航栏的标题颜色
    [self.navigationController.navigationBar setTitleTextAttributes : @{NSFontAttributeName:[UIFont systemFontOfSize:19], NSForegroundColorAttributeName:[UIColor whiteColor]}];
    self.navigationController.navigationBar.translucent = NO;
}

- (void)leftField:(UITextField *)leftField name:(NSString *)name
{
    UIImageView *view = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 40, 30)];
    view.image = [UIImage imageNamed:name];
    leftField.leftView = view;
    leftField.leftViewMode = UITextFieldViewModeAlways;
}

@end
