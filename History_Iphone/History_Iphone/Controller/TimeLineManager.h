//
//  TimeLineManager.h
//  History_Iphone
//
//  Created by summer.zhu on 15/8/14.
//  Copyright (c) 2014年 zbq. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TimeLineManager : NSObject{
}
@property(nonatomic, readonly) NSArray *timeLines;
@property(nonatomic) int currentLevel;//当前时间轴的层级
@property(nonatomic, strong) NSMutableArray *timeLineIds;

+ (TimeLineManager *)shareInstance;

//bHasSuper：是否返回level的上一级数据
- (NSArray *)getTimeLine:(NSString *)superTimeLine level:(NSInteger)level hasSuper:(BOOL)bHasSuper;

//获取当前CurrentTimeLineId
- (NSString *)getCurrentTimeLineId;
//添加新的TimeLineId
- (void)addTimeLineId:(NSString *)timeLineId;
//删除TimeLineId
- (void)removeCurrentTimeLineId;


@end
