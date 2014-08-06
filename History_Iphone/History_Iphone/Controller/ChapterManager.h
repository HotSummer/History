//
//  ChapterManager.h
//  History_Iphone
//
//  Created by summer.zhu on 5/8/14.
//  Copyright (c) 2014年 zbq. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ChapterView.h"

@interface ChapterConfig : NSObject

@property(nonatomic, strong) NSString *content;
@property(nonatomic) ReadMode readMode;

@end

@interface ChapterManager : NSObject{
    
}

+ (ChapterManager *)shareInstance;

- (ChapterView *)createChapterView:(ChapterConfig *)config;

@end
