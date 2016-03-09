//
//  CQNewMainVC.m
//  CarQue
//
//  Created by HJW-MAC on 16/3/1.
//  Copyright © 2016年 GHY. All rights reserved.
//

#import "CQNewMainVC.h"
#import "YCSlideView.h"


#import "CQNewsVC.h"
#import "CQPictureVC.h"
#import "CQShoppingVC.h"
#import "CQVideoVC.h"
#import "CQNewsDetailsVC.h"
#import "CQPictureDetailsVC.h"
#import "CQNewLoopDetailsView.h"
#define kWindowWidth                        ([[UIScreen mainScreen] bounds].size.width)

#define kWindowHeight                       ([[UIScreen mainScreen] bounds].size.height)




@interface CQNewMainVC ()

@property (nonatomic, strong) CQNewsVC *newsVC;
@property (nonatomic, strong) CQPictureVC *pictureVC;
@property (nonatomic, strong) CQShoppingVC *shoppingVC;
@property (nonatomic, strong) CQVideoVC *videoVC;

@end

@implementation CQNewMainVC

- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:YES];
    self.tabBarController.tabBar.hidden = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
 //block让mainView导航控制器来推出详情页面
   _newsVC = [CQNewsVC new];
    [self NewsBlock];
    [self NewsLoopBlock];
    
    
   _pictureVC = [CQPictureVC new];
    [self PictureBlock];
    
   _shoppingVC = [CQShoppingVC new];
    [self ShoppingBlock];
    
   _videoVC = [CQVideoVC new];
    [self videoVC];
    
    
    
    
    
    // 将控制器已Key = 标题 Value = 控制器 存入数组
    NSArray *viewControllers = @[@{@"新闻":_newsVC},@{@"图趣":_pictureVC},@{@"导购": _shoppingVC},@{@"视频": _videoVC}];
    YCSlideView * view = [[YCSlideView alloc]initWithFrame:CGRectMake(0, 0, kWindowWidth, kWindowHeight) WithViewControllers:viewControllers];
    [self.view addSubview:view];
    
    
    
   // 设定导航控制器返回键按钮
    UIBarButtonItem *item = [[UIBarButtonItem alloc]init];
    UIImage* image = [UIImage imageNamed:@"btn_back@3x.png"];
    [item setBackButtonBackgroundImage:[image resizableImageWithCapInsets:UIEdgeInsetsMake(0, image.size.width, 0, 0)] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [item setBackButtonTitlePositionAdjustment:UIOffsetMake(-400.f, 0) forBarMetrics:UIBarMetricsDefault];
    self.navigationItem.backBarButtonItem = item;

    
    
    
    
}

// news页面跳转bloc实现
- (void)NewsBlock{
    __weak typeof(self)weakself = self;
    
    _newsVC.newsBlock = ^(NSString *Newurl) {
        CQNewsDetailsVC *newDetails = [[CQNewsDetailsVC alloc]init];
        newDetails.NId = Newurl;
    [weakself.navigationController pushViewController:newDetails animated:YES];
    };
    
}

// news页面跳转bloc实现
- (void)NewsLoopBlock{
    __weak typeof(self)weakself = self;
    
    _newsVC.newLoopBlock= ^(NSString* picUrl) {
    CQNewLoopDetailsView *newLoopDetails = [[CQNewLoopDetailsView alloc]init];
    newLoopDetails.NId = picUrl;
    [weakself.navigationController pushViewController:newLoopDetails animated:YES];
    };
    
}





// Picture页面跳转bloc实现
- (void)PictureBlock{
    __weak typeof(self)weakself = self;
    

    _pictureVC.pictureBlock = ^(NSInteger index) {
        CQPictureDetailsVC *picDetails = [[CQPictureDetailsVC alloc]init];
        [weakself.navigationController pushViewController:picDetails animated:YES];
    };
    
    

}

// Shopping页面跳转bloc实现
- (void)ShoppingBlock{
    
}

// Video页面跳转bloc实现
- (void)VideoBlock{
 
    
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
