//
//  ChapterManager.m
//  History_Iphone
//
//  Created by summer.zhu on 5/8/14.
//  Copyright (c) 2014年 zbq. All rights reserved.
//

#import "ChapterManager.h"

@implementation ChapterManager

+ (ChapterManager *)shareInstance{
    static ChapterManager *chapterManager = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        chapterManager = [[ChapterManager alloc] init];
    });
    return chapterManager;
}

@end
