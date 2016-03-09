//
//  CQFindCarLogoListModel.h
//  CarQue
//
//  Created by lanou on 16/2/29.
//  Copyright © 2016年 GHY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CQFindCarLogoListModel : NSObject

@property (nonatomic,copy)NSString *ename;
@property (nonatomic,copy)NSString *kindId;
@property (nonatomic,copy)NSString *img;
@property (nonatomic,copy)NSString *name;

//初始化数据
+ (instancetype)findCarLogoListModelWithDic:(NSDictionary *)dic;
- (instancetype)initWithDict:(NSDictionary *)dict;

@end
