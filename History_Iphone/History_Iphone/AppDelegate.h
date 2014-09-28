//
//  AppDelegate.h
//  History_Iphone
//
//  Created by zbq on 14-5-20.
//  Copyright (c) 2014年 zbq. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WeiboSDK.h"

@interface AppDelegate : UIResponder
<
UIApplicationDelegate,
WBHttpRequestDelegate
>{
    
}

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) NSDictionary *updateAppInfo;

@end
