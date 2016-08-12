//
//  LSHHomePageViewController.m
//  乐生活
//
//  Created by aDu on 16/1/26.
//  Copyright © 2016年 aDu. All rights reserved.
//

#import "LSHHomePageViewController.h"
#import "LSHSearchBoxViewController.h"
#import "LSHHomeTableViewCell.h"
#import "LSHHomeButtonViewCell.h"
#import "LSHNanleHappyViewController.h"
#import "LSHGovernmentViewController.h"
#include "LSHCompanyViewController.h"
#import "Header.h"

#define K_Cell @"cell"
#define K_CELL @"Cell"

@interface LSHHomePageViewController ()

@property (nonatomic, strong) NSArray *arrayLabel;
@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong)NSMutableArray * dataArray;

@property (nonatomic, strong) UIScrollView *bigscroll;
@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIPageControl *pageControl;
@property (nonatomic, assign) BOOL isClick;

@property(nonatomic, strong) NSTimer *timer;

@end

@implementation LSHHomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.arrayLabel = @[@{@"互动南乐":@"interact"},
                        @{@"政府咨询":@"government"},
                        @{@"问题建议":@"problem"},
                        @{@"产需对接":@"product"},
                        @{@"公司新闻":@"company"},
                        @{@"联系我们":@"contact"}];
    
    [self.view addSubview:self.bigscroll];
    [self.bigscroll addSubview:self.contentView];
    [self.contentView addSubview:self.scrollView];
    [self.contentView addSubview:self.pageControl];
    [self.contentView addSubview:self.collectionView];
    [self.contentView addSubview:self.tableView];
    
    //搜索框 搁置
//    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:@selector(toSearch)];
    [self addView];
}

- (void)addView
{
    [self.bigscroll mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).with.insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.bigscroll);
        make.width.equalTo(self.bigscroll.mas_width);
    }];
    
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top);
        make.left.and.right.equalTo(self.contentView);
        make.height.equalTo(@120);
    }];
    
    for (int i = 0; i < 2; i++) {
        UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.frame.size.width * i, 0, self.view.frame.size.width, 120)];
        imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"banner%d.jpg", i + 1]];
        imageView.backgroundColor = [UIColor orangeColor];
        [_scrollView addSubview:imageView];
    }
    
    [self.pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.contentView.mas_centerX);
        make.bottom.equalTo(self.scrollView.mas_bottom).offset(-5);
        make.height.equalTo(@20);
        make.width.equalTo(@40);
    }];
    
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.scrollView.mas_bottom).offset(10);
        make.left.and.right.equalTo(self.contentView);
        make.height.equalTo(@80);
    }];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.collectionView.mas_bottom).offset(10);
        make.left.and.right.equalTo(self.contentView);
        make.bottom.equalTo(self.contentView.mas_bottom);
    }];
    
    [self addtimer];
}

- (void)loadData
{
    [LSHNetworkingManager postWithURLString:nil parameters:nil success:^(NSDictionary *data) {
        
    } failure:^(NSError *error) {
        
    }];
}

//添加搜索框
- (void)toSearch
{
    LSHSearchBoxViewController *searchVC = [[LSHSearchBoxViewController alloc] init];
    [self.navigationController pushViewController:searchVC animated:YES];
}

#pragma mark - UIScrollView

//添加定时器方法
-(void) addtimer{
    _timer = [NSTimer scheduledTimerWithTimeInterval:3.0 target:self selector:@selector(nextPage) userInfo:nil repeats:YES];
    //返回当前的消息循环对象
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}
//删除定时器方法
-(void) deleteTimer{
    [_timer invalidate];
    _timer = nil;
}

- (void)changePage:(UIPageControl *)pageControl
{
    _isClick = YES;
    //动画效果
    [_scrollView setContentOffset:CGPointMake(self.view.frame.size.width * pageControl.currentPage, 0) animated:YES];
}

//拖拽过程中会一直调用这个方法
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    UIPageControl * pageControl = (UIPageControl *)[self.view viewWithTag:100];
    NSInteger number = (scrollView.contentOffset.x + (self.view.frame.size.width / 2)) / self.view.frame.size.width;
    pageControl.currentPage = number;
}

//将要结束拖拽时调用,
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
{
    [self deleteTimer];
    _isClick = NO;
}

- (void)nextPage
{
    NSInteger page = 0;
    if (self.pageControl.currentPage == 1) {
        page = 0;
    } else {
        page = self.pageControl.currentPage + 1;
    }
    //计算滚动的位置
    CGFloat offsetX = page * self.scrollView.frame.size.width;
    CGPoint offset = CGPointMake(offsetX, 0);
    [self.scrollView setContentOffset:offset animated:YES];
}

#pragma mark - UICollectionViewViewDelegate

