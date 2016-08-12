//
//  LSHPersonListViewController.m
//  乐生活
//
//  Created by aDu on 16/3/29.
//  Copyright © 2016年 aDu. All rights reserved.
//

#import "LSHPersonListViewController.h"
#import "LSHNanleCardViewCell.h"
#import "LSHNanleHappyViewCell.h"
#import "LSHPublishViewController.h"
#import "LSHHomeUrl.h"
#import "LSHPersonUrl.h"
#import "LSHHomeModel.h"
#import "Header.h"

#define K_Cell @"cell"
#define K_Card @"card"
@interface LSHPersonListViewController ()

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArray;

@property (nonatomic, assign) NSInteger count;

@end

@implementation LSHPersonListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    self.tableView.backgroundColor = [UIColor colorWithWhite:0.961 alpha:1.000];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.rowHeight = 60;
    [self hideExtraCellLine:self.tableView];
    [self.view addSubview:self.tableView];
    
    [self loadData];
}

- (void)loadData
{
    NSString *type = nil;
    if ([self.title isEqualToString:@"互动南乐"]) {
        type = @"a";
    } else if ([self.title isEqualToString:@"问题建议"]) {
        type = @"c";
    } else if ([self.title isEqualToString:@"产需对接"]) {
        type = @"b";
    }
    __weak LSHPersonListViewController *vc = self;
    NSDictionary *dic = @{@"mobile":[K_UserDefaults objectForKey:K_UserID], @"type":type};
    [LSHNetworkingManager getWithURLString:[LSHPersonUrl getMyCardListUrl] parameters:dic success:^(NSDictionary *data) {
        
    } failure:^(NSError *error) {
        
    }];
}

#pragma mark - UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    } else {
        return self.dataArray.count;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 1) {
        return 15;
    } else {
        return 0;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *string = self.title;
    if (indexPath.section == 1) {
        LSHNanleCardViewCell *cell = [[LSHNanleCardViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:K_Card];
        LSHHomeModel *model = self.dataArray[indexPath.row];
        [cell setModel:model];
        return cell;
    } else {
        LSHNanleHappyViewCell *cell = [[LSHNanleHappyViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:K_Cell];
        cell.button.hidden = YES;
        NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"共计%ld条%@", self.count, string]];
        [self butTitle:str];
        [cell.titleLabel setAttributedText:str];
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [NSThread sleepForTimeInterval:0.3];
    UITabBarController *tabbarVC = self.navigationController.tabBarController;
    tabbarVC.selectedIndex = 0;
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - UIButton

- (void)publishCode
{
    LSHPublishViewController *publishVC = [[LSHPublishViewController alloc] init];
    if ([self.title isEqualToString:@"互动南乐"]) {
        publishVC.title = @"发表帖子";
    } else if ([self.title isEqualToString:@"问题建议"]) {
        publishVC.title = @"发表建议";
    } else if ([self.title isEqualToString:@"产需对接"]) {
        publishVC.title = @"发表需求";
    }
    [self.navigationController pushViewController:publishVC animated:YES];
}

#pragma mark - init

- (NSMutableArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

- (void)hideExtraCellLine:(UITableView *)tableview {
    UIView * view = [UIView new];
    view.backgroundColor = [UIColor clearColor];
    tableview.tableFooterView = view;
}

- (void)butTitle:(NSMutableAttributedString *)str
{
    [str addAttribute:NSForegroundColorAttributeName
                value:[UIColor colorWithWhite:0.651 alpha:1.000]
                range:NSMakeRange(0, 2)];
    
    [str addAttribute:NSForegroundColorAttributeName
                value:[UIColor redColor]
                range:NSMakeRange(2, str.length - 3)];
    
    [str addAttribute:NSForegroundColorAttributeName
                value:[UIColor colorWithWhite:0.651 alpha:1.000]
                range:NSMakeRange(str.length - 3, 3)];
}

@end
