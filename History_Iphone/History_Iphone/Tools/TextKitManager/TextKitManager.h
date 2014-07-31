//
//  TextKitManager.h
//  History_Iphone
//
//  Created by zbq on 14-6-27.
//  Copyright (c) 2014年 zbq. All rights reserved.
//

#import <Foundation/Foundation.h>

#define customerLineSpace 20
#define customerParagraphSpac 20

@interface TextKitManager : NSObject
<
NSLayoutManagerDelegate
>

+ (TextKitManager *)shareInstance;

//计算显示的文字数量 attribute这个目前没有用到
- (NSInteger)getShowNumbers:(NSString *)strContent rect:(CGRect)rect attribute:(NSDictionary *)dic;

@end
