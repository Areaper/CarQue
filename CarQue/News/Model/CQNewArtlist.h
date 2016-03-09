//
//  CQNewArtlist.h
//
//  Created by HJW-MAC  on 16/3/2
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface CQNewArtlist : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *artlistIdentifier;
@property (nonatomic, strong) NSString *thumbUrl;
@property (nonatomic, strong) NSString *coverUrl;
@property (nonatomic, strong) NSString *isTop;
@property (nonatomic, assign) double isVedio;
@property (nonatomic, strong) NSString *specialId;
@property (nonatomic, strong) NSString *specialTitle;
@property (nonatomic, strong) NSString *specialCoverUrl;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *picUrl;
@property (nonatomic, assign) double instime;
@property (nonatomic, strong) NSString *isAd;
@property (nonatomic, strong) NSString *commentNums;
@property (nonatomic, strong) NSString *cateId;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
