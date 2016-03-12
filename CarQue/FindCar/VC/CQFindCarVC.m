//
//  CQFindCarVC.m
//  CarQue
//
//  Created by lanou on 16/3/3.
//  Copyright © 2016年 GHY. All rights reserved.
//
#import "CQFindCarVC.h"
#import "CQFindCarLogoListTableVC.h"
#import "OneBrandListTableVC.h"
#import "OneKindListTableVC.h"

@interface CQFindCarVC ()

@property (nonatomic,strong)CQFindCarLogoListTableVC *CQFindCarLogoTVC;
@property (nonatomic,strong)OneBrandListTableVC *OneBrandTVC;
@property (nonatomic,strong)UIViewController *currentVC;

@property (nonatomic,copy)NSString *kindId;
@property (nonatomic,copy)NSString *name;
//  比车数量
@property (nonatomic,assign)NSInteger carNumber;
//  车系接口ID
@property (nonatomic,copy)NSString *pseridID;
@property (nonatomic,copy)NSString *priceStr;
@property (nonatomic,strong)NSString *topTitleStr;


@end

@implementation CQFindCarVC

- (OneBrandListTableVC *)OneBrandTVC{
    if (!_OneBrandTVC) {
        _OneBrandTVC = [[OneBrandListTableVC alloc]init];
//    右扫手势
        UISwipeGestureRecognizer *rightSwipe = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(changeBrandLisetVC)];
        [_OneBrandTVC.tableView addGestureRecognizer:rightSwipe];
        rightSwipe.direction = UISwipeGestureRecognizerDirectionRight;
#pragma mark 跳转
        __weak CQFindCarVC *weakCQFindCarVC = self;
        _OneBrandTVC.pushBlock = ^(NSString *pserid,NSString *price,NSString *topTitleStr){
//         转换
            weakCQFindCarVC.pseridID = pserid;
            weakCQFindCarVC.priceStr = price;
            weakCQFindCarVC.topTitleStr = topTitleStr;
//         隐藏标签栏
//            weakCQFindCarVC.hidesBottomBarWhenPushed = YES;
            OneKindListTableVC *OneKindListTVC = [[OneKindListTableVC alloc]init];
//         传值
            OneKindListTVC.pseridID = weakCQFindCarVC.pseridID;
            OneKindListTVC.priceStr = weakCQFindCarVC.priceStr;
            OneKindListTVC.topTitleStr = weakCQFindCarVC.topTitleStr;

            [weakCQFindCarVC.navigationController pushViewController:OneKindListTVC animated:YES];
//            weakCQFindCarVC.hidesBottomBarWhenPushed = NO;
        };
    }
    return _OneBrandTVC;
}
- (CQFindCarLogoListTableVC *)CQFindCarLogoTVC{
    if (!_CQFindCarLogoTVC) {
        _CQFindCarLogoTVC = [[CQFindCarLogoListTableVC alloc]init];
    }
    return _CQFindCarLogoTVC;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"车库";
    //    self.OneBrandTVC.getblock(self.kindId,self.name);
    self.currentVC = self.CQFindCarLogoTVC;
    [self.view addSubview:self.CQFindCarLogoTVC.view];
    
//   导航栏右按钮
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:[NSString stringWithFormat:@"比车(%ld)",self.carNumber] style:UIBarButtonItemStylePlain target:self action:@selector(compareVC:)];
    
    //    block实现进行传值到本控制器
    __weak CQFindCarVC *weakCQFindCarVC = self;
    self.CQFindCarLogoTVC.cellblock = ^(NSString *kindID,NSString *name){
        weakCQFindCarVC.kindId = kindID;
        weakCQFindCarVC.name = name;
//        添加右边控制器视图
        [weakCQFindCarVC.view addSubview:weakCQFindCarVC.OneBrandTVC.view];
        //        Block调用回传到oneBrandVC
        weakCQFindCarVC.OneBrandTVC.getblock(weakCQFindCarVC.kindId,weakCQFindCarVC.name);
        
        //        视图动画效果
        [UIView animateWithDuration:0.5 animations:^{
            weakCQFindCarVC.OneBrandTVC.view.frame = CGRectMake(74, 0, SCREEN_WIDTH - 74, SCREEN_HEIGHT - 103);
        }];
    };
}
//  添加手势方法
- (void)changeBrandLisetVC{
    [UIView animateWithDuration:0.5 animations:^{
        self.OneBrandTVC.view.frame = CGRectMake(SCREEN_WIDTH, 0, 0, SCREEN_HEIGHT);
    } completion:^(BOOL finished) {
        [self.OneBrandTVC.view removeFromSuperview];
    }];
}
//   导航栏右按钮方法

- (void)compareVC:(UIBarButtonItem *)rightBarButton{
//    self.hidesBottomBarWhenPushed = YES;
//    OneKindListTableVC *OneKindListTVC = [[OneKindListTableVC alloc]init];
//    [self.navigationController pushViewController:OneKindListTVC animated:YES];
//    self.hidesBottomBarWhenPushed = NO;
    NSLog(@"比车了");
}


@end
