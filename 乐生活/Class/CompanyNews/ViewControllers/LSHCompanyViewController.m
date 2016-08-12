//
//  LSHCompanyViewController.m
//  乐生活
//
//  Created by aDu on 16/1/26.
//  Copyright © 2016年 aDu. All rights reserved.
//

#import "LSHCompanyViewController.h"
#import "LSHCompanyViewCell.h"
#import "LSHNewUrl.h"
#import "LSHNewsModel.h"
#import "Header.h"

#define K_Cell @"cell"
@interface LSHCompanyViewController ()

@property (nonatomic, strong) UIView *headView;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIImageView *image;
@property (nonatomic, strong) UILabel *titleLabe;
@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation LSHCompanyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.tableView];
    self.tableView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    [_tableView registerClass:[LSHCompanyViewCell class] forCellReuseIdentifier:K_Cell];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    [self hideExtraCellLine:_tableView];
    
    self.headView = [[UIView alloc] init];
    self.headView.frame = CGRectMake(0, 0, self.view.frame.size.width, 120);
    self.tableView.tableHeaderView = self.headView;
    
    self.image.frame = self.headView.frame;
    
    [self.titleLabe mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.image.mas_bottom);
        make.left.and.right.equalTo(self.view);
        make.height.equalTo(@25);
    }];
    
    [self loadData];
}

- (void)loadData
{
    __weak LSHCompanyViewController *vc = self;
    [LSHNetworkingManager getWithURLString:[LSHNewUrl getNewsList] parameters:@{@"type":@"news"} success:^(NSDictionary *data) {
        NSArray *array = data[@"data"];
        for (NSDictionary *dic in array) {
            LSHNewsModel *model = [[LSHNewsModel alloc] init];
            [model setValuesForKeysWithDictionary:dic];
            vc.titleLabe.text = [NSString stringWithFormat:@"     %@", dic[@"title"]];
            [vc.dataArray addObject:model];
        }
        [vc.tableView reloadData];
    } failure:^(NSError *error) {
        
    }];
}

#pragma mark - UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LSHCompanyViewCell *cell = [tableView dequeueReusableCellWithIdentifier:K_Cell forIndexPath:indexPath];
    LSHNewsModel *model = self.dataArray[indexPath.row];
    cell.model = model;
    [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    return cell;
}

//隐藏分隔条
- (void)hideExtraCellLine:(UITableView *)tableview {
    UIView * view = [UIView new];
    view.backgroundColor = [UIColor clearColor];
    tableview.tableFooterView = view;
}

#pragma mark - init

- (UIImageView *)image
{
    if (!_image) {
        _image = [[UIImageView alloc] init];
        _image.image = [UIImage imageNamed:@"xw_mg_33"];
        [self.headView addSubview:_image];
    }
    return _image;
}

- (UILabel *)titleLabe
{
    if (!_titleLabe) {
        _titleLabe = [[UILabel alloc] init];
        _titleLabe.backgroundColor = [UIColor colorWithWhite:0.751 alpha:0.688];
        _titleLabe.textColor = [UIColor whiteColor];
        _titleLabe.font = [UIFont systemFontOfSize:14.0];
        [self.headView addSubview:_titleLabe];
    }
    return _titleLabe;
}

- (UITableView *)tableView{
    if (!_tableView) {
        self.tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
        [_tableView registerClass:[LSHCompanyViewCell class] forCellReuseIdentifier:K_Cell];
        _tableView.rowHeight = 60;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [self hideExtraCellLine:_tableView]; //隐藏无用的分隔条
        [self.view addSubview:_tableView];
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

@end
