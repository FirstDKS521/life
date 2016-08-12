//
//  LSHSearchBoxViewController.m
//  乐生活
//
//  Created by aDu on 16/1/28.
//  Copyright © 2016年 aDu. All rights reserved.
//

#import "LSHSearchBoxViewController.h"
#import "Header.h"

@interface LSHSearchBoxViewController ()

@property (nonatomic, strong) UISearchBar *searchBar;

@end

@implementation LSHSearchBoxViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"搜索";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self addSearchBar];
}

- (void)addSearchBar
{
    self.searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 40)];
    [self.view addSubview:_searchBar];
    _searchBar.placeholder = @"请输入要搜索的内容";
    _searchBar.contentMode = UIViewContentModeLeft;
    _searchBar.barTintColor = [UIColor lsh_greenColor];
    _searchBar.searchBarStyle = UISearchBarStyleMinimal;
    //搜索过的东西
    _searchBar.showsSearchResultsButton = YES;
    //设置选择框的出现
    _searchBar.showsScopeBar = YES;
    //标题框的分段
    _searchBar.delegate = self;
}

//编辑开始
- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar
{
    return YES;
}

//点击右边的搜索的时候调用
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    NSLog(@"点击了");
}

//点击下面的选择框的时候被调用
- (void)searchBar:(UISearchBar *)searchBar selectedScopeButtonIndexDidChange:(NSInteger)selectedScope
{
    NSLog(@"%ld", (long)selectedScope);
}

//点击回收键盘的时候有反应
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    NSLog(@"什么反应");
}

@end
