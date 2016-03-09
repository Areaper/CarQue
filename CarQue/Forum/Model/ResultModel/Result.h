//
//  Result.h
//
//  Created by   on 16/3/4
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Author;

@interface Result : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *zanNums;
@property (nonatomic, strong) NSString *resultIdentifier;
@property (nonatomic, strong) NSString *content;
@property (nonatomic, strong) NSString *instime;
@property (nonatomic, strong) Author *author;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
