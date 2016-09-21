//
//  MainContentViewController.m
//  Note
//
//  Created by qinge on 16/9/18.
//  Copyright © 2016年 qin. All rights reserved.
//

#import "MainContentViewController.h"
#import "ViewController.h"

@interface MainContentViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation MainContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _tableView.rowHeight = 115.0;

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


#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
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


@end
