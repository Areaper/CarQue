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

@interface RootTabBarViewController ()

@end

@implementation RootTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CQFindCarVC *findVC = [CQFindCarVC new];
    UINavigationController *findNaVC = [[UINavigationController alloc]initWithRootViewController:findVC];
    findVC.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"搜索" image:[UIImage imageNamed:@"sousuo"] tag:101];
    
    CQForumVC *forumVC = [CQForumVC new];
    UINavigationController *forumNaVC = [[UINavigationController alloc]initWithRootViewController:forumVC];
    forumVC.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"社区" image:[UIImage imageNamed:@"liaotian"] tag:102];
    
    CQNewsVC *newsVC = [CQNewsVC new];
    UINavigationController *newsNaVC = [[UINavigationController alloc]initWithRootViewController:newsVC];
    newsVC.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"新闻" image:[UIImage imageNamed:@"news"] tag:103];
    
    CQProfileVC *profileVC = [CQProfileVC new];
    UINavigationController *profileNaVC = [[UINavigationController alloc]initWithRootViewController:profileVC];
    profileVC.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"用户" image:[UIImage imageNamed:@"wode"] tag:104];
    
    NSArray *TBControllersArray = @[newsNaVC, forumNaVC, findNaVC, profileNaVC];
    
    self.viewControllers = TBControllersArray;
    self.tabBar.translucent = YES;
//    self.tabBar.barTintColor = [UIColor greenColor];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
