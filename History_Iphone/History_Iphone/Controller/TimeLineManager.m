//
//  TimeLineManager.m
//  History_Iphone
//
//  Created by summer.zhu on 15/8/14.
//  Copyright (c) 2014年 zbq. All rights reserved.
//

#import "TimeLineManager.h"

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
#warning data
        //@[@"story1.png", @"story2.png", @"story3.png", @"story1.png", @"story2.png", @"story3.png"];
        TimeLineEntity *entity = [[TimeLineEntity alloc] init];
        entity.level = @"0";
        entity.super_id = @"";
        entity.story_id = @"12";
        entity.name = @"夏朝建立";
        entity.image = @"story1.png";
        entity.length = 470;
        
        TimeLineEntity *entity1 = [[TimeLineEntity alloc] init];
        entity1.level = @"0";
        entity1.super_id = @"";
        entity1.story_id = @"13";
        entity1.name = @"早商建立";
        entity1.image = @"story2.png";
        entity1.length = 300;
        
        TimeLineEntity *entity2 = [[TimeLineEntity alloc] init];
        entity2.level = @"0";
        entity2.super_id = @"";
        entity2.story_id = @"14";
        entity2.name = @"殷商";
        entity2.image = @"story3.png";
        entity2.length = 256;
        
        TimeLineEntity *entity3 = [[TimeLineEntity alloc] init];
        entity3.level = @"0";
        entity3.super_id = @"";
        entity3.story_id = @"15";
        entity3.name = @"西周建立";
        entity3.image = @"story1.png";
        entity3.length = 275;
        
        TimeLineEntity *entity4 = [[TimeLineEntity alloc] init];
        entity4.level = @"0";
        entity4.super_id = @"";
        entity4.story_id = @"16";
        entity4.name = @"东周";
        entity4.image = @"story2.png";
        entity4.length = 548;
        
        TimeLineEntity *entity4_1 = [[TimeLineEntity alloc] init];
        entity4_1.level = @"1";
        entity4_1.super_id = @"16";
        entity4_1.story_id = @"16_1";
        entity4_1.name = @"春秋开始";
        entity4_1.image = @"story2.png";
        entity4_1.length = 548;
        
        TimeLineEntity *entity4_2 = [[TimeLineEntity alloc] init];
        entity4_2.level = @"1";
        entity4_2.super_id = @"16";
        entity4_2.story_id = @"16_2";
        entity4_2.name = @"齐桓公继位";
        entity4_2.image = @"story2.png";
        entity4_2.length = 548;
        
        TimeLineEntity *entity4_3 = [[TimeLineEntity alloc] init];
        entity4_3.level = @"1";
        entity4_3.super_id = @"16";
        entity4_3.story_id = @"16_3";
        entity4_3.name = @"北杏之盟";
        entity4_3.image = @"story2.png";
        entity4_3.length = 548;
        
        TimeLineEntity *entity4_4 = [[TimeLineEntity alloc] init];
        entity4_4.level = @"1";
        entity4_4.super_id = @"16";
        entity4_4.story_id = @"16_4";
        entity4_4.name = @"幽地之盟";
        entity4_4.image = @"story2.png";
        entity4_4.length = 548;
        
        TimeLineEntity *entity4_5 = [[TimeLineEntity alloc] init];
        entity4_5.level = @"1";
        entity4_5.super_id = @"16";
        entity4_5.story_id = @"16_5";
        entity4_5.name = @"召地之盟";
        entity4_5.image = @"story2.png";
        entity4_5.length = 548;
        
        TimeLineEntity *entity4_6 = [[TimeLineEntity alloc] init];
        entity4_6.level = @"1";
        entity4_6.super_id = @"16";
        entity4_6.story_id = @"16_6";
        entity4_6.name = @"葵丘之会";
        entity4_6.image = @"story2.png";
        entity4_6.length = 548;
        
        TimeLineEntity *entity4_7 = [[TimeLineEntity alloc] init];
        entity4_7.level = @"1";
        entity4_7.super_id = @"16";
        entity4_7.story_id = @"16_7";
        entity4_7.name = @"城濮之战";
        entity4_7.image = @"story2.png";
        entity4_7.length = 548;
        
        TimeLineEntity *entity4_8 = [[TimeLineEntity alloc] init];
        entity4_8.level = @"1";
        entity4_8.super_id = @"16";
        entity4_8.story_id = @"16_8";
        entity4_8.name = @"楚穆王立";
        entity4_8.image = @"story2.png";
        entity4_8.length = 548;
        
        TimeLineEntity *entity4_9 = [[TimeLineEntity alloc] init];
        entity4_9.level = @"1";
        entity4_9.super_id = @"16";
        entity4_9.story_id = @"16_9";
        entity4_9.name = @"崤之战";
        entity4_9.image = @"story2.png";
        entity4_9.length = 548;
        
        TimeLineEntity *entity4_10 = [[TimeLineEntity alloc] init];
        entity4_10.level = @"1";
        entity4_10.super_id = @"16";
        entity4_10.story_id = @"16_10";
        entity4_10.name = @"彭衙之战";
        entity4_10.image = @"story2.png";
        entity4_10.length = 548;
        
        TimeLineEntity *entity4_11 = [[TimeLineEntity alloc] init];
        entity4_11.level = @"1";
        entity4_11.super_id = @"16";
        entity4_11.story_id = @"16_11";
        entity4_11.name = @"秦穆公去世";
        entity4_11.image = @"story2.png";
        entity4_11.length = 548;
        
        TimeLineEntity *entity4_12 = [[TimeLineEntity alloc] init];
        entity4_12.level = @"1";
        entity4_12.super_id = @"16";
        entity4_12.story_id = @"16_12";
        entity4_12.name = @"楚庄王立";
        entity4_12.image = @"story2.png";
        entity4_12.length = 548;
        
        TimeLineEntity *entity4_13 = [[TimeLineEntity alloc] init];
        entity4_13.level = @"1";
        entity4_13.super_id = @"16";
        entity4_13.story_id = @"16_13";
        entity4_13.name = @"邲之战";
        entity4_13.image = @"story2.png";
        entity4_13.length = 548;
        
        TimeLineEntity *entity4_14 = [[TimeLineEntity alloc] init];
        entity4_14.level = @"1";
        entity4_14.super_id = @"16";
        entity4_14.story_id = @"16_14";
        entity4_14.name = @"楚庄王去世";
        entity4_14.image = @"story2.png";
        entity4_14.length = 548;
        
        TimeLineEntity *entity4_15 = [[TimeLineEntity alloc] init];
        entity4_15.level = @"1";
        entity4_15.super_id = @"16";
        entity4_15.story_id = @"16_15";
        entity4_15.name = @"吴国伐楚";
        entity4_15.image = @"story2.png";
        entity4_15.length = 548;
        
        TimeLineEntity *entity4_16 = [[TimeLineEntity alloc] init];
        entity4_16.level = @"1";
        entity4_16.super_id = @"16";
        entity4_16.story_id = @"16_16";
        entity4_16.name = @"战国开始";
        entity4_16.image = @"story2.png";
        entity4_16.length = 548;
        
        TimeLineEntity *entity4_17 = [[TimeLineEntity alloc] init];
        entity4_17.level = @"1";
        entity4_17.super_id = @"16";
        entity4_17.story_id = @"16_17";
        entity4_17.name = @"商鞅变法";
        entity4_17.image = @"story2.png";
        entity4_17.length = 548;
        
        TimeLineEntity *entity4_18 = [[TimeLineEntity alloc] init];
        entity4_18.level = @"1";
        entity4_18.super_id = @"16";
        entity4_18.story_id = @"16_18";
        entity4_18.name = @"张仪说楚";
        entity4_18.image = @"story2.png";
        entity4_18.length = 548;
        
        TimeLineEntity *entity4_19 = [[TimeLineEntity alloc] init];
        entity4_19.level = @"1";
        entity4_19.super_id = @"16";
        entity4_19.story_id = @"16_19";
        entity4_19.name = @"长平之战";
        entity4_19.image = @"story2.png";
        entity4_19.length = 548;
        
        TimeLineEntity *entity4_20 = [[TimeLineEntity alloc] init];
        entity4_20.level = @"1";
        entity4_20.super_id = @"16";
        entity4_20.story_id = @"16_20";
        entity4_20.name = @"秦统一天下";
        entity4_20.image = @"story2.png";
        entity4_20.length = 548;
        
        TimeLineEntity *entity5 = [[TimeLineEntity alloc] init];
        entity5.level = @"0";
        entity5.super_id = @"";
        entity5.story_id = @"17";
        entity5.name = @"秦";
        entity5.image = @"story3.png";
        entity5.length = 15;
        
        _timeLines = @[entity, entity1, entity2, entity3, entity4, entity4_1, entity4_2, entity4_3, entity4_4, entity4_5, entity4_6, entity4_7, entity4_8, entity4_9, entity4_10, entity4_11, entity4_12, entity4_13, entity4_14, entity4_15, entity4_16, entity4_17, entity4_18, entity4_19, entity4_20, entity5];
    }
    return self;
}

- (NSArray *)getTimeLine:(NSString *)superTimeLine level:(NSInteger)level hasSuper:(BOOL)bHasSuper{
    NSMutableArray *arrLevel = [[NSMutableArray alloc] init];
    for (TimeLineEntity *entity in _timeLines) {
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
    return arrLevel;
    
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
