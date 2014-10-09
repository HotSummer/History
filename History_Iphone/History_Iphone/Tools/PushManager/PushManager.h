//
//  PushManager.h
//  History_Iphone
//
//  Created by zbq on 14-9-17.
//  Copyright (c) 2014年 zbq. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GexinSdk.h"

@interface PushManager : NSObject
<
GexinSdkDelegate
>{
    GexinSdk *gexin;
}

+ (PushManager *)shareInstance;
//发送推送消息通知
- (void)postPushNotification:(NSString *)message;
//将deviceToken传给服务器
- (void)postDeviceTokenToHistoryServer:(NSString *)deviceToken;

/**
 @brief 读取本地存储的推送通知
 */
- (NSArray *)readPushMessage;

@end
