//
//  LSHPersonViewController.m
//  乐生活
//
//  Created by aDu on 16/1/26.
//  Copyright © 2016年 aDu. All rights reserved.
//

#import "LSHPersonViewController.h"
#import "LSHPersonViewCell.h"
#import "LSHPersonHeadView.h"
#import "UIButton+Badge.h"
//#import "LSHNanleHappyViewController.h"
#import "LSHLoginUrl.h"
#import "AppDelegate.h"
#import "LSHPersonUrl.h"
#import "LSHNavigationViewController.h"
#import "LSHPersonListViewController.h"
#import "Header.h"

#define K_Cell @"cell"
@interface LSHPersonViewController ()

@property (nonatomic, strong) UIScrollView *scrollView;

@property (nonatomic, strong) UIImageView *image;
@property (nonatomic, strong) UIButton *imageButton;
@property (nonatomic, strong) UILabel *userLabel;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, strong) UIButton *logoutButton;

@property (nonatomic, strong) NSArray *titleArray;
@property (nonatomic, strong) LSHPersonHeadView *headView;

@end

@implementation LSHPersonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.titleArray = @[@{@"我的帖子":@"myTieZi"},
                        @{@"我的建议":@"myJianYi"},
                        @{@"我的需求":@"myXueQiu"},
                        @{@"客服电话":@"phoneNumber"}];
    
    [self addView];
}

- (void)addView
{
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
        make.width.equalTo(@(self.view.frame.size.width));
    }];
    
    [self.image mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.equalTo(self.view);
        make.top.equalTo(self.scrollView.mas_top);
        make.height.equalTo(@110);
    }];
    
    [self.imageButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.top.equalTo(self.image.mas_top).offset(10);
        make.height.equalTo(@50);
        make.width.equalTo(@50);
    }];
    self.imageButton.layer.cornerRadius = 25;
    
    [self.userLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.top.equalTo(self.imageButton.mas_bottom).offset(10);
        make.height.equalTo(@20);
        make.width.equalTo(@180);
    }];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.image.mas_bottom).offset(20);
        make.right.equalTo(self.view.mas_right).offset(-16);
        make.left.equalTo(self.view.mas_left).offset(16);
    }];
    
    [self.logoutButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.top.equalTo(self.tableView.mas_bottom).offset(20);
        make.bottom.equalTo(self.scrollView.mas_bottom);
        make.height.equalTo(@40);
        make.width.equalTo(@220);
    }];
    
    self.headView = [[LSHPersonHeadView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width - 32, 70)];
    self.tableView.tableHeaderView = self.headView;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:YES];
    self.headView.tieZiButton.tag = 19;
    [self.headView.tieZiButton showBadgeOnItemIndex:self.headView.tieZiButton];
    [self.headView.tieZiButton addTarget:self action:@selector(tieZiButton:) forControlEvents:UIControlEventTouchUpInside];
    
    self.headView.jianYiButton.tag = 3;
    [self.headView.jianYiButton showBadgeOnItemIndex:self.headView.jianYiButton];
    [self.headView.jianYiButton addTarget:self action:@selector(jianYiButton:) forControlEvents:UIControlEventTouchUpInside];
    
    self.headView.xuQiuButton.tag = 3;
    [self.headView.xuQiuButton showBadgeOnItemIndex:self.headView.xuQiuButton];
    [self.headView.xuQiuButton addTarget:self action:@selector(xuQiuButton:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)tieZiButton:(UIButton *)sender
{
    [sender hideBadgeOnItemIndex:sender];
    [self didSelect:@"互动南乐"];
}

- (void)jianYiButton:(UIButton *)sender
{
    [sender hideBadgeOnItemIndex:sender];
    [self didSelect:@"问题建议"];
}

- (void)xuQiuButton:(UIButton *)sender
{
    [sender hideBadgeOnItemIndex:sender];
    [self didSelect:@"产需对接"];
}

- (void)didSelect:(NSString *)title
{
    LSHPersonListViewController *listVC = [[LSHPersonListViewController alloc] init];
    listVC.title = title;
    [self.navigationController pushViewController:listVC animated:YES];
}

#pragma mark - UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    [self.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@(self.titleArray.count * 44 + 70));
    }];
    return self.titleArray.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LSHPersonViewCell *cell = [tableView dequeueReusableCellWithIdentifier:K_Cell forIndexPath:indexPath];
    NSDictionary *dic = self.titleArray[indexPath.row];
    cell.titleLabel.text = [dic allKeys].firstObject;
    if (indexPath.row == (self.titleArray.count - 1)) {
        cell.rightLabel.text = @"400-565-898";
        cell.rightLabel.textColor = [UIColor redColor];
    } else {
        [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPat
{
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]){
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger integer = indexPath.row;
    if (integer == 0) {
        [self didSelect:@"互动南乐"];
    } else if (integer == 1) {
        [self didSelect:@"问题建议"];
    } else if (integer == 2) {
        [self didSelect:@"产需对接"];
    } else if (integer == 3) {
        [self callService];
    }
}

- (void)callService
{
    //number为号码字符串 如果使用这个方法 结束电话之后会进入联系人列表
    NSMutableString * str=[[NSMutableString alloc] initWithFormat:@"tel:%@",[NSString stringWithFormat:@"%@", @"400-565-898"]];
    UIWebView * callWebview = [[UIWebView alloc] init];
    [callWebview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:str]]];
    [self.view addSubview:callWebview];
}

