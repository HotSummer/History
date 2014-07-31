//
//  DBHelper.h
//  SalesCRM
//
//  Created by zbq on 13-7-17.
//  Copyright (c) 2013年 zbq. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CoreDataManager.h"

@interface DBHelper : NSObject

//添加
+ (id)insertObjectToEntity:(NSString *)entityName;

//查询
+ (NSMutableArray *)searchObjectsForEntity:(NSString *)entityName withPredicate:(NSPredicate *)predicate andSortKey:(NSString *)sortKey andSortAscending:(BOOL)sortAscending;

//删除
+ (BOOL)deleteAllObjectsForEntity:(NSString *)entityName withPredicate:(NSPredicate *)predicate;

//统计
+ (NSUInteger)countForEntity:(NSString *)entityName withPredicate:(NSPredicate *)predicate;

//保存
+ (void)save;

@end
