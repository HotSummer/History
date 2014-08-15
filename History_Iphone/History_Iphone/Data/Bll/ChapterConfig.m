
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
        self.readSize = [aDecoder decodeIntForKey:@"readSize"];
        self.readMode = [aDecoder decodeIntForKey:@"readMode"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeInt:self.readSize forKey:@"readSize"];
    [aCoder encodeInt:self.readMode forKey:@"readMode"];
}

- (id)copyWithZone:(NSZone *)zone{
    ChapterConfig *copy = [[[self class] allocWithZone:zone] init];
    copy.readMode = self.readMode;
    copy.readSize = self.readSize;
    return copy;
}

- (UIFont *)getFont{
    if (_readSize == Small) {
        return [UIFont systemFontOfSize:14.0];
    }else{
        return [UIFont systemFontOfSize:16.0];
    }
}

@end
