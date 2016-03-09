//
//  CQPictureResult.m
//
//  Created by HJW-MAC  on 16/3/3
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "CQPictureResult.h"


NSString *const kCQPictureResultId = @"id";
NSString *const kCQPictureResultThumbUrl = @"thumb_url";
NSString *const kCQPictureResultZanNums = @"zan_nums";
NSString *const kCQPictureResultViewNums = @"view_nums";
NSString *const kCQPictureResultCoverUrl = @"cover_url";
NSString *const kCQPictureResultSpecialTitle = @"special_title";
NSString *const kCQPictureResultSpecialId = @"special_id";
NSString *const kCQPictureResultSpecialCoverUrl = @"special_cover_url";
NSString *const kCQPictureResultTitle = @"title";
NSString *const kCQPictureResultPicUrl = @"pic_url";
NSString *const kCQPictureResultInstime = @"instime";
NSString *const kCQPictureResultCateName = @"cate_name";
NSString *const kCQPictureResultShortTitle = @"short_title";
NSString *const kCQPictureResultIsAd = @"is_ad";
NSString *const kCQPictureResultCommentNums = @"comment_nums";
NSString *const kCQPictureResultCateId = @"cate_id";


@interface CQPictureResult ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation CQPictureResult

@synthesize resultIdentifier = _resultIdentifier;
@synthesize thumbUrl = _thumbUrl;
@synthesize zanNums = _zanNums;
@synthesize viewNums = _viewNums;
@synthesize coverUrl = _coverUrl;
@synthesize specialTitle = _specialTitle;
@synthesize specialId = _specialId;
@synthesize specialCoverUrl = _specialCoverUrl;
@synthesize title = _title;
@synthesize picUrl = _picUrl;
@synthesize instime = _instime;
@synthesize cateName = _cateName;
@synthesize shortTitle = _shortTitle;
@synthesize isAd = _isAd;
@synthesize commentNums = _commentNums;
@synthesize cateId = _cateId;


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
            self.resultIdentifier = [self objectOrNilForKey:kCQPictureResultId fromDictionary:dict];
            self.thumbUrl = [self objectOrNilForKey:kCQPictureResultThumbUrl fromDictionary:dict];
            self.zanNums = [self objectOrNilForKey:kCQPictureResultZanNums fromDictionary:dict];
            self.viewNums = [self objectOrNilForKey:kCQPictureResultViewNums fromDictionary:dict];
            self.coverUrl = [self objectOrNilForKey:kCQPictureResultCoverUrl fromDictionary:dict];
            self.specialTitle = [self objectOrNilForKey:kCQPictureResultSpecialTitle fromDictionary:dict];
            self.specialId = [self objectOrNilForKey:kCQPictureResultSpecialId fromDictionary:dict];
            self.specialCoverUrl = [self objectOrNilForKey:kCQPictureResultSpecialCoverUrl fromDictionary:dict];
            self.title = [self objectOrNilForKey:kCQPictureResultTitle fromDictionary:dict];
            self.picUrl = [self objectOrNilForKey:kCQPictureResultPicUrl fromDictionary:dict];
            self.instime = [[self objectOrNilForKey:kCQPictureResultInstime fromDictionary:dict] doubleValue];
            self.cateName = [self objectOrNilForKey:kCQPictureResultCateName fromDictionary:dict];
            self.shortTitle = [self objectOrNilForKey:kCQPictureResultShortTitle fromDictionary:dict];
            self.isAd = [self objectOrNilForKey:kCQPictureResultIsAd fromDictionary:dict];
            self.commentNums = [self objectOrNilForKey:kCQPictureResultCommentNums fromDictionary:dict];
            self.cateId = [self objectOrNilForKey:kCQPictureResultCateId fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.resultIdentifier forKey:kCQPictureResultId];
    [mutableDict setValue:self.thumbUrl forKey:kCQPictureResultThumbUrl];
    [mutableDict setValue:self.zanNums forKey:kCQPictureResultZanNums];
    [mutableDict setValue:self.viewNums forKey:kCQPictureResultViewNums];
    [mutableDict setValue:self.coverUrl forKey:kCQPictureResultCoverUrl];
    [mutableDict setValue:self.specialTitle forKey:kCQPictureResultSpecialTitle];
    [mutableDict setValue:self.specialId forKey:kCQPictureResultSpecialId];
    [mutableDict setValue:self.specialCoverUrl forKey:kCQPictureResultSpecialCoverUrl];
    [mutableDict setValue:self.title forKey:kCQPictureResultTitle];
    [mutableDict setValue:self.picUrl forKey:kCQPictureResultPicUrl];
    [mutableDict setValue:[NSNumber numberWithDouble:self.instime] forKey:kCQPictureResultInstime];
    [mutableDict setValue:self.cateName forKey:kCQPictureResultCateName];
    [mutableDict setValue:self.shortTitle forKey:kCQPictureResultShortTitle];
    [mutableDict setValue:self.isAd forKey:kCQPictureResultIsAd];
    [mutableDict setValue:self.commentNums forKey:kCQPictureResultCommentNums];
    [mutableDict setValue:self.cateId forKey:kCQPictureResultCateId];

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

    self.resultIdentifier = [aDecoder decodeObjectForKey:kCQPictureResultId];
    self.thumbUrl = [aDecoder decodeObjectForKey:kCQPictureResultThumbUrl];
    self.zanNums = [aDecoder decodeObjectForKey:kCQPictureResultZanNums];
    self.viewNums = [aDecoder decodeObjectForKey:kCQPictureResultViewNums];
    self.coverUrl = [aDecoder decodeObjectForKey:kCQPictureResultCoverUrl];
    self.specialTitle = [aDecoder decodeObjectForKey:kCQPictureResultSpecialTitle];
    self.specialId = [aDecoder decodeObjectForKey:kCQPictureResultSpecialId];
    self.specialCoverUrl = [aDecoder decodeObjectForKey:kCQPictureResultSpecialCoverUrl];
    self.title = [aDecoder decodeObjectForKey:kCQPictureResultTitle];
    self.picUrl = [aDecoder decodeObjectForKey:kCQPictureResultPicUrl];
    self.instime = [aDecoder decodeDoubleForKey:kCQPictureResultInstime];
    self.cateName = [aDecoder decodeObjectForKey:kCQPictureResultCateName];
    self.shortTitle = [aDecoder decodeObjectForKey:kCQPictureResultShortTitle];
    self.isAd = [aDecoder decodeObjectForKey:kCQPictureResultIsAd];
    self.commentNums = [aDecoder decodeObjectForKey:kCQPictureResultCommentNums];
    self.cateId = [aDecoder decodeObjectForKey:kCQPictureResultCateId];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_resultIdentifier forKey:kCQPictureResultId];
    [aCoder encodeObject:_thumbUrl forKey:kCQPictureResultThumbUrl];
    [aCoder encodeObject:_zanNums forKey:kCQPictureResultZanNums];
    [aCoder encodeObject:_viewNums forKey:kCQPictureResultViewNums];
    [aCoder encodeObject:_coverUrl forKey:kCQPictureResultCoverUrl];
    [aCoder encodeObject:_specialTitle forKey:kCQPictureResultSpecialTitle];
    [aCoder encodeObject:_specialId forKey:kCQPictureResultSpecialId];
    [aCoder encodeObject:_specialCoverUrl forKey:kCQPictureResultSpecialCoverUrl];
    [aCoder encodeObject:_title forKey:kCQPictureResultTitle];
    [aCoder encodeObject:_picUrl forKey:kCQPictureResultPicUrl];
    [aCoder encodeDouble:_instime forKey:kCQPictureResultInstime];
    [aCoder encodeObject:_cateName forKey:kCQPictureResultCateName];
    [aCoder encodeObject:_shortTitle forKey:kCQPictureResultShortTitle];
    [aCoder encodeObject:_isAd forKey:kCQPictureResultIsAd];
    [aCoder encodeObject:_commentNums forKey:kCQPictureResultCommentNums];
    [aCoder encodeObject:_cateId forKey:kCQPictureResultCateId];
}

- (id)copyWithZone:(NSZone *)zone
{
    CQPictureResult *copy = [[CQPictureResult alloc] init];
    
    if (copy) {

        copy.resultIdentifier = [self.resultIdentifier copyWithZone:zone];
        copy.thumbUrl = [self.thumbUrl copyWithZone:zone];
        copy.zanNums = [self.zanNums copyWithZone:zone];
        copy.viewNums = [self.viewNums copyWithZone:zone];
        copy.coverUrl = [self.coverUrl copyWithZone:zone];
        copy.specialTitle = [self.specialTitle copyWithZone:zone];
        copy.specialId = [self.specialId copyWithZone:zone];
        copy.specialCoverUrl = [self.specialCoverUrl copyWithZone:zone];
        copy.title = [self.title copyWithZone:zone];
        copy.picUrl = [self.picUrl copyWithZone:zone];
        copy.instime = self.instime;
        copy.cateName = [self.cateName copyWithZone:zone];
        copy.shortTitle = [self.shortTitle copyWithZone:zone];
        copy.isAd = [self.isAd copyWithZone:zone];
        copy.commentNums = [self.commentNums copyWithZone:zone];
        copy.cateId = [self.cateId copyWithZone:zone];
    }
    
    return copy;
}


@end
