//
//  LSHRootViewController.m
//  乐生活
//
//  Created by aDu on 16/1/26.
//  Copyright © 2016年 aDu. All rights reserved.
//

#import "LSHRootViewController.h"
#import "LSHHomePageViewController.h"
#import "LSHGovernmentViewController.h"
#import "LSHCompanyViewController.h"
#import "LSHPersonViewController.h"
#import "LSHNavigationViewController.h"
#import "Header.h"

@interface LSHRootViewController ()

@end

@implementation LSHRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBar.tintColor = [UIColor lsh_greenColor];
    
    self.tabBar.translucent = NO;
    [self loadViewController];
}

- (void)loadViewController
{
    LSHHomePageViewController * homeVC = [[LSHHomePageViewController alloc] init];
    LSHNavigationViewController * navHome = [[LSHNavigationViewController alloc] initWithRootViewController:homeVC];
    homeVC.tabBarItem.image = [UIImage imageNamed:@"home_08"];
//    homeVC.tabBarItem.selectedImage = [UIImage imageNamed:@"home_hover_08"];
    navHome.tabBarItem.title = @"首页";
    homeVC.navigationItem.title = @"乐生活";
    
    LSHGovernmentViewController * governVC = [[LSHGovernmentViewController alloc] init];
    LSHNavigationViewController * navGovern = [[LSHNavigationViewController alloc] initWithRootViewController:governVC];
    governVC.tabBarItem.image = [UIImage imageNamed:@"zixun_08"];
    navGovern.tabBarItem.title = @"政府咨询";
    governVC.navigationItem.title = @"政府咨询";
    
    LSHCompanyViewController * companyVC = [[LSHCompanyViewController alloc] init];
    LSHNavigationViewController * navCompany = [[LSHNavigationViewController alloc] initWithRootViewController:companyVC];
    companyVC.tabBarItem.image = [UIImage imageNamed:@"new_08"];
    navCompany.tabBarItem.title = @"公司新闻";
    companyVC.navigationItem.title = @"公司新闻";
    
    LSHPersonViewController * personVC = [[LSHPersonViewController alloc] init];
    LSHNavigationViewController * navPerson = [[LSHNavigationViewController alloc] initWithRootViewController:personVC];
    personVC.tabBarItem.image = [UIImage imageNamed:@"me_08"];
    navPerson.tabBarItem.title = @"个人中心";
    personVC.navigationItem.title = @"个人中心";
    
    self.viewControllers = @[navHome, navGovern, navCompany, navPerson];
}

@end
