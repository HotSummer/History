//
//  UIController.h
//  History_Iphone
//
//  Created by zbq on 14-5-22.
//  Copyright (c) 2014年 zbq. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DynastyStory.h"
#import "DynastyPersonDetail.h"

typedef enum {
    PersonListSiftNone = 0,
    PersonListSiftFirstRole,
    PersonListSiftCommentCount,
    PersonListSiftStartKing
}PersonListSiftCondition;

@interface UIController : NSObject

@property(nonatomic, strong, readonly) NSArray *arrDynasties;

//故事列表中的搜索关键词
@property(nonatomic, strong) NSString *storySearchWord;
//当前选择的故事id
@property(nonatomic, strong) NSString *currentStoryId;

//缓存personlist列表
@property(nonatomic, strong) NSArray *personList;
//人物列表筛选条件
@property(nonatomic) PersonListSiftCondition personListSiftCondition;
//人物列表中的搜索关键词
@property(nonatomic, strong) NSString *personListSearchWord;
//当前选择的人物id
@property(nonatomic, strong) NSString *currentPersonId;

+ (id)shareInstance;

//添加数据到数据库
- (void)addDataToDB;
#pragma mark - 朝代数据
//查询朝代数据
- (NSArray *)searchDynastyList;

#pragma mark - 历史故事
//查询历史故事
- (NSArray *)getStoryTitles;
//获取包含搜索条件的朝代数据（显示section）
- (NSArray *)getStoriesDynastyList;
//获取某个朝代下的历史故事
- (NSArray *)getStoriesByDynastyId:(NSString *)dynastyId;
//获取某个故事
- (DynastyStory *)getStory;

#pragma mark - 人物故事
- (void)clearSearchAndSift;

//列表
/*
 显示规则：
 当筛选条件不为PersonListSiftNone，则不显示tableview的section
 否则显示
 */
- (NSArray *)getAllPersonList;

/*
 获得tableview的section
 */
- (NSArray *)getPersonDynastyList:(NSString *)searchword siftCondition:(PersonListSiftCondition)siftCondition;

/*
 获取每个section里面的cell
 */
- (NSArray *)getPersonList:(NSString *)dynastyId;

- (NSArray *)getPersonDynastyListBySearchWord;

- (NSArray *)getPersonListByDynastyId:(NSString *)dynastyId;

- (DynastyPersonDetail *)getPersonDetail;

//获取personDetail的section信息
- (NSArray *)getSection;




@end
