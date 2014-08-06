//
//  ChapterManager.m
//  History_Iphone
//
//  Created by summer.zhu on 5/8/14.
//  Copyright (c) 2014年 zbq. All rights reserved.
//

#import "ChapterManager.h"

@implementation ChapterConfig

@end

@implementation ChapterManager

+ (ChapterManager *)shareInstance{
    static ChapterManager *chapterManager = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        chapterManager = [[ChapterManager alloc] init];
    });
    return chapterManager;
}

- (ChapterView *)createChapterView:(ChapterConfig *)config{
    ChapterView *chapterView = [[[NSBundle mainBundle] loadNibNamed:@"ChapterView" owner:self options:nil] lastObject];
    chapterView.strContent = config.content;
    [chapterView setReadMode:config.readMode];
    return chapterView;
}

@end
