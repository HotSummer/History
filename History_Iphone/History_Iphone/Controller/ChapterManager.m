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

- (id)init{
    if (self = [super init]) {
        [self loadConfigFromLocal];
        if (self.chapterConfig == nil) {//设置默认
            _chapterConfig = [[ChapterConfig alloc] init];
            _chapterConfig.readMode = Day;
            [self saveConfig];
        }
    }
    return self;
}

- (ChapterView *)createChapterView:(ChapterConfig *)config{
    ChapterView *chapterView = [[[NSBundle mainBundle] loadNibNamed:@"ChapterView" owner:self options:nil] lastObject];
    chapterView.strContent = config.content;
    [chapterView setReadMode:config.readMode];
    return chapterView;
}

- (void)loadConfigFromLocal{
    NSData *data = [[NSUserDefaults standardUserDefaults] objectForKey:@"ChapterConfig"];
    self.chapterConfig = [NSKeyedUnarchiver unarchiveObjectWithData:data];
}

//保存用户的阅读设置
- (void)saveConfig{
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:_chapterConfig];
    [[NSUserDefaults standardUserDefaults] setObject:data forKey:@"ChapterConfig"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

@end
