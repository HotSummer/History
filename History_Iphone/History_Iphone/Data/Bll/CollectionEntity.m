//
//  CollectionEntity.m
//  History_Iphone
//
//  Created by summer.zhu on 4/8/14.
//  Copyright (c) 2014年 zbq. All rights reserved.
//

#import "CollectionEntity.h"

@implementation CollectionEntity

#pragma mark - NSCopying
- (id)copyWithZone:(NSZone *)zone {
    CollectionEntity* copy = [[[self class] allocWithZone:zone] init];
    copy.contentId = [_contentId copyWithZone:zone];
    copy.collectTime = [_collectTime copyWithZone:zone];
    return copy;
}

#pragma mark - NSCoding
- (id)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super init]) {
        _contentId = [aDecoder decodeObjectForKey:@"contentId"];
        _collectTime = [aDecoder decodeObjectForKey:@"collectTime"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:_contentId forKey:@"contentId"];
    [aCoder encodeObject:_collectTime forKey:@"collectTime"];
}

@end
