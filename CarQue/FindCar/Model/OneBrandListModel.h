//
//  OneBrandListModel.h
//  CarQue
//
//  Created by lanou on 16/2/29.
//  Copyright © 2016年 GHY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OneBrandListModel : NSObject

@property (nonatomic, strong) NSString *pserid;
@property (nonatomic, strong) NSString *img;
@property (nonatomic, strong) NSString *price;
@property (nonatomic, strong) NSString *pbid;
@property (nonatomic, strong) NSString *bidname;
@property (nonatomic, strong) NSString *bid;
@property (nonatomic, strong) NSString *name;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;

@end
