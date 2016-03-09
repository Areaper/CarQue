//
//  CQHotlist.m
//
//  Created by   on 16/3/1
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "CQHotlist.h"


NSString *const kCQHotlistStatus = @"status";
NSString *const kCQHotlistInsTime = @"ins_time";
NSString *const kCQHotlistMemberName = @"member_name";
NSString *const kCQHotlistTitle = @"title";
NSString *const kCQHotlistMemberId = @"member_id";
NSString *const kCQHotlistToANums = @"to_a_nums";
NSString *const kCQHotlistMemberImg = @"member_img";
NSString *const kCQHotlistQId = @"q_id";
NSString *const kCQHotlistCommentNums = @"comment_nums";
NSString *const kCQHotlistImgsCount = @"imgs_count";


@interface CQHotlist ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation CQHotlist

@synthesize status = _status;
@synthesize insTime = _insTime;
@synthesize memberName = _memberName;
@synthesize title = _title;
@synthesize memberId = _memberId;
@synthesize toANums = _toANums;
@synthesize memberImg = _memberImg;
@synthesize qId = _qId;
@synthesize commentNums = _commentNums;
@synthesize imgsCount = _imgsCount;


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
            self.status = [self objectOrNilForKey:kCQHotlistStatus fromDictionary:dict];
            self.insTime = [[self objectOrNilForKey:kCQHotlistInsTime fromDictionary:dict] doubleValue];
            self.memberName = [self objectOrNilForKey:kCQHotlistMemberName fromDictionary:dict];
            self.title = [self objectOrNilForKey:kCQHotlistTitle fromDictionary:dict];
            self.memberId = [self objectOrNilForKey:kCQHotlistMemberId fromDictionary:dict];
            self.toANums = [[self objectOrNilForKey:kCQHotlistToANums fromDictionary:dict] doubleValue];
            self.memberImg = [self objectOrNilForKey:kCQHotlistMemberImg fromDictionary:dict];
            self.qId = [self objectOrNilForKey:kCQHotlistQId fromDictionary:dict];
            self.commentNums = [self objectOrNilForKey:kCQHotlistCommentNums fromDictionary:dict];
            self.imgsCount = [[self objectOrNilForKey:kCQHotlistImgsCount fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.status forKey:kCQHotlistStatus];
    [mutableDict setValue:[NSNumber numberWithDouble:self.insTime] forKey:kCQHotlistInsTime];
    [mutableDict setValue:self.memberName forKey:kCQHotlistMemberName];
    [mutableDict setValue:self.title forKey:kCQHotlistTitle];
    [mutableDict setValue:self.memberId forKey:kCQHotlistMemberId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.toANums] forKey:kCQHotlistToANums];
    [mutableDict setValue:self.memberImg forKey:kCQHotlistMemberImg];
    [mutableDict setValue:self.qId forKey:kCQHotlistQId];
    [mutableDict setValue:self.commentNums forKey:kCQHotlistCommentNums];
    [mutableDict setValue:[NSNumber numberWithDouble:self.imgsCount] forKey:kCQHotlistImgsCount];

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

    self.status = [aDecoder decodeObjectForKey:kCQHotlistStatus];
    self.insTime = [aDecoder decodeDoubleForKey:kCQHotlistInsTime];
    self.memberName = [aDecoder decodeObjectForKey:kCQHotlistMemberName];
    self.title = [aDecoder decodeObjectForKey:kCQHotlistTitle];
    self.memberId = [aDecoder decodeObjectForKey:kCQHotlistMemberId];
    self.toANums = [aDecoder decodeDoubleForKey:kCQHotlistToANums];
    self.memberImg = [aDecoder decodeObjectForKey:kCQHotlistMemberImg];
    self.qId = [aDecoder decodeObjectForKey:kCQHotlistQId];
    self.commentNums = [aDecoder decodeObjectForKey:kCQHotlistCommentNums];
    self.imgsCount = [aDecoder decodeDoubleForKey:kCQHotlistImgsCount];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_status forKey:kCQHotlistStatus];
    [aCoder encodeDouble:_insTime forKey:kCQHotlistInsTime];
    [aCoder encodeObject:_memberName forKey:kCQHotlistMemberName];
    [aCoder encodeObject:_title forKey:kCQHotlistTitle];
    [aCoder encodeObject:_memberId forKey:kCQHotlistMemberId];
    [aCoder encodeDouble:_toANums forKey:kCQHotlistToANums];
    [aCoder encodeObject:_memberImg forKey:kCQHotlistMemberImg];
    [aCoder encodeObject:_qId forKey:kCQHotlistQId];
    [aCoder encodeObject:_commentNums forKey:kCQHotlistCommentNums];
    [aCoder encodeDouble:_imgsCount forKey:kCQHotlistImgsCount];
}

- (id)copyWithZone:(NSZone *)zone
{
    CQHotlist *copy = [[CQHotlist alloc] init];
    
    if (copy) {

        copy.status = [self.status copyWithZone:zone];
        copy.insTime = self.insTime;
        copy.memberName = [self.memberName copyWithZone:zone];
        copy.title = [self.title copyWithZone:zone];
        copy.memberId = [self.memberId copyWithZone:zone];
        copy.toANums = self.toANums;
        copy.memberImg = [self.memberImg copyWithZone:zone];
        copy.qId = [self.qId copyWithZone:zone];
        copy.commentNums = [self.commentNums copyWithZone:zone];
        copy.imgsCount = self.imgsCount;
    }
    
    return copy;
}


@end
