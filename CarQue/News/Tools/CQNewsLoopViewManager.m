//
//  CQNewsLoopViewManager.m
//  CarQue
//
//  Created by HJW-MAC on 16/3/4.
//  Copyright © 2016年 GHY. All rights reserved.
//

#import "CQNewsLoopViewManager.h"
#import "LoopViewResult.h"

@interface CQNewsLoopViewManager ()

@property (nonatomic, strong) NSMutableArray *modelArr;


@end



@implementation CQNewsLoopViewManager

//单例方法
+ (instancetype)shareManager{
    
    static CQNewsLoopViewManager *manager = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once (&onceToken, ^{
        if (manager == nil) {
            manager = [[CQNewsLoopViewManager alloc]init];
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
    NSLog(@"isnet____________%d",[self isnetWork]);
    if ([self isnetWork]) {
    NSURL *url = [NSURL URLWithString:APILoop]; // 根据 API 获取
    NSData *data = [NSData dataWithContentsOfURL:url];
    // json 解析, 获得字典
    NSMutableDictionary *mDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    // result 对应的数组
    NSMutableArray *piclistArr = mDic[@"result"];
    // 将数据放入数据库
    for (int i = 0; i < piclistArr.count; i++) {
        LoopViewResult *newModel = [LoopViewResult modelObjectWithDictionary:piclistArr[i]];
        [self.modelArr addObject:newModel];
    }
        [vc hideHUD];
                          }
    else {
        [vc showHUDAndHidewith:@"没有网络"];
         }
    
    
    
    
}
- (LoopViewResult *)modelAtIndex:(NSInteger)index{
    LoopViewResult *newArtlist = [[LoopViewResult alloc]init];
    
    newArtlist =  self.modelArr[index];
    
    return newArtlist;
    
}

- (NSMutableArray *)returnLoopModel
{

    return _modelArr;
    
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
