//
//  MainContentViewController.m
//  Note
//
//  Created by qinge on 16/9/18.
//  Copyright © 2016年 qin. All rights reserved.
//
//  http://www.appcoda.com.tw/custom-search-bar-tutorial/
//  http://www.jianshu.com/p/c6bfadb4bfff
//  http://www.jianshu.com/p/66b5b777f5dc


//  https://github.com/zhengwenming/ExpandTableView (qq 分组)

#import "MainContentViewController.h"
#import "ViewController.h"
#import "NoteSectionHeader.h"

@interface MainContentViewController ()<UITableViewDataSource, UITableViewDelegate, UISearchResultsUpdating>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) UISearchController *searchController;


@end

@implementation MainContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupViews];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    ViewController *parentVC = (ViewController *)[self.navigationController parentViewController];
    [parentVC setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeAll];
    [parentVC setCloseDrawerGestureModeMask:MMCloseDrawerGestureModeAll];
    
}

-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    ViewController *parentVC = (ViewController *)[self.navigationController parentViewController];
    [parentVC setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeNone];
    [parentVC setCloseDrawerGestureModeMask:MMCloseDrawerGestureModeNone];
}




/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - setup views

-(void)setupViews{
    _tableView.rowHeight = 115.0;
    
    
//    _searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
//    // Use the current view controller to update the search results.
//    self.searchController.searchResultsUpdater = self;
//    self.searchController.searchBar.backgroundColor = [UIColor orangeColor];
//    self.tableView.tableHeaderView = _searchController.searchBar;
    
}


#pragma mark - UISearchResultsUpdating

- (void)updateSearchResultsForSearchController:(UISearchController *)searchController{
    NSLog(@"%s", __FUNCTION__);
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"tableViewCell" forIndexPath:indexPath];
    return cell;
}


#pragma mark - UITableViewDelegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self performSegueWithIdentifier:@"TestSegue" sender:nil];
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [tableView setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([tableView respondsToSelector:@selector(setLayoutMargins:)]) {
        [tableView setLayoutMargins:UIEdgeInsetsZero];
    }
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 25.0;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *headView = [[[NSBundle mainBundle] loadNibNamed:@"NoteSectionHeader" owner:self options:nil] firstObject];
    return headView;
}


@end
