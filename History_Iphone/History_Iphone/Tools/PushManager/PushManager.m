//
//  PushManager.m
//  History_Iphone
//
//  Created by zbq on 14-9-17.
//  Copyright (c) 2014年 zbq. All rights reserved.
//

#import "PushManager.h"

#define PushAppId @"JmCvVAzLAz9SLx6cfuUE73"
#define PushAppKey @"s7UxilxQNs6cckgSeXbjn2"
#define PushAppSecret @"7adyUiCzJO8WaBWPeBqdb8"

@implementation PushManager

+ (PushManager *)shareInstance{
    static PushManager *pushManager = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        pushManager = [[PushManager alloc] init];
    });
    return pushManager;
}

- (id)init{
    if (self) {
        NSError *err = nil;
        NSString *appVersion = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
        gexin = [GexinSdk createSdkWithAppId:PushAppId
                                      appKey:PushAppKey
                                   appSecret:PushAppSecret
                                  appVersion:appVersion
                                    delegate:self
                                       error:&err];
    }
    return self;
}

- (void)postDeviceTokenToHistoryServer:(NSString *)deviceToken{
    [gexin registerDeviceToken:deviceToken];
}

- (void)postPushNotification:(NSString *)message{
    NSDictionary *dic = @{@"pushTitle": @"Push", @"pushContent":message};
    [[NSNotificationCenter defaultCenter] postNotificationName:PushNotification object:nil userInfo:dic];
}

#pragma mark - GexinSdkDelegate
- (void)GexinSdkDidRegisterClient:(NSString *)clientId
{
    // [4-EXT-1]: 个推SDK已注册
    NSLog(@"个推注册成功, %@", clientId);
}

- (void)GexinSdkDidReceivePayload:(NSString *)payloadId fromApplication:(NSString *)appId
{
    // [4]: 收到个推消息
    NSData *payload = [gexin retrivePayloadById:payloadId];
    NSString *payloadMsg = nil;
    if (payload) {
        payloadMsg = [[NSString alloc] initWithBytes:payload.bytes
                                              length:payload.length
                                            encoding:NSUTF8StringEncoding];
    }
    [[PushManager shareInstance] postPushNotification:payloadMsg];
}

- (void)GexinSdkDidOccurError:(NSError *)error
{
    // [EXT]:个推错误报告，集成步骤发生的任何错误都在这里通知，如果集成后，无法正常收到消息，查看这里的通知。
    NSLog(@"%@", error.description);
}

@end