- (void)viewDidLayoutSubviews
{
    if ([self.tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [self.tableView setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([self.tableView respondsToSelector:@selector(setLayoutMargins:)])  {
        [self.tableView setLayoutMargins:UIEdgeInsetsZero];
    }
}

//隐藏分隔条
- (void)hideExtraCellLine:(UITableView *)tableview
{
    UIView * view = [UIView new];
    view.backgroundColor = [UIColor clearColor];
    tableview.tableFooterView = view;
}

#pragma mark - 退出登录

- (void)logoutButton:(UIButton *)button
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"是否注销登录" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    [alert show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1) {
        NSString *phone = [K_UserDefaults objectForKey:K_UserID];
        __weak LSHPersonViewController *vc = self;
        [LSHNetworkingManager postWithURLString:[LSHLoginUrl logoutUrl] parameters:@{@"mobile":phone} success:^(NSDictionary *data) {
            [vc cnn_toast:data[@"msg"]];
            if ([[data[@"success"] stringValue] isEqualToString:@"1"]) {
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    [K_UserDefaults removeObjectForKey:K_UserID];
                    AppDelegate *app = (AppDelegate *)[UIApplication sharedApplication].delegate;
                    vc.view.window.rootViewController = app.navigationVC;
                });
            }
        } failure:^(NSError *error) {
            
        }];
    } else {
        return;
    }
}

#pragma mark - init

- (UIScrollView *)scrollView
{
    if (_scrollView == nil) {
        _scrollView = [[UIScrollView alloc] init];
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.bounces = NO;
        [self.view addSubview:_scrollView];
    }
    return _scrollView;
}

- (UIImageView *)image
{
    if (!_image) {
        _image = [[UIImageView alloc] init];
        _image.image = [UIImage imageNamed:@"vip_bg_07"];
        [self.scrollView addSubview:_image];
    }
    return _image;
}

- (UIButton *)imageButton
{
    if (!_imageButton) {
        _imageButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_imageButton setBackgroundImage:[UIImage imageNamed:@"touxinag_08"] forState:UIControlStateNormal];
        [self.image addSubview:_imageButton];
    }
    return _imageButton;
}

- (UILabel *)userLabel
{
    if (!_userLabel) {
        _userLabel = [[UILabel alloc] init];
        _userLabel.font = [UIFont systemFontOfSize:14];
        _userLabel.textColor = [UIColor whiteColor];
        _userLabel.textAlignment = NSTextAlignmentCenter;
        _userLabel.text = [NSString stringWithFormat:@"账号：%@", [K_UserDefaults objectForKey:K_UserID]];
        [self.image addSubview:_userLabel];
    }
    return _userLabel;
}

- (UIButton *)logoutButton
{
    if (!_logoutButton) {
        _logoutButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _logoutButton.layer.borderWidth = 1;
        _logoutButton.layer.borderColor = [[UIColor redColor] CGColor];
        _logoutButton.layer.cornerRadius = 4;
        [_logoutButton setTitle:@"退出登录" forState:UIControlStateNormal];
        [_logoutButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        _logoutButton.titleLabel.font = [UIFont systemFontOfSize:K_Font_Size];
        [_logoutButton addTarget:self action:@selector(logoutButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.scrollView addSubview:_logoutButton];
    }
    return _logoutButton;
}

- (UITableView *)tableView
{
    if (!_tableView) {
        self.tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
        [_tableView registerClass:[LSHPersonViewCell class] forCellReuseIdentifier:K_Cell];
        _tableView.rowHeight = 44;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.layer.borderWidth = 1;
        _tableView.layer.borderColor = [[UIColor colorWithRed:0.910 green:0.914 blue:0.910 alpha:1.000] CGColor];
        _tableView.layer.cornerRadius = 4;
        _tableView.scrollEnabled =  NO;
        _tableView.separatorInset = UIEdgeInsetsZero;
        [self hideExtraCellLine:_tableView]; //隐藏无用的分隔条
        [self.scrollView addSubview:_tableView];
    }
    return _tableView;
}

- (NSMutableArray *)dataArray
{
    if (_dataArray == nil) {
        _dataArray = [NSMutableArray arrayWithCapacity:1];
    }
    return _dataArray;
}

- (LSHPersonHeadView *)headView
{
    if (!_headView) {
        _headView = [[LSHPersonHeadView alloc] init];
    }
    return _headView;
}

@end
