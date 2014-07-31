//
//  DynastyPersonList.h
//  History_Iphone
//
//  Created by zbq on 14-6-8.
//  Copyright (c) 2014年 zbq. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface DynastyPersonList : NSManagedObject

@property (nonatomic, retain) NSNumber * commentCount;
@property (nonatomic, retain) NSString * dynastyId;
@property (nonatomic, retain) NSString * firstRole;
@property (nonatomic, retain) NSString * personId;
@property (nonatomic, retain) NSString * personName;
@property (nonatomic, retain) NSString * startKing;

@end
