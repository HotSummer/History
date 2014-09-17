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

- (void)postDeviceTokenToHistoryServer:(NSString *)deviceToken;

@end
