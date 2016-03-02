//
//  CQMainVC.m
//  CarQue
//
//  Created by HJW-MAC on 16/3/1.
//  Copyright © 2016年 GHY. All rights reserved.
//

#import "CQMainVC.h"
#import "YCSlideView.h"


#import "CQNewsVC.h"
#import "CQPictureVC.h"
#import "CQShoppingVC.h"
#import "CQVideoVC.h"



#define kWindowWidth                        ([[UIScreen mainScreen] bounds].size.width)

#define kWindowHeight                       ([[UIScreen mainScreen] bounds].size.height)


@interface CQMainVC ()

@end

@implementation CQMainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // 将控制器已Key = 标题 Value = 控制器 存入数组
    
    [self.navigationController setNavigationBarHidden:YES];
    
    
    
    NSArray *viewControllers = @[@{@"新闻":[CQNewsVC new]},@{@"图趣":[CQPictureVC new]},@{@"导购":[CQShoppingVC new]},@{@"视频":[CQVideoVC new]}];
   
    
    YCSlideView * view = [[YCSlideView alloc]initWithFrame:CGRectMake(0, 0, kWindowWidth, kWindowHeight) WithViewControllers:viewControllers];
    
    
    [self.view addSubview:view];
    
    
    
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
