//
//  ChapterConfig.h
//  History_Iphone
//
//  Created by zbq on 14-8-7.
//  Copyright (c) 2014年 zbq. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    Day = 0,
    Color,
    Black
}ReadMode;


typedef enum {
    Small = 0,
    Big
}ReadSize;

@interface ChapterConfig : NSObject<NSCoding, NSCopying>

@property(nonatomic) ReadSize readSize;
@property(nonatomic) ReadMode readMode;

- (UIFont *)getFont;

@end
