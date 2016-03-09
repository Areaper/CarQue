
//
//  DetailsForCarModel.m
//  CarQue
//
//  Created by lanou on 16/2/29.
//  Copyright © 2016年 GHY. All rights reserved.
//

#import "DetailsForCarModel.h"

@implementation DetailsForCarModel

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict{
    if (self = [super init]){
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}


@end

