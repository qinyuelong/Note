//
//  ViewController.m
//  Note
//
//  Created by qinge on 16/9/17.
//  Copyright © 2016年 qin. All rights reserved.
//

#import "ViewController.h"
#import "MainMenuNavigationController.h"
#import "MainMenuViewController.h"

#import "MainContentNavigationController.h"
#import "MainContentViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = YES;
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    UINavigationController *menuNVC = [self.storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([MainMenuNavigationController class])];
    UINavigationController *contentNVC = [self.storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([MainContentNavigationController class])];
    
    [self setLeftDrawerViewController:menuNVC];
    [self setCenterViewController:contentNVC];
    
    [self setShowsShadow:NO];
    [self setRestorationIdentifier:@"MMDrawer"];
//    [self setMaximumRightDrawerWidth:200.0];
    [self setMaximumLeftDrawerWidth:self.view.frame.size.width - 60];
    [self setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeAll];
    [self setCloseDrawerGestureModeMask:MMCloseDrawerGestureModeAll];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
