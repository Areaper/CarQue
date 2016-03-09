//
//  Author.m
//
//  Created by   on 16/3/4
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "Author.h"


NSString *const kAuthorSex = @"sex";
NSString *const kAuthorUid = @"uid";
NSString *const kAuthorNickname = @"nickname";
NSString *const kAuthorMemberIcon = @"member_icon";
NSString *const kAuthorIsAdmin = @"is_admin";


@interface Author ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Author

@synthesize sex = _sex;
@synthesize uid = _uid;
@synthesize nickname = _nickname;
@synthesize memberIcon = _memberIcon;
@synthesize isAdmin = _isAdmin;


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
            self.sex = [self objectOrNilForKey:kAuthorSex fromDictionary:dict];
            self.uid = [self objectOrNilForKey:kAuthorUid fromDictionary:dict];
            self.nickname = [self objectOrNilForKey:kAuthorNickname fromDictionary:dict];
            self.memberIcon = [self objectOrNilForKey:kAuthorMemberIcon fromDictionary:dict];
            self.isAdmin = [[self objectOrNilForKey:kAuthorIsAdmin fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.sex forKey:kAuthorSex];
    [mutableDict setValue:self.uid forKey:kAuthorUid];
    [mutableDict setValue:self.nickname forKey:kAuthorNickname];
    [mutableDict setValue:self.memberIcon forKey:kAuthorMemberIcon];
    [mutableDict setValue:[NSNumber numberWithDouble:self.isAdmin] forKey:kAuthorIsAdmin];

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

    self.sex = [aDecoder decodeObjectForKey:kAuthorSex];
    self.uid = [aDecoder decodeObjectForKey:kAuthorUid];
    self.nickname = [aDecoder decodeObjectForKey:kAuthorNickname];
    self.memberIcon = [aDecoder decodeObjectForKey:kAuthorMemberIcon];
    self.isAdmin = [aDecoder decodeDoubleForKey:kAuthorIsAdmin];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_sex forKey:kAuthorSex];
    [aCoder encodeObject:_uid forKey:kAuthorUid];
    [aCoder encodeObject:_nickname forKey:kAuthorNickname];
    [aCoder encodeObject:_memberIcon forKey:kAuthorMemberIcon];
    [aCoder encodeDouble:_isAdmin forKey:kAuthorIsAdmin];
}

- (id)copyWithZone:(NSZone *)zone
{
    Author *copy = [[Author alloc] init];
    
    if (copy) {

        copy.sex = [self.sex copyWithZone:zone];
        copy.uid = [self.uid copyWithZone:zone];
        copy.nickname = [self.nickname copyWithZone:zone];
        copy.memberIcon = [self.memberIcon copyWithZone:zone];
        copy.isAdmin = self.isAdmin;
    }
    
    return copy;
}


@end
