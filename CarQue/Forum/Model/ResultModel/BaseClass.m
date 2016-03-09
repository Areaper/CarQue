//
//  BaseClass.m
//
//  Created by   on 16/3/4
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "BaseClass.h"
#import "Result.h"


NSString *const kBaseClassResult = @"result";
NSString *const kBaseClassCode = @"code";


@interface BaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation BaseClass

@synthesize result = _result;
@synthesize code = _code;


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
    NSObject *receivedResult = [dict objectForKey:kBaseClassResult];
    NSMutableArray *parsedResult = [NSMutableArray array];
    if ([receivedResult isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedResult) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedResult addObject:[Result modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedResult isKindOfClass:[NSDictionary class]]) {
       [parsedResult addObject:[Result modelObjectWithDictionary:(NSDictionary *)receivedResult]];
    }

    self.result = [NSArray arrayWithArray:parsedResult];
            self.code = [[self objectOrNilForKey:kBaseClassCode fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    NSMutableArray *tempArrayForResult = [NSMutableArray array];
    for (NSObject *subArrayObject in self.result) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForResult addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForResult addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForResult] forKey:kBaseClassResult];
    [mutableDict setValue:[NSNumber numberWithDouble:self.code] forKey:kBaseClassCode];

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

    self.result = [aDecoder decodeObjectForKey:kBaseClassResult];
    self.code = [aDecoder decodeDoubleForKey:kBaseClassCode];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_result forKey:kBaseClassResult];
    [aCoder encodeDouble:_code forKey:kBaseClassCode];
}

- (id)copyWithZone:(NSZone *)zone
{
    BaseClass *copy = [[BaseClass alloc] init];
    
    if (copy) {

        copy.result = [self.result copyWithZone:zone];
        copy.code = self.code;
    }
    
    return copy;
}


@end
