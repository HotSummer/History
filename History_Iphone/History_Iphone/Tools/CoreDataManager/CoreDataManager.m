//
//  CoreDataManager.m
//  History_Iphone
//
//  Created by zbq on 14-5-21.
//  Copyright (c) 2014年 zbq. All rights reserved.
//

#import "CoreDataManager.h"

@interface CoreDataManager ()

@end

@implementation CoreDataManager

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

+ (id)shareInstance{
    static CoreDataManager *coreDataManager = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^(void){
        coreDataManager = [[CoreDataManager alloc] init];
    });
    return coreDataManager;
}

#pragma mark - Core Data
// Returns the managed object context for the application.
// If the context doesn't already exist, it is created and bound to the persistent store coordinator for the application.
- (NSManagedObjectContext *)managedObjectContext
{
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (coordinator != nil) {
        _managedObjectContext = [[NSManagedObjectContext alloc] init];
        [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    }
    return _managedObjectContext;
}

// Returns the managed object model for the application.
// If the model doesn't already exist, it is created from the application's model.
- (NSManagedObjectModel *)managedObjectModel
{
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"History" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator{
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    NSString *urlString = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *storePath = [urlString stringByAppendingPathComponent:@"History.sqlite"];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:storePath]) {
        NSString *strDefaultPath = [[NSBundle mainBundle] pathForResource:@"History" ofType:@"sqlite"];
        if (strDefaultPath) {
            [fileManager copyItemAtPath:strDefaultPath toPath:storePath error:nil];
        }
    }
    
    NSURL *storeUrl = [NSURL fileURLWithPath:storePath];
    NSDictionary *options = [NSDictionary dictionaryWithObjectsAndKeys:
                             [NSNumber numberWithBool:YES], NSMigratePersistentStoresAutomaticallyOption,
                             [NSNumber numberWithBool:YES], NSInferMappingModelAutomaticallyOption, nil];
    NSError *error;
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeUrl options:options error:&error])
    {
        //abort();
    }
    return _persistentStoreCoordinator;
}

@end
