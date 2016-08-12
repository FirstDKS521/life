//
//  LSHNavigationViewController.m
//  乐生活
//
//  Created by aDu on 16/3/17.
//  Copyright © 2016年 aDu. All rights reserved.
//

#import "LSHNavigationViewController.h"
#import "UIColor+LSHColor.h"

@interface LSHNavigationViewController ()

@end

@implementation LSHNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(NSIntegerMin, NSIntegerMin) forBarMetrics:UIBarMetricsDefault];
    
    //修改返回按钮的颜色
    self.navigationBar.tintColor = [UIColor whiteColor];
    //修改导航栏的背景颜色
    self.navigationBar.barTintColor = [UIColor lsh_greenColor];
    //修改导航栏的标题颜色
    [self.navigationBar setTitleTextAttributes : @{NSFontAttributeName:[UIFont systemFontOfSize:19], NSForegroundColorAttributeName:[UIColor whiteColor]}];
    self.navigationBar.translucent = NO;
    
    [self addGesturesSliding];
}

/**
 * 添加又滑手势
 */
- (void)addGesturesSliding
{
    // 初始化手势并添加执行方法
    UISwipeGestureRecognizer *swipeRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(doBack)];
    // 手势方向
    swipeRecognizer.direction = UISwipeGestureRecognizerDirectionRight;
    // 响应的手指数
    swipeRecognizer.numberOfTouchesRequired = 1;
    // 添加手势
    [[self view] addGestureRecognizer:swipeRecognizer];
}

-(void)doBack
{
    if (self.viewControllers.count > 1) {
        // pop返回上一级
        [self popViewControllerAnimated:YES];
    }
}

- (void)dealloc
{
    self.delegate = nil;
    self.interactivePopGestureRecognizer.delegate = nil;
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.viewControllers.count == 1) {
        // push时候隐藏tabBar
        viewController.hidesBottomBarWhenPushed = YES;
    }
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.interactivePopGestureRecognizer.enabled = NO;
    }
    [super pushViewController:viewController animated:animated];
}

- (void)setViewControllers:(NSArray<__kindof UIViewController *> *)viewControllers animated:(BOOL)animated
{
    if (viewControllers.count > 1) {
        [[viewControllers firstObject] setHidesBottomBarWhenPushed:YES];
    } else {
        [[viewControllers firstObject] setHidesBottomBarWhenPushed:NO];
    }
    
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.interactivePopGestureRecognizer.enabled = NO;
    }
    [super setViewControllers:viewControllers animated:animated];
}

- (UIViewController *)popViewControllerAnimated:(BOOL)animated
{
    if (self.viewControllers.count == 2) {
        [[self.viewControllers firstObject] setHidesBottomBarWhenPushed:NO];
    }
    return [super popViewControllerAnimated:animated];
}

#pragma mark - UINavigationControllerDelegate

- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)])
        self.interactivePopGestureRecognizer.enabled = YES;
}

@end
