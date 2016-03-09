//
//  Result.m
//
//  Created by   on 16/3/4
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "Result.h"
#import "Author.h"


NSString *const kResultZanNums = @"zan_nums";
NSString *const kResultId = @"id";
NSString *const kResultContent = @"content";
NSString *const kResultInstime = @"instime";
NSString *const kResultAuthor = @"author";


@interface Result ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Result

@synthesize zanNums = _zanNums;
@synthesize resultIdentifier = _resultIdentifier;
@synthesize content = _content;
@synthesize instime = _instime;
@synthesize author = _author;


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
            self.zanNums = [self objectOrNilForKey:kResultZanNums fromDictionary:dict];
            self.resultIdentifier = [self objectOrNilForKey:kResultId fromDictionary:dict];
            self.content = [self objectOrNilForKey:kResultContent fromDictionary:dict];
            self.instime = [self objectOrNilForKey:kResultInstime fromDictionary:dict];
            self.author = [Author modelObjectWithDictionary:[dict objectForKey:kResultAuthor]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.zanNums forKey:kResultZanNums];
    [mutableDict setValue:self.resultIdentifier forKey:kResultId];
    [mutableDict setValue:self.content forKey:kResultContent];
    [mutableDict setValue:self.instime forKey:kResultInstime];
    [mutableDict setValue:[self.author dictionaryRepresentation] forKey:kResultAuthor];

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

    self.zanNums = [aDecoder decodeObjectForKey:kResultZanNums];
    self.resultIdentifier = [aDecoder decodeObjectForKey:kResultId];
    self.content = [aDecoder decodeObjectForKey:kResultContent];
    self.instime = [aDecoder decodeObjectForKey:kResultInstime];
    self.author = [aDecoder decodeObjectForKey:kResultAuthor];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_zanNums forKey:kResultZanNums];
    [aCoder encodeObject:_resultIdentifier forKey:kResultId];
    [aCoder encodeObject:_content forKey:kResultContent];
    [aCoder encodeObject:_instime forKey:kResultInstime];
    [aCoder encodeObject:_author forKey:kResultAuthor];
}

- (id)copyWithZone:(NSZone *)zone
{
    Result *copy = [[Result alloc] init];
    
    if (copy) {

        copy.zanNums = [self.zanNums copyWithZone:zone];
        copy.resultIdentifier = [self.resultIdentifier copyWithZone:zone];
        copy.content = [self.content copyWithZone:zone];
        copy.instime = [self.instime copyWithZone:zone];
        copy.author = [self.author copyWithZone:zone];
    }
    
    return copy;
}


@end
