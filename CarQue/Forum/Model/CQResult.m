//
//  CQResult.m
//
//  Created by   on 16/3/2
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "CQResult.h"


NSString *const kCQResultName = @"name";
NSString *const kCQResultCid = @"cid";
NSString *const kCQResultQNums = @"q_nums";


@interface CQResult ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation CQResult

@synthesize name = _name;
@synthesize cid = _cid;
@synthesize qNums = _qNums;


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
            self.name = [self objectOrNilForKey:kCQResultName fromDictionary:dict];
            self.cid = [self objectOrNilForKey:kCQResultCid fromDictionary:dict];
            self.qNums = [self objectOrNilForKey:kCQResultQNums fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.name forKey:kCQResultName];
    [mutableDict setValue:self.cid forKey:kCQResultCid];
    [mutableDict setValue:self.qNums forKey:kCQResultQNums];

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

    self.name = [aDecoder decodeObjectForKey:kCQResultName];
    self.cid = [aDecoder decodeObjectForKey:kCQResultCid];
    self.qNums = [aDecoder decodeObjectForKey:kCQResultQNums];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_name forKey:kCQResultName];
    [aCoder encodeObject:_cid forKey:kCQResultCid];
    [aCoder encodeObject:_qNums forKey:kCQResultQNums];
}

- (id)copyWithZone:(NSZone *)zone
{
    CQResult *copy = [[CQResult alloc] init];
    
    if (copy) {

        copy.name = [self.name copyWithZone:zone];
        copy.cid = [self.cid copyWithZone:zone];
        copy.qNums = [self.qNums copyWithZone:zone];
    }
    
    return copy;
}


@end
