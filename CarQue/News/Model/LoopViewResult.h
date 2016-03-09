//
//  LoopViewResult.h
//
//  Created by HJW-MAC  on 16/3/4
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface LoopViewResult : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *weight;
@property (nonatomic, assign) double hdComNums;
@property (nonatomic, strong) NSString *articleTitle;
@property (nonatomic, strong) NSString *resultIdentifier;
@property (nonatomic, strong) NSString *articleUrl;
@property (nonatomic, strong) NSString *meta;
@property (nonatomic, strong) NSString *articleId;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSString *shareHdUrl;
@property (nonatomic, strong) NSString *connectionType;
@property (nonatomic, strong) NSString *url;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
