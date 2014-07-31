//
//  DynastyPersonDetail.h
//  History_Iphone
//
//  Created by zbq on 14-6-16.
//  Copyright (c) 2014年 zbq. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Comment, Contribute;

@interface DynastyPersonDetail : NSManagedObject

@property (nonatomic, retain) NSString * career;
@property (nonatomic, retain) NSString * gender;
@property (nonatomic, retain) NSString * idNumber;
@property (nonatomic, retain) NSString * image;
@property (nonatomic, retain) NSString * personId;
@property (nonatomic, retain) NSString * personName;
@property (nonatomic, retain) NSString * address;
@property (nonatomic, retain) NSSet *comments;
@property (nonatomic, retain) NSSet *contributes;
@end

@interface DynastyPersonDetail (CoreDataGeneratedAccessors)

- (void)addCommentsObject:(Comment *)value;
- (void)removeCommentsObject:(Comment *)value;
- (void)addComments:(NSSet *)values;
- (void)removeComments:(NSSet *)values;

- (void)addContributesObject:(Contribute *)value;
- (void)removeContributesObject:(Contribute *)value;
- (void)addContributes:(NSSet *)values;
- (void)removeContributes:(NSSet *)values;

@end
