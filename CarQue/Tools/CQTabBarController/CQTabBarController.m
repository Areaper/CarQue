//
//  CQTabBarController.m
//  CarQue
//
//  Created by leon on 16/3/8.
//  Copyright © 2016年 GHY. All rights reserved.
//

#import "CQTabBarController.h"

#import "CQForumVC.h"
#import "CQNewsVC.h"
#import "CQProfileVC.h"
#import "CQForumMainPageC.h"
#import "CQQuestionSortVC.h"
#import "CQNewMainVC.h"

#import "CQFindCarVC.h"
#import "CQMapVC.h"

#import "CQTabBarController.h"
#import "DCPathButton.h"

#import "RegViewController.h"

// 腾讯
#import <TencentOpenAPI/TencentOAuth.h>
#import "sdkCall.h"





@interface CQTabBarController ()<DCPathButtonDelegate>

@end

@implementation CQTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    CQFindCarVC *findVC = [[CQFindCarVC alloc]init];
    UINavigationController *findNaVC = [[UINavigationController alloc]initWithRootViewController:findVC];
    findNaVC.navigationBar.translucent = NO;
    findVC.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"搜索" image:[UIImage imageNamed:@"sousuo"] tag:101];
    
    
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
    
    
    CQNewMainVC *newsVC = [CQNewMainVC new];
    UINavigationController *newsNaVC = [[UINavigationController alloc]initWithRootViewController:newsVC];
    newsVC.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"新闻" image:[UIImage imageNamed:@"news"] tag:103];
    
    CQProfileVC *profileVC = [CQProfileVC new];
    UINavigationController *profileNaVC = [[UINavigationController alloc]initWithRootViewController:profileVC];
    
    
    
    
    profileVC.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"" image:[UIImage new] tag:104];
    
    
    CQMapVC *mapVC = [CQMapVC new];
    UINavigationController *mapNVC = [[UINavigationController alloc] initWithRootViewController:mapVC];
    UIImage *image = [UIImage imageNamed:@"iconfont-ditu"];
    
    
    mapVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"地图" image:image tag:105];
    
        
    NSArray *TBControllersArray = @[newsNaVC, bbsNav, profileNaVC, findNaVC, mapNVC];
        
        
    self.viewControllers = TBControllersArray;
    self.tabBar.translucent = YES;
    
    [self configureDCPathButton];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (void)configureDCPathButton
{
    DCPathButton *dcPathButton = [[DCPathButton alloc]initWithCenterImage:[UIImage imageNamed:@"chooser-button-tab"]
                                                         highlightedImage:[UIImage imageNamed:@"chooser-button-tab-highlighted"]];
    dcPathButton.delegate = self;
    
    // Configure item buttons
    //
    DCPathItemButton *itemButton_1 = [[DCPathItemButton alloc]initWithImage:[UIImage imageNamed:@"iconfont-QQ"]
                                                           highlightedImage:[UIImage imageNamed:@"chooser-moment-icon-music-highlighted"]
                                                            backgroundImage:[UIImage imageNamed:@"chooser-moment-button"]
                                                 backgroundHighlightedImage:[UIImage imageNamed:@"chooser-moment-button-highlighted"]];
    
    DCPathItemButton *itemButton_2 = [[DCPathItemButton alloc]initWithImage:[UIImage imageNamed:@"item4"]
                                                           highlightedImage:[UIImage imageNamed:@"chooser-moment-icon-place-highlighted"]
                                                            backgroundImage:[UIImage imageNamed:@"chooser-moment-button"]
                                                 backgroundHighlightedImage:[UIImage imageNamed:@"chooser-moment-button-highlighted"]];
    
    DCPathItemButton *itemButton_3 = [[DCPathItemButton alloc]initWithImage:[UIImage imageNamed:@"item2"]
                                                           highlightedImage:[UIImage imageNamed:@"chooser-moment-icon-camera-highlighted"]
                                                            backgroundImage:[UIImage imageNamed:@"chooser-moment-button"]
                                                 backgroundHighlightedImage:[UIImage imageNamed:@"chooser-moment-button-highlighted"]];
    
    DCPathItemButton *itemButton_4 = [[DCPathItemButton alloc]initWithImage:[UIImage imageNamed:@"item3"]
                                                           highlightedImage:[UIImage imageNamed:@"chooser-moment-icon-thought-highlighted"]
                                                            backgroundImage:[UIImage imageNamed:@"chooser-moment-button"]
                                                 backgroundHighlightedImage:[UIImage imageNamed:@"chooser-moment-button-highlighted"]];
    
    DCPathItemButton *itemButton_5 = [[DCPathItemButton alloc]initWithImage:[UIImage imageNamed:@"chooser-moment-icon-sleep"]
                                                           highlightedImage:[UIImage imageNamed:@"chooser-moment-icon-sleep-highlighted"]
                                                            backgroundImage:[UIImage imageNamed:@"chooser-moment-button"]
                                                 backgroundHighlightedImage:[UIImage imageNamed:@"chooser-moment-button-highlighted"]];
    
    // Add the item button into the center button
    //
    [dcPathButton addPathItems:@[itemButton_1,
                                 itemButton_2,
                                 itemButton_3,
                                 itemButton_4,
                                 itemButton_5]];
    
    // Change the bloom radius, default is 105.0f
    //
    dcPathButton.bloomRadius = 120.0f;
    
    // Change the DCButton's center
    //
    dcPathButton.dcButtonCenter = CGPointMake(self.view.bounds.size.width / 2, self.view.bounds.size.height - 25.5f);
    
    // Setting the DCButton appearance
    //
    dcPathButton.allowSounds = YES;
    dcPathButton.allowCenterButtonRotation = YES;
    
    dcPathButton.bottomViewColor = [UIColor grayColor];
    
    dcPathButton.bloomDirection = kDCPathButtonBloomDirectionTop;
    
    [self.view addSubview:dcPathButton];
    

    
    
}

- (void)willPresentDCPathButtonItems:(DCPathButton *)dcPathButton {
    
    NSLog(@"ItemButton will present");
    
}

- (void)pathButton:(DCPathButton *)dcPathButton clickItemButtonAtIndex:(NSUInteger)itemButtonIndex {
    NSLog(@"You tap %@ at index : %lu", dcPathButton, (unsigned long)itemButtonIndex);
    switch (itemButtonIndex) {
        case 0:
        {
            
            NSArray* permissions = [NSArray arrayWithObjects:
                                    kOPEN_PERMISSION_GET_USER_INFO,
                                    kOPEN_PERMISSION_GET_SIMPLE_USER_INFO,
                                    nil];
            [[[sdkCall getinstance] oauth] authorize:permissions inSafari:NO];//  是否用浏览器打开
        }
            
            break;
        case 1:
        {
            RegViewController *regView = [[RegViewController alloc] init];
            UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:regView];
            
            [self presentViewController:nav animated:YES completion:^{
            }];
        }
            

            
            break;
        case 2:
            
            break;
        case 3:
            
            break;
        case 4:
            
            break;
            
        default:
            break;
    }
    
    
    
}

- (void)didPresentDCPathButtonItems:(DCPathButton *)dcPathButton {
    
    NSLog(@"ItemButton did present");
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
