//
//  TimeLine.h
//  History_Iphone
//
//  Created by summer.zhu on 15/9/14.
//  Copyright (c) 2014年 zbq. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface TimeLine : NSManagedObject

@property (nonatomic, retain) NSString * image;
@property (nonatomic, retain) NSNumber * length;
@property (nonatomic, retain) NSString * level;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * startYear;
@property (nonatomic, retain) NSString * story_id;
@property (nonatomic, retain) NSString * super_id;

@end
