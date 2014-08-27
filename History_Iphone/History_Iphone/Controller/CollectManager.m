//
//  CollectManager.m
//  History_Iphone
//
//  Created by summer.zhu on 4/8/14.
//  Copyright (c) 2014年 zbq. All rights reserved.
//

#import "CollectManager.h"
#import "UIController.h"

@implementation CollectManager

+ (CollectManager *)shareInstance{
    static CollectManager *collect = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        collect = [[CollectManager alloc] init];
    });
    return collect;
}

- (NSMutableArray *)getCollects{
    NSData *collections = [[NSUserDefaults standardUserDefaults] objectForKey:@"Collections"];
    NSMutableArray *arrCollections = [NSKeyedUnarchiver unarchiveObjectWithData:collections];
    return arrCollections;
}

- (void)addCollect:(CollectionEntity *)contentEntity{
    NSMutableArray *collections = [[CollectManager shareInstance] getCollects];
    NSMutableArray *currentCollections = [[NSMutableArray alloc] initWithArray:collections];
    [currentCollections addObject:contentEntity];
    NSData *encodedSingleObj = [NSKeyedArchiver archivedDataWithRootObject:currentCollections];
    [[NSUserDefaults standardUserDefaults] setObject:encodedSingleObj forKey:@"Collections"];
    
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)cancelCollect:(NSString *)contentId{
    NSMutableArray *arrCollections = [[CollectManager shareInstance] getCollects];
    NSMutableArray *origCollections = [[NSMutableArray alloc] initWithArray:arrCollections];
    for (CollectionEntity *entity in origCollections) {
        if ([entity.contentId isEqualToString:contentId]) {
            [arrCollections removeObject:entity];
        }
    }
    NSData *encodedSingleObj = [NSKeyedArchiver archivedDataWithRootObject:arrCollections];
    [[NSUserDefaults standardUserDefaults] setObject:encodedSingleObj forKey:@"Collections"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (BOOL)collect:(NSString *)contentId{
    NSMutableArray *arrCollections = [[CollectManager shareInstance] getCollects];
    for (CollectionEntity *entity in arrCollections) {
        if ([entity.contentId isEqualToString:contentId]) {
            return YES;
        }
    }
    return NO;
}

- (DynastyStory *)getCollectedDynastyStory:(NSString *)storyId{
    return [[UIController shareInstance] getStory:storyId];
}

@end
