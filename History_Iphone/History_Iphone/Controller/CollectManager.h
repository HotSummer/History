//
//  CollectManager.h
//  History_Iphone
//
//  Created by summer.zhu on 4/8/14.
//  Copyright (c) 2014年 zbq. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CollectionEntity.h"

@interface CollectManager : NSObject

+ (CollectManager *)shareInstance;

- (NSMutableArray *)getCollects;
- (void)addCollect:(CollectionEntity *)contentEntity;
- (void)cancelCollect:(NSString *)contentId;
- (BOOL)collect:(NSString *)contentId;

@end
