//
//  CQNewlist.m
//
//  Created by   on 16/3/1
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "CQNewlist.h"


NSString *const kCQNewlistStatus = @"status";
NSString *const kCQNewlistInsTime = @"ins_time";
NSString *const kCQNewlistMemberName = @"member_name";
NSString *const kCQNewlistTitle = @"title";
NSString *const kCQNewlistMemberId = @"member_id";
NSString *const kCQNewlistToANums = @"to_a_nums";
NSString *const kCQNewlistMemberImg = @"member_img";
NSString *const kCQNewlistQId = @"q_id";
NSString *const kCQNewlistCommentNums = @"comment_nums";
NSString *const kCQNewlistImgsCount = @"imgs_count";


@interface CQNewlist ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation CQNewlist

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
            self.status = [self objectOrNilForKey:kCQNewlistStatus fromDictionary:dict];
            self.insTime = [[self objectOrNilForKey:kCQNewlistInsTime fromDictionary:dict] doubleValue];
            self.memberName = [self objectOrNilForKey:kCQNewlistMemberName fromDictionary:dict];
            self.title = [self objectOrNilForKey:kCQNewlistTitle fromDictionary:dict];
            self.memberId = [self objectOrNilForKey:kCQNewlistMemberId fromDictionary:dict];
            self.toANums = [[self objectOrNilForKey:kCQNewlistToANums fromDictionary:dict] doubleValue];
            self.memberImg = [self objectOrNilForKey:kCQNewlistMemberImg fromDictionary:dict];
            self.qId = [self objectOrNilForKey:kCQNewlistQId fromDictionary:dict];
            self.commentNums = [self objectOrNilForKey:kCQNewlistCommentNums fromDictionary:dict];
            self.imgsCount = [[self objectOrNilForKey:kCQNewlistImgsCount fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.status forKey:kCQNewlistStatus];
    [mutableDict setValue:[NSNumber numberWithDouble:self.insTime] forKey:kCQNewlistInsTime];
    [mutableDict setValue:self.memberName forKey:kCQNewlistMemberName];
    [mutableDict setValue:self.title forKey:kCQNewlistTitle];
    [mutableDict setValue:self.memberId forKey:kCQNewlistMemberId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.toANums] forKey:kCQNewlistToANums];
    [mutableDict setValue:self.memberImg forKey:kCQNewlistMemberImg];
    [mutableDict setValue:self.qId forKey:kCQNewlistQId];
    [mutableDict setValue:self.commentNums forKey:kCQNewlistCommentNums];
    [mutableDict setValue:[NSNumber numberWithDouble:self.imgsCount] forKey:kCQNewlistImgsCount];

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

    self.status = [aDecoder decodeObjectForKey:kCQNewlistStatus];
    self.insTime = [aDecoder decodeDoubleForKey:kCQNewlistInsTime];
    self.memberName = [aDecoder decodeObjectForKey:kCQNewlistMemberName];
    self.title = [aDecoder decodeObjectForKey:kCQNewlistTitle];
    self.memberId = [aDecoder decodeObjectForKey:kCQNewlistMemberId];
    self.toANums = [aDecoder decodeDoubleForKey:kCQNewlistToANums];
    self.memberImg = [aDecoder decodeObjectForKey:kCQNewlistMemberImg];
    self.qId = [aDecoder decodeObjectForKey:kCQNewlistQId];
    self.commentNums = [aDecoder decodeObjectForKey:kCQNewlistCommentNums];
    self.imgsCount = [aDecoder decodeDoubleForKey:kCQNewlistImgsCount];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_status forKey:kCQNewlistStatus];
    [aCoder encodeDouble:_insTime forKey:kCQNewlistInsTime];
    [aCoder encodeObject:_memberName forKey:kCQNewlistMemberName];
    [aCoder encodeObject:_title forKey:kCQNewlistTitle];
    [aCoder encodeObject:_memberId forKey:kCQNewlistMemberId];
    [aCoder encodeDouble:_toANums forKey:kCQNewlistToANums];
    [aCoder encodeObject:_memberImg forKey:kCQNewlistMemberImg];
    [aCoder encodeObject:_qId forKey:kCQNewlistQId];
    [aCoder encodeObject:_commentNums forKey:kCQNewlistCommentNums];
    [aCoder encodeDouble:_imgsCount forKey:kCQNewlistImgsCount];
}

- (id)copyWithZone:(NSZone *)zone
{
    CQNewlist *copy = [[CQNewlist alloc] init];
    
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
