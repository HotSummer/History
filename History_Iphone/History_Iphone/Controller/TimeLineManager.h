//
//  TimeLineManager.h
//  History_Iphone
//
//  Created by summer.zhu on 15/8/14.
//  Copyright (c) 2014年 zbq. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TimeLineEntity.h"

@interface TimeLineManager : NSObject{
}
@property(nonatomic, readonly) NSArray *timeLines;

+ (TimeLineManager *)shareInstance;

//bHasSuper：是否返回level的上一级数据
- (NSArray *)getTimeLineByLevel:(NSInteger)level hasSuper:(BOOL)bHasSuper;

//- (NSArray *)get

@end
