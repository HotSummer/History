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

@interface ChapterConfig : NSObject<NSCoding, NSCopying>

@property(nonatomic, strong) NSString *content;
@property(nonatomic) ReadMode readMode;

@end
