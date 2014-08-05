//
//  ChapterManager.h
//  History_Iphone
//
//  Created by summer.zhu on 5/8/14.
//  Copyright (c) 2014年 zbq. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    Day = 0,
    Color,
    Black
}ReadMode;

@interface ChapterManager : NSObject{
    
}
@property(nonatomic) ReadMode readMode;

+ (ChapterManager *)shareInstance;

@end
