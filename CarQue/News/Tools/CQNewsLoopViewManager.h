//
//  CQNewsLoopViewManager.h
//  CarQue
//
//  Created by HJW-MAC on 16/3/4.
//  Copyright © 2016年 GHY. All rights reserved.
//



#import <Foundation/Foundation.h>
#import "CQNewsLoopViewManager.h"
#import "CQNewsVC.h"

#define APILoop @"http://api.daogou.bjzzcb.com/v3/channel/focus?"


@interface CQNewsLoopViewManager : NSObject




+ (instancetype)shareManager;


//New数据处理
- (void)requestDatawithVC:(CQNewsVC *)vc;

//通过下标返回model
- (CQNewsLoopViewManager *)modelAtIndex:(NSInteger)index;

- (NSMutableArray *)returnLoopModel;


//返回数据个数
- (NSInteger)returnModelDataArrayCount;

- (BOOL)isnetWork;










@end
