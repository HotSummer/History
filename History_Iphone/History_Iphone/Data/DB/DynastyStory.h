//
//  DynastyStory.h
//  History_Iphone
//
//  Created by zbq on 14-6-4.
//  Copyright (c) 2014年 zbq. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface DynastyStory : NSManagedObject

@property (nonatomic, retain) NSNumber * bCollect;
@property (nonatomic, retain) NSString * storyContent;
@property (nonatomic, retain) NSString * storyId;
@property (nonatomic, retain) NSString * storyTitle;

@end
