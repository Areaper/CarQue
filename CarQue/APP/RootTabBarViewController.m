//
//  RootTabBarViewController.m
//  CarQue
//
//  Created by lanou on 16/2/27.
//  Copyright © 2016年 GHY. All rights reserved.
//

#import "RootTabBarViewController.h"
#import "CQFindCarVC.h"
#import "CQForumVC.h"
#import "CQNewsVC.h"
#import "CQProfileVC.h"
#import "CQForumMainPageC.h"
#import "CQQuestionSortVC.h"


@interface RootTabBarViewController ()

@end

@implementation RootTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CQFindCarVC *findVC = [CQFindCarVC new];
    UINavigationController *findNaVC = [[UINavigationController alloc]initWithRootViewController:findVC];
    findVC.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"搜索" image:[UIImage imageNamed:@"sousuo"] tag:101];
    
//    CQForumVC *forumVC = [CQForumVC new];
//    UINavigationController *forumNaVC = [[UINavigationController alloc]initWithRootViewController:forumVC];
//    forumVC.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"社区" image:[UIImage imageNamed:@"liaotian"] tag:102];
    
    // 使用三方 WMPageController
    NSArray *classArr = @[[CQForumVC class], [CQQuestionSortVC class]];
    NSArray *titleArr = @[@"热帖", @"问题分类"];
    CQForumMainPageC *forumMain = [[CQForumMainPageC alloc] initWithViewControllerClasses:classArr andTheirTitles:titleArr];
    
    // 配置外观
    forumMain.titleSizeSelected = 13;
    forumMain.titleSizeNormal = 13;
    forumMain.titleColorSelected = [UIColor whiteColor];
    forumMain.titleColorNormal = [UIColor colorWithRed:168.0/255.0 green:20.0/255.0 blue:4/255.0 alpha:1];
    forumMain.progressColor = [UIColor colorWithRed:168.0/255.0 green:20.0/255.0 blue:4/255.0 alpha:1];
    forumMain.itemsWidths = @[@(70),@(100),@(70)];
    forumMain.pageAnimatable = YES;
    
    forumMain.menuViewStyle = WMMenuViewStyleFoold;
    forumMain.showOnNavigationBar = YES;
    
    UINavigationController *bbsNav = [[UINavigationController alloc] initWithRootViewController:forumMain];
    
    bbsNav.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"社区" image:[UIImage imageNamed:@"liaotian"] tag:102];
    
    
    CQNewsVC *newsVC = [CQNewsVC new];
    UINavigationController *newsNaVC = [[UINavigationController alloc]initWithRootViewController:newsVC];
    newsVC.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"新闻" image:[UIImage imageNamed:@"news"] tag:103];
    
    CQProfileVC *profileVC = [CQProfileVC new];
    UINavigationController *profileNaVC = [[UINavigationController alloc]initWithRootViewController:profileVC];
    profileVC.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"用户" image:[UIImage imageNamed:@"wode"] tag:104];
    
    NSArray *TBControllersArray = @[newsNaVC, bbsNav, findNaVC, profileNaVC];
    
    self.viewControllers = TBControllersArray;
    self.tabBar.translucent = YES;
//    self.tabBar.barTintColor = [UIColor greenColor];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





@end
