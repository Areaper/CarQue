//
//  CQNewsManager.h
//  CarQue
//
//  Created by HJW-MAC on 16/3/2.
//  Copyright © 2016年 GHY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CQNewsVC.h"
#import "CQNewArtlist.h"





@interface CQNewsManager : NSObject

+ (instancetype)shareManager;


//New数据处理
- (void)requestDatawithVC:(CQNewsVC *)vc;

//通过下标返回model
- (CQNewArtlist *)modelAtIndex:(NSInteger)index;

//返回数据个数
- (NSInteger)returnModelDataArrayCount;

//New2数据处理
- (void)requestLoopPictureDataString:(NSString *)str;




@end
