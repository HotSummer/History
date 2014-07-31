//
//  MakeData.h
//  History_Iphone
//
//  Created by zbq on 14-5-22.
//  Copyright (c) 2014年 zbq. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MakeData : NSObject

+ (id)shareInstance;

- (void)createData;
//创建DynastyList数据
- (void)createDynastyList;
//创建StoryList数据
- (void)createStoreList;
//创建Story数据
- (void)createStore;
//创建历史人物列表数据
- (void)createPersonList;
//创建人物详情
- (void)createPersonDetail;

//查询朝代数据
- (NSArray *)searchDynastyList;
//查询历史故事数据
- (NSArray *)searchDynastyStoryList;
//根据storyId查询历史故事
- (NSArray *)searchStoryByStoryId:(NSString *)storyId;
//查询人物列表数据
- (NSArray *)searchPersonList;
//根据personId获取personDetail
- (NSArray *)searchPersonDetail:(NSString *)personId;

@end
