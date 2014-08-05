//
//  CollectionEntity.h
//  History_Iphone
//
//  Created by summer.zhu on 4/8/14.
//  Copyright (c) 2014年 zbq. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CollectionEntity : NSObject<NSCoding, NSCopying>

@property(nonatomic, strong) NSString *contentId;
@property(nonatomic, strong) NSString *collectTime;

@end
