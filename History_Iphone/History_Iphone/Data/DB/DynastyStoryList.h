//
//  DynastyStoryList.h
//  History_Iphone
//
//  Created by zbq on 14-5-27.
//  Copyright (c) 2014年 zbq. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface DynastyStoryList : NSManagedObject

@property (nonatomic, retain) NSString * dynastyId;
@property (nonatomic, retain) NSString * storyId;
@property (nonatomic, retain) NSString * storyTitle;

@end
