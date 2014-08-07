
//
//  ChapterConfig.m
//  History_Iphone
//
//  Created by zbq on 14-8-7.
//  Copyright (c) 2014年 zbq. All rights reserved.
//

#import "ChapterConfig.h"

@implementation ChapterConfig

- (id)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super init]) {
        self.content = [aDecoder decodeObjectForKey:@"content"];
        self.readMode = [aDecoder decodeIntForKey:@"readMode"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.content forKey:@"content"];
    [aCoder encodeInteger:self.readMode forKey:@"readMode"];
}

- (id)copyWithZone:(NSZone *)zone{
    ChapterConfig *copy = [[[self class] allocWithZone:zone] init];
    copy.content = [_content copyWithZone:zone];
    copy.readMode = self.readMode;
    return copy;
}

@end