//创建cell
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    LSHHomeButtonViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:K_CELL forIndexPath:indexPath];
    cell.backgroundColor = [UIColor lsh_greenColor];
    NSInteger integer = indexPath.row;
    NSDictionary *dic = [self.arrayLabel objectAtIndex:integer];
    cell.label.text = [NSString stringWithFormat:@"%@", [[dic allKeys] firstObject]];
    return cell;
}

//每个分区有多少个cell
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 6;
}

//设置几个分区
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView;
{
    return 1;
}

//代理的方法,点击某个cell的时候调用
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger integer = indexPath.row;
    if (integer == 0 || integer == 2 || integer == 3) {
        LSHNanleHappyViewController *nanleVC = [[LSHNanleHappyViewController alloc] init];
        if (integer == 0) {
            nanleVC.title = @"互动南乐";
        } else if (integer == 2) {
            nanleVC.title = @"问题建议";
        } else if (integer == 3) {
            nanleVC.title = @"产需对接";
        }
        [self.navigationController pushViewController:nanleVC animated:YES];
    }
    if (integer == 1) {
        LSHGovernmentViewController *goverVC = [[LSHGovernmentViewController alloc] init];
        goverVC.title = @"政府咨询";
        [self.navigationController pushViewController:goverVC animated:YES];
    } else if (integer == 4) {
        LSHCompanyViewController *companyVC = [[LSHCompanyViewController alloc] init];
        companyVC.title = @"公司新闻";
        [self.navigationController pushViewController:companyVC animated:YES];
    } else if (integer == 5) {
        [self callService]; //联系我们
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

#pragma mark - UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    [self.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@(77 * 9));
    }];
    return 9;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 15;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LSHHomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:K_Cell forIndexPath:indexPath];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

//隐藏分隔条
- (void)hideExtraCellLine:(UITableView *)tableview {
    UIView * view = [UIView new];
    view.backgroundColor = [UIColor clearColor];
    tableview.tableFooterView = view;
}

#pragma mark - 初始化属性

- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        UICollectionViewFlowLayout * flowLayout = [[UICollectionViewFlowLayout alloc] init];
        //设置每个图片的大小
        flowLayout.itemSize = CGSizeMake((self.view.frame.size.width - 10) / 3, 40);
        //设置滚动方向的间距
        flowLayout.minimumLineSpacing = 5;
        //设置上方的反方向
        flowLayout.minimumInteritemSpacing = 0;
        //设置图片上下左右之间的间距
        flowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
        //设置滚动方向
        flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, 0, 0) collectionViewLayout:flowLayout];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        _collectionView.scrollEnabled = NO;
        _collectionView.backgroundColor = [UIColor colorWithWhite:0.875 alpha:1.000];
        //给集合视图注册一个cell
        [_collectionView registerClass:[LSHHomeButtonViewCell class] forCellWithReuseIdentifier:K_CELL];
    }
    return _collectionView;
}

- (UIScrollView *)bigscroll
{
    if (!_bigscroll) {
        _bigscroll = [[UIScrollView alloc] init];
        _bigscroll.bounces = NO;
        _bigscroll.showsVerticalScrollIndicator = NO;
    }
    return _bigscroll;
}

- (UIView *)contentView{
    if (!_contentView) {
        _contentView = [[UIView alloc] init];
        _contentView.backgroundColor = [UIColor colorWithWhite:0.875 alpha:1.000];
    }
    return _contentView;
}

- (UIScrollView *)scrollView
{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] init];
        _scrollView.contentSize = CGSizeMake(self.view.frame.size.width * 2, 120);
        //水平方向的滚动条显不显示默认都是yes;
        _scrollView.showsHorizontalScrollIndicator = NO;
        //垂直方向的滚动条显不显示默认都是yes;
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.pagingEnabled = YES;
        _scrollView.bounces = NO;
        _scrollView.delegate = self;
    }
    return _scrollView;
}

- (UIPageControl *)pageControl
{
    if (!_pageControl) {
        _pageControl = [[UIPageControl alloc] init];
        _pageControl.numberOfPages = 2;
        _pageControl.tag = 100;
        //设置当前小点得颜色
        _pageControl.currentPageIndicatorTintColor = [UIColor grayColor];
        //设置每一个小点的颜色
        _pageControl.pageIndicatorTintColor = [UIColor whiteColor];
        [_pageControl addTarget:self action:@selector(changePage:) forControlEvents:UIControlEventValueChanged];
    }
    return _pageControl;
}

- (UITableView *)tableView{
    if (!_tableView) {
        self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
        [_tableView registerClass:[LSHHomeTableViewCell class] forCellReuseIdentifier:K_Cell];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.scrollEnabled = NO;
        _tableView.rowHeight = 75;
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
