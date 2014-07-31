//
//  Contribute.h
//  History_Iphone
//
//  Created by zbq on 14-5-27.
//  Copyright (c) 2014年 zbq. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class DynastyPersonDetail;

@interface Contribute : NSManagedObject

@property (nonatomic, retain) NSString * contributeId;
@property (nonatomic, retain) NSString * contributeContent;
@property (nonatomic, retain) DynastyPersonDetail *person;

@end
