//
//  TimeLineEntity.h
//  History_Iphone
//
//  Created by summer.zhu on 15/8/14.
//  Copyright (c) 2014年 zbq. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TimeLineEntity : NSObject

@property(nonatomic, strong) NSString *level;
@property(nonatomic, strong) NSString *super_id;
@property(nonatomic, strong) NSString *story_id;
@property(nonatomic, strong) NSString *name;
@property(nonatomic, strong) NSString *image;
//占据时间和总时间的比例
@property(nonatomic) CGFloat length;

@end
