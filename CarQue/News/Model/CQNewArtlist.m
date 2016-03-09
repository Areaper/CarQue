//
//  CQNewArtlist.m
//
//  Created by HJW-MAC  on 16/3/2
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "CQNewArtlist.h"


NSString *const kCQNewArtlistId = @"id";
NSString *const kCQNewArtlistThumbUrl = @"thumb_url";
NSString *const kCQNewArtlistCoverUrl = @"cover_url";
NSString *const kCQNewArtlistIsTop = @"is_top";
NSString *const kCQNewArtlistIsVedio = @"is_vedio";
NSString *const kCQNewArtlistSpecialId = @"special_id";
NSString *const kCQNewArtlistSpecialTitle = @"special_title";
NSString *const kCQNewArtlistSpecialCoverUrl = @"special_cover_url";
NSString *const kCQNewArtlistTitle = @"title";
NSString *const kCQNewArtlistPicUrl = @"pic_url";
NSString *const kCQNewArtlistInstime = @"instime";
NSString *const kCQNewArtlistIsAd = @"is_ad";
NSString *const kCQNewArtlistCommentNums = @"comment_nums";
NSString *const kCQNewArtlistCateId = @"cate_id";


@interface CQNewArtlist ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation CQNewArtlist

@synthesize artlistIdentifier = _artlistIdentifier;
@synthesize thumbUrl = _thumbUrl;
@synthesize coverUrl = _coverUrl;
@synthesize isTop = _isTop;
@synthesize isVedio = _isVedio;
@synthesize specialId = _specialId;
@synthesize specialTitle = _specialTitle;
@synthesize specialCoverUrl = _specialCoverUrl;
@synthesize title = _title;
@synthesize picUrl = _picUrl;
@synthesize instime = _instime;
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
            self.artlistIdentifier = [self objectOrNilForKey:kCQNewArtlistId fromDictionary:dict];
            self.thumbUrl = [self objectOrNilForKey:kCQNewArtlistThumbUrl fromDictionary:dict];
            self.coverUrl = [self objectOrNilForKey:kCQNewArtlistCoverUrl fromDictionary:dict];
            self.isTop = [self objectOrNilForKey:kCQNewArtlistIsTop fromDictionary:dict];
            self.isVedio = [[self objectOrNilForKey:kCQNewArtlistIsVedio fromDictionary:dict] doubleValue];
            self.specialId = [self objectOrNilForKey:kCQNewArtlistSpecialId fromDictionary:dict];
            self.specialTitle = [self objectOrNilForKey:kCQNewArtlistSpecialTitle fromDictionary:dict];
            self.specialCoverUrl = [self objectOrNilForKey:kCQNewArtlistSpecialCoverUrl fromDictionary:dict];
            self.title = [self objectOrNilForKey:kCQNewArtlistTitle fromDictionary:dict];
            self.picUrl = [self objectOrNilForKey:kCQNewArtlistPicUrl fromDictionary:dict];
            self.instime = [[self objectOrNilForKey:kCQNewArtlistInstime fromDictionary:dict] doubleValue];
            self.isAd = [self objectOrNilForKey:kCQNewArtlistIsAd fromDictionary:dict];
            self.commentNums = [self objectOrNilForKey:kCQNewArtlistCommentNums fromDictionary:dict];
            self.cateId = [self objectOrNilForKey:kCQNewArtlistCateId fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.artlistIdentifier forKey:kCQNewArtlistId];
    [mutableDict setValue:self.thumbUrl forKey:kCQNewArtlistThumbUrl];
    [mutableDict setValue:self.coverUrl forKey:kCQNewArtlistCoverUrl];
    [mutableDict setValue:self.isTop forKey:kCQNewArtlistIsTop];
    [mutableDict setValue:[NSNumber numberWithDouble:self.isVedio] forKey:kCQNewArtlistIsVedio];
    [mutableDict setValue:self.specialId forKey:kCQNewArtlistSpecialId];
    [mutableDict setValue:self.specialTitle forKey:kCQNewArtlistSpecialTitle];
    [mutableDict setValue:self.specialCoverUrl forKey:kCQNewArtlistSpecialCoverUrl];
    [mutableDict setValue:self.title forKey:kCQNewArtlistTitle];
    [mutableDict setValue:self.picUrl forKey:kCQNewArtlistPicUrl];
    [mutableDict setValue:[NSNumber numberWithDouble:self.instime] forKey:kCQNewArtlistInstime];
    [mutableDict setValue:self.isAd forKey:kCQNewArtlistIsAd];
    [mutableDict setValue:self.commentNums forKey:kCQNewArtlistCommentNums];
    [mutableDict setValue:self.cateId forKey:kCQNewArtlistCateId];

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

    self.artlistIdentifier = [aDecoder decodeObjectForKey:kCQNewArtlistId];
    self.thumbUrl = [aDecoder decodeObjectForKey:kCQNewArtlistThumbUrl];
    self.coverUrl = [aDecoder decodeObjectForKey:kCQNewArtlistCoverUrl];
    self.isTop = [aDecoder decodeObjectForKey:kCQNewArtlistIsTop];
    self.isVedio = [aDecoder decodeDoubleForKey:kCQNewArtlistIsVedio];
    self.specialId = [aDecoder decodeObjectForKey:kCQNewArtlistSpecialId];
    self.specialTitle = [aDecoder decodeObjectForKey:kCQNewArtlistSpecialTitle];
    self.specialCoverUrl = [aDecoder decodeObjectForKey:kCQNewArtlistSpecialCoverUrl];
    self.title = [aDecoder decodeObjectForKey:kCQNewArtlistTitle];
    self.picUrl = [aDecoder decodeObjectForKey:kCQNewArtlistPicUrl];
    self.instime = [aDecoder decodeDoubleForKey:kCQNewArtlistInstime];
    self.isAd = [aDecoder decodeObjectForKey:kCQNewArtlistIsAd];
    self.commentNums = [aDecoder decodeObjectForKey:kCQNewArtlistCommentNums];
    self.cateId = [aDecoder decodeObjectForKey:kCQNewArtlistCateId];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_artlistIdentifier forKey:kCQNewArtlistId];
    [aCoder encodeObject:_thumbUrl forKey:kCQNewArtlistThumbUrl];
    [aCoder encodeObject:_coverUrl forKey:kCQNewArtlistCoverUrl];
    [aCoder encodeObject:_isTop forKey:kCQNewArtlistIsTop];
    [aCoder encodeDouble:_isVedio forKey:kCQNewArtlistIsVedio];
    [aCoder encodeObject:_specialId forKey:kCQNewArtlistSpecialId];
    [aCoder encodeObject:_specialTitle forKey:kCQNewArtlistSpecialTitle];
    [aCoder encodeObject:_specialCoverUrl forKey:kCQNewArtlistSpecialCoverUrl];
    [aCoder encodeObject:_title forKey:kCQNewArtlistTitle];
    [aCoder encodeObject:_picUrl forKey:kCQNewArtlistPicUrl];
    [aCoder encodeDouble:_instime forKey:kCQNewArtlistInstime];
    [aCoder encodeObject:_isAd forKey:kCQNewArtlistIsAd];
    [aCoder encodeObject:_commentNums forKey:kCQNewArtlistCommentNums];
    [aCoder encodeObject:_cateId forKey:kCQNewArtlistCateId];
}

- (id)copyWithZone:(NSZone *)zone
{
    CQNewArtlist *copy = [[CQNewArtlist alloc] init];
    
    if (copy) {

        copy.artlistIdentifier = [self.artlistIdentifier copyWithZone:zone];
        copy.thumbUrl = [self.thumbUrl copyWithZone:zone];
        copy.coverUrl = [self.coverUrl copyWithZone:zone];
        copy.isTop = [self.isTop copyWithZone:zone];
        copy.isVedio = self.isVedio;
        copy.specialId = [self.specialId copyWithZone:zone];
        copy.specialTitle = [self.specialTitle copyWithZone:zone];
        copy.specialCoverUrl = [self.specialCoverUrl copyWithZone:zone];
        copy.title = [self.title copyWithZone:zone];
        copy.picUrl = [self.picUrl copyWithZone:zone];
        copy.instime = self.instime;
        copy.isAd = [self.isAd copyWithZone:zone];
        copy.commentNums = [self.commentNums copyWithZone:zone];
        copy.cateId = [self.cateId copyWithZone:zone];
    }
    
    return copy;
}


@end
