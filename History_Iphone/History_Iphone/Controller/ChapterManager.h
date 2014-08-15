//
//  ChapterManager.h
//  History_Iphone
//
//  Created by summer.zhu on 5/8/14.
//  Copyright (c) 2014年 zbq. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ChapterView.h"
#import "ChapterConfig.h"

@interface ChapterManager : NSObject{
    
}
@property(nonatomic, strong) NSString *content;
@property(nonatomic, strong) ChapterConfig *chapterConfig;

+ (ChapterManager *)shareInstance;

- (ChapterView *)createChapterView;

- (void)setChapterConfigReadMode:(ReadMode)readMode;
- (void)setChapterConfigReadSize:(ReadSize)readSize;

- (UIFont *)getTextFont;

- (void)saveConfig;

@end
