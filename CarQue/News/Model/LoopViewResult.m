//
//  LoopViewResult.m
//
//  Created by HJW-MAC  on 16/3/4
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "LoopViewResult.h"


NSString *const kLoopViewResultWeight = @"weight";
NSString *const kLoopViewResultHdComNums = @"hd_com_nums";
NSString *const kLoopViewResultArticleTitle = @"article_title";
NSString *const kLoopViewResultId = @"id";
NSString *const kLoopViewResultArticleUrl = @"article_url";
NSString *const kLoopViewResultMeta = @"meta";
NSString *const kLoopViewResultArticleId = @"article_id";
NSString *const kLoopViewResultType = @"type";
NSString *const kLoopViewResultShareHdUrl = @"share_hd_url";
NSString *const kLoopViewResultConnectionType = @"connection_type";
NSString *const kLoopViewResultUrl = @"url";


@interface LoopViewResult ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation LoopViewResult

@synthesize weight = _weight;
@synthesize hdComNums = _hdComNums;
@synthesize articleTitle = _articleTitle;
@synthesize resultIdentifier = _resultIdentifier;
@synthesize articleUrl = _articleUrl;
@synthesize meta = _meta;
@synthesize articleId = _articleId;
@synthesize type = _type;
@synthesize shareHdUrl = _shareHdUrl;
@synthesize connectionType = _connectionType;
@synthesize url = _url;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.weight = [self objectOrNilForKey:kLoopViewResultWeight fromDictionary:dict];
            self.hdComNums = [[self objectOrNilForKey:kLoopViewResultHdComNums fromDictionary:dict] doubleValue];
            self.articleTitle = [self objectOrNilForKey:kLoopViewResultArticleTitle fromDictionary:dict];
            self.resultIdentifier = [self objectOrNilForKey:kLoopViewResultId fromDictionary:dict];
            self.articleUrl = [self objectOrNilForKey:kLoopViewResultArticleUrl fromDictionary:dict];
            self.meta = [self objectOrNilForKey:kLoopViewResultMeta fromDictionary:dict];
            self.articleId = [self objectOrNilForKey:kLoopViewResultArticleId fromDictionary:dict];
            self.type = [self objectOrNilForKey:kLoopViewResultType fromDictionary:dict];
            self.shareHdUrl = [self objectOrNilForKey:kLoopViewResultShareHdUrl fromDictionary:dict];
            self.connectionType = [self objectOrNilForKey:kLoopViewResultConnectionType fromDictionary:dict];
            self.url = [self objectOrNilForKey:kLoopViewResultUrl fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.weight forKey:kLoopViewResultWeight];
    [mutableDict setValue:[NSNumber numberWithDouble:self.hdComNums] forKey:kLoopViewResultHdComNums];
    [mutableDict setValue:self.articleTitle forKey:kLoopViewResultArticleTitle];
    [mutableDict setValue:self.resultIdentifier forKey:kLoopViewResultId];
    [mutableDict setValue:self.articleUrl forKey:kLoopViewResultArticleUrl];
    [mutableDict setValue:self.meta forKey:kLoopViewResultMeta];
    [mutableDict setValue:self.articleId forKey:kLoopViewResultArticleId];
    [mutableDict setValue:self.type forKey:kLoopViewResultType];
    [mutableDict setValue:self.shareHdUrl forKey:kLoopViewResultShareHdUrl];
    [mutableDict setValue:self.connectionType forKey:kLoopViewResultConnectionType];
    [mutableDict setValue:self.url forKey:kLoopViewResultUrl];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description 
{
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.weight = [aDecoder decodeObjectForKey:kLoopViewResultWeight];
    self.hdComNums = [aDecoder decodeDoubleForKey:kLoopViewResultHdComNums];
    self.articleTitle = [aDecoder decodeObjectForKey:kLoopViewResultArticleTitle];
    self.resultIdentifier = [aDecoder decodeObjectForKey:kLoopViewResultId];
    self.articleUrl = [aDecoder decodeObjectForKey:kLoopViewResultArticleUrl];
    self.meta = [aDecoder decodeObjectForKey:kLoopViewResultMeta];
    self.articleId = [aDecoder decodeObjectForKey:kLoopViewResultArticleId];
    self.type = [aDecoder decodeObjectForKey:kLoopViewResultType];
    self.shareHdUrl = [aDecoder decodeObjectForKey:kLoopViewResultShareHdUrl];
    self.connectionType = [aDecoder decodeObjectForKey:kLoopViewResultConnectionType];
    self.url = [aDecoder decodeObjectForKey:kLoopViewResultUrl];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_weight forKey:kLoopViewResultWeight];
    [aCoder encodeDouble:_hdComNums forKey:kLoopViewResultHdComNums];
    [aCoder encodeObject:_articleTitle forKey:kLoopViewResultArticleTitle];
    [aCoder encodeObject:_resultIdentifier forKey:kLoopViewResultId];
    [aCoder encodeObject:_articleUrl forKey:kLoopViewResultArticleUrl];
    [aCoder encodeObject:_meta forKey:kLoopViewResultMeta];
    [aCoder encodeObject:_articleId forKey:kLoopViewResultArticleId];
    [aCoder encodeObject:_type forKey:kLoopViewResultType];
    [aCoder encodeObject:_shareHdUrl forKey:kLoopViewResultShareHdUrl];
    [aCoder encodeObject:_connectionType forKey:kLoopViewResultConnectionType];
    [aCoder encodeObject:_url forKey:kLoopViewResultUrl];
}

- (id)copyWithZone:(NSZone *)zone
{
    LoopViewResult *copy = [[LoopViewResult alloc] init];
    
    if (copy) {

        copy.weight = [self.weight copyWithZone:zone];
        copy.hdComNums = self.hdComNums;
        copy.articleTitle = [self.articleTitle copyWithZone:zone];
        copy.resultIdentifier = [self.resultIdentifier copyWithZone:zone];
        copy.articleUrl = [self.articleUrl copyWithZone:zone];
        copy.meta = [self.meta copyWithZone:zone];
        copy.articleId = [self.articleId copyWithZone:zone];
        copy.type = [self.type copyWithZone:zone];
        copy.shareHdUrl = [self.shareHdUrl copyWithZone:zone];
        copy.connectionType = [self.connectionType copyWithZone:zone];
        copy.url = [self.url copyWithZone:zone];
    }
    
    return copy;
}


@end
