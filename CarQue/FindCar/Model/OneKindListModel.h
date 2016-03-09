//
//  OneKindListModel.h
//  CarQue
//
//  Created by lanou on 16/2/29.
//  Copyright © 2016年 GHY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OneKindListModel : NSObject

@property (nonatomic, strong) NSString *pserid;
@property (nonatomic, strong) NSString *mid;
@property (nonatomic, strong) NSString *m_disl;
@property (nonatomic, assign) double mali;
@property (nonatomic, strong) NSString *bid;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *m_working;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;

@end
