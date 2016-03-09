//
//  DetailsForCarModel.h
//  CarQue
//
//  Created by lanou on 16/2/29.
//  Copyright © 2016年 GHY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DetailsForCarModel : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *value;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;

@end
