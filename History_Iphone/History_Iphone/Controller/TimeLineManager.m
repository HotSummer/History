//
//  TimeLineManager.m
//  History_Iphone
//
//  Created by summer.zhu on 15/8/14.
//  Copyright (c) 2014年 zbq. All rights reserved.
//

#import "TimeLineManager.h"
#import "MakeData.h"
#import "TimeLine.h"

@interface TimeLineManager ()

//@property(nonatomic, strong) NSArray *timeLines;

@end

@implementation TimeLineManager

+ (TimeLineManager *)shareInstance{
    static TimeLineManager *timeLineManager = nil;
    static dispatch_once_t predicate;
    
    dispatch_once(&predicate, ^{
        timeLineManager = [[TimeLineManager alloc] init];
    });
    return timeLineManager;
}

- (id)init{
    if (self = [super init]) {
        _currentLevel = 0;
        _timeLineIds = [[NSMutableArray alloc] init];
        
        NSArray *arr = [[MakeData shareInstance] searchTimeLine];
        _timeLines = [NSArray arrayWithArray:arr];
    }
    return self;
}

- (NSArray *)getTimeLine:(NSString *)superTimeLine level:(NSInteger)level hasSuper:(BOOL)bHasSuper{
    NSMutableArray *arrLevel = [[NSMutableArray alloc] init];
    for (TimeLine *entity in _timeLines) {
        if (bHasSuper) {
            if ([entity.level integerValue] <= level) {
                if (level == 0) {
                    [arrLevel addObject:entity];
                }else if([entity.super_id isEqualToString:superTimeLine]){
                    [arrLevel addObject:entity];
                }
            }
        }else{
            if ([entity.level integerValue] == level) {
                if (level == 0) {
                    [arrLevel addObject:entity];
                }else if([entity.super_id isEqualToString:superTimeLine]){
                    [arrLevel addObject:entity];
                }
            }
        }
    }
    
    NSArray *arrResult = [arrLevel sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        TimeLine *timeLine1 = (TimeLine *)obj1;
        TimeLine *timeLine2 = (TimeLine *)obj2;
        if ([timeLine1.startYear floatValue] < [timeLine2.startYear floatValue]) {
            return NSOrderedAscending;
        }
        if ([timeLine1.startYear floatValue] > [timeLine2.startYear floatValue]) {
            return NSOrderedDescending;
        }
        return NSOrderedSame;
    }];
    
    return arrResult;
    
}

- (NSString *)getCurrentTimeLineId{
    if (_currentLevel < 1 || _timeLineIds.count == 0) {
        return nil;
    }
    return _timeLineIds[_currentLevel-1];
}
- (void)addTimeLineId:(NSString *)timeLineId{
    [TimeLineManager shareInstance].currentLevel ++;
    [_timeLineIds addObject:timeLineId];
}
- (void)removeCurrentTimeLineId{
    [TimeLineManager shareInstance].currentLevel --;
    if ([TimeLineManager shareInstance].currentLevel < 0) {
        [TimeLineManager shareInstance].currentLevel = 0;
    }
    [_timeLineIds removeLastObject];
}

@end
