//
//  DynastyList.h
//  History_Iphone
//
//  Created by zbq on 14-5-27.
//  Copyright (c) 2014年 zbq. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface DynastyList : NSManagedObject

@property (nonatomic, retain) NSString * dynastyId;
@property (nonatomic, retain) NSString * dynastyName;
@property (nonatomic, retain) NSString * dynastySuperId;

@end
