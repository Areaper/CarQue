//
//  CQPictureResult.h
//
//  Created by HJW-MAC  on 16/3/3
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface CQPictureResult : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *resultIdentifier;
@property (nonatomic, strong) NSString *thumbUrl;
@property (nonatomic, strong) NSString *zanNums;
@property (nonatomic, strong) NSString *viewNums;
@property (nonatomic, strong) NSString *coverUrl;
@property (nonatomic, strong) NSString *specialTitle;
@property (nonatomic, strong) NSString *specialId;
@property (nonatomic, strong) NSString *specialCoverUrl;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *picUrl;
@property (nonatomic, assign) double instime;
@property (nonatomic, strong) NSString *cateName;
@property (nonatomic, strong) NSString *shortTitle;
@property (nonatomic, strong) NSString *isAd;
@property (nonatomic, strong) NSString *commentNums;
@property (nonatomic, strong) NSString *cateId;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
