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
        
#warning data
        //@[@"story1.png", @"story2.png", @"story3.png", @"story1.png", @"story2.png", @"story3.png"];
        /*
         level;
         @property(nonatomic, strong) NSString *super_id;
         @property(nonatomic, strong) NSString *story_id;
         @property(nonatomic, strong) NSString *name;
         @property(nonatomic, strong) NSString *image;
         */
        TimeLineEntity *entity = [[TimeLineEntity alloc] init];
        entity.level = @"0";
        entity.super_id = @"";
        entity.story_id = @"12";
        entity.name = @"Story1";
        entity.image = @"story1.png";
        entity.length = 200;
        
        TimeLineEntity *entity1 = [[TimeLineEntity alloc] init];
        entity1.level = @"0";
        entity1.super_id = @"";
        entity1.story_id = @"13";
        entity1.name = @"Story2";
        entity1.image = @"story2.png";
        entity1.length = 100;
        
        TimeLineEntity *entity2 = [[TimeLineEntity alloc] init];
        entity2.level = @"0";
        entity2.super_id = @"";
        entity2.story_id = @"14";
        entity2.name = @"Story3";
        entity2.image = @"story3.png";
        entity2.length = 300;
        
        TimeLineEntity *entity3 = [[TimeLineEntity alloc] init];
        entity3.level = @"0";
        entity3.super_id = @"";
        entity3.story_id = @"15";
        entity3.name = @"Story4";
        entity3.image = @"story1.png";
        entity3.length = 260;
        
        TimeLineEntity *entity4 = [[TimeLineEntity alloc] init];
        entity4.level = @"0";
        entity4.super_id = @"";
        entity4.story_id = @"16";
        entity4.name = @"Story5";
        entity4.image = @"story2.png";
        entity4.length = 110;
        
        TimeLineEntity *entity5 = [[TimeLineEntity alloc] init];
        entity5.level = @"0";
        entity5.super_id = @"";
        entity5.story_id = @"17";
        entity5.name = @"Story6";
        entity5.image = @"story3.png";
        entity5.length = 70;
        
        _timeLines = @[entity, entity1, entity2, entity3, entity4, entity5];
    }
    return self;
}

- (NSArray *)getTimeLineByLevel:(NSInteger)level hasSuper:(BOOL)bHasSuper{
    NSMutableArray *arrLevel = [[NSMutableArray alloc] init];
    for (TimeLineEntity *entity in _timeLines) {
        if (bHasSuper) {
            if ([entity.level integerValue] <= level) {
                [arrLevel addObject:entity];
            }
        }else{
            if ([entity.level integerValue] == level) {
                [arrLevel addObject:entity];
            }
        }
    }
    return arrLevel;
}

@end
