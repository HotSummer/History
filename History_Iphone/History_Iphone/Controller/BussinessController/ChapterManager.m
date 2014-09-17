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
        
        [_chapterConfig addObserver:self forKeyPath:@"readMode" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:NULL];
        [_chapterConfig addObserver:self forKeyPath:@"readSize" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:NULL];
    }
    return self;
}

- (ChapterView *)createChapterView{
    ChapterView *chapterView = [[[NSBundle mainBundle] loadNibNamed:@"ChapterView" owner:self options:nil] lastObject];
    chapterView.strContent = _content;
    [chapterView setReadMode:_chapterConfig.readMode];
    return chapterView;
}

- (UIFont *)getTextFont{
    return [_chapterConfig getFont];
}

#pragma mark - KVO 保存数据
- (void)setChapterConfigReadMode:(ReadMode)readMode{
    _chapterConfig.readMode = readMode;
}

- (void)setChapterConfigReadSize:(ReadSize)readSize{
    _chapterConfig.readSize = readSize;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    if ([keyPath isEqualToString:@"readMode"] || [keyPath isEqualToString:@"readSize"]) {
        [[ChapterManager shareInstance] saveConfig];
    }
}

#pragma mark - 读取保存数据
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

- (void)dealloc{
    [_chapterConfig removeObserver:self forKeyPath:@"readMode"];
}

@end
