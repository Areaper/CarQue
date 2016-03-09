//
//  CQNewsManager.m
//  CarQue
//
//  Created by HJW-MAC on 16/3/2.
//  Copyright © 2016年 GHY. All rights reserved.
//

#import "CQNewsManager.h"
#import "Reachability.h"
#import "UIViewController+HUD.h"
#import "MBProgressHUD.h"

@interface CQNewsManager ()


@property (nonatomic, strong) NSMutableArray *modelArr;


@end



@implementation CQNewsManager

//单例方法
+ (instancetype)shareManager{
    
    static CQNewsManager *manager = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once (&onceToken, ^{
        if (manager == nil) {
            manager = [[CQNewsManager alloc]init];
        }
    }) ;
    return manager;
}

//懒加载
- (NSMutableArray *)modelArr
{
    if (_modelArr== nil) {
        self.modelArr = [NSMutableArray array];
        
    }
    
    return _modelArr;
}




- (NSInteger)returnModelDataArrayCount
{
    
    return self.modelArr.count;
    
}


- (void)requestDatawithVC:(CQNewsVC *)vc
{
       [vc showHUDwith:@"正在加载中..."];
    if ([self isnetWork]) {

    NSURL *url = [NSURL URLWithString:KCQNewsAPI]; // 根据 API 获取
    NSData *data = [NSData dataWithContentsOfURL:url];
    // json 解析, 获得字典
    NSMutableDictionary *mDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    // 获得 result 字典
    NSMutableDictionary *resultDic = mDic[@"result"];
    // newlist 对应的数组
    NSMutableArray *newlistArr = resultDic[@"artlist"];
    // 将数据放入数据库
    for (int i = 0; i < newlistArr.count; i++) {
        CQNewArtlist *newModel = [CQNewArtlist modelObjectWithDictionary:newlistArr[i]];
        [self.modelArr addObject:newModel];
    }
        [vc hideHUD];
                          }
    else {
        
        
        [vc showHUDAndHidewith:@"没有网络"];
        
        
        
          }
    
    
    

}
- (CQNewArtlist *)modelAtIndex:(NSInteger)index{
    CQNewArtlist *newArtlist = [[CQNewArtlist alloc]init];
    
    newArtlist =  self.modelArr[index];
    
    return newArtlist;

}

- (void)requestLoopPictureDataString:(NSString *)str{
    
}






- (BOOL)isnetWork
{
    
    
    BOOL isnetWork ;
    Reachability *reach = [Reachability reachabilityWithHostName:@"www.baidu.com"];
    
    switch ([reach currentReachabilityStatus]) {
        case NotReachable:
            NSLog(@"没网络");
            isnetWork = NO;
            break;
        case ReachableViaWiFi:
            
            isnetWork = YES;
            break;
        case ReachableViaWWAN:
            
            isnetWork = YES;
            break;
            
        default:
            break;
    }
    
    
    
    return isnetWork;
    
}

    


@end
