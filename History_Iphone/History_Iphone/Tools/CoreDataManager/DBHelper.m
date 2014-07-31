//
//  DBHelper.m
//  SalesCRM
//
//  Created by zbq on 13-7-17.
//  Copyright (c) 2013年 zbq. All rights reserved.
//

#import "DBHelper.h"

@implementation DBHelper

//添加
+ (id)insertObjectToEntity:(NSString *)entityName{
    CoreDataManager *manager = [CoreDataManager shareInstance];
    id Obj = [NSEntityDescription insertNewObjectForEntityForName:entityName inManagedObjectContext:manager.managedObjectContext];
    return Obj;
}


//查询
+ (NSMutableArray *)searchObjectsForEntity:(NSString *)entityName withPredicate:(NSPredicate *)predicate andSortKey:(NSString *)sortKey andSortAscending:(BOOL)sortAscending{
    CoreDataManager *manager = [CoreDataManager shareInstance];
    // Create fetch request
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:entityName inManagedObjectContext:manager.managedObjectContext];
    [request setEntity:entity];
    
    if (predicate != nil) {
        [request setPredicate:predicate];
    }
    
    if (sortKey != nil) {
        NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:sortKey ascending:sortAscending];
        NSArray *sortDescriptors = [[NSArray alloc] initWithObjects:sortDescriptor, nil];
        [request setSortDescriptors:sortDescriptors];
//        [sortDescriptors release];
//        [sortDescriptor release];
    }
    
    NSError *error = nil;
    NSArray *results = [manager.managedObjectContext executeFetchRequest:request error:&error];
    NSMutableArray *mutableResults = [[NSMutableArray alloc] initWithArray:results];
//    [request release];
    
    return mutableResults;
}

//删除
+ (BOOL)deleteAllObjectsForEntity:(NSString *)entityName withPredicate:(NSPredicate *)predicate{
    CoreDataManager *manager = [CoreDataManager shareInstance];
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:entityName inManagedObjectContext:manager.managedObjectContext];
    request.entity = entity;
    
    if (predicate != nil) {
        request.predicate = predicate;
    }
    
    NSError *error;
    NSArray *fetchResults = [manager.managedObjectContext executeFetchRequest:request error:&error];
//    [request release];
    if (fetchResults != nil) {
        for (NSManagedObject *manObj in fetchResults) {
            [manager.managedObjectContext deleteObject:manObj];
        }
    } else {
		NSLog(@"Couldn't delete objects for entity %@", entityName);
		return NO;
	}
    
    return YES;
}

//统计
+ (NSUInteger)countForEntity:(NSString *)entityName withPredicate:(NSPredicate *)predicate{
    CoreDataManager *manager = [CoreDataManager shareInstance];
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:entityName inManagedObjectContext:manager.managedObjectContext];
    request.entity = entity;
    
    if (predicate != nil) {
        request.predicate = predicate;
    }
    
    NSError *error;
    NSUInteger count = [manager.managedObjectContext countForFetchRequest:request error:&error];
//    [request release];
    
    if (count == NSNotFound) {
        NSLog(@"Couldn't get count for entity %@", entityName);
    }
    return count;
}

//保存
+ (void)save{
    CoreDataManager *manager = [CoreDataManager shareInstance];
    NSError *error = nil;
    if(![manager.managedObjectContext save:&error]){
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
}

@end
