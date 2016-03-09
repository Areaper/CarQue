//
//  CQNewlist.h
//
//  Created by   on 16/3/1
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface CQNewlist : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *status;
@property (nonatomic, assign) double insTime;
@property (nonatomic, strong) NSString *memberName;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *memberId;
@property (nonatomic, assign) double toANums;
@property (nonatomic, strong) NSString *memberImg;
@property (nonatomic, strong) NSString *qId;
@property (nonatomic, strong) NSString *commentNums;
@property (nonatomic, assign) double imgsCount;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
