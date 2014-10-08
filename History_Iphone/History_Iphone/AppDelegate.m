//
//  AppDelegate.m
//  History_Iphone
//
//  Created by zbq on 14-5-20.
//  Copyright (c) 2014年 zbq. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"
#import "PushManager.h"
#import "WXApi.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [NSThread sleepForTimeInterval:1.0];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    //ShareSDK
    [self initShareConfig];
    //友盟统计
    [self initUmeng];
    //注册通知
    [self registerNotification];
    
    NSDictionary* message = [launchOptions objectForKey:UIApplicationLaunchOptionsRemoteNotificationKey];
    if (message) {
        NSString *payloadMsg = [message objectForKey:@"payload"];
        if (payloadMsg.length > 0) {
            [[PushManager shareInstance] postPushNotification:payloadMsg];
        }
    }
    
    MainViewController *mainVC = [[MainViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:mainVC];
    self.window.rootViewController = nav;
    
//    [self findFont];
    
    return YES;
}

- (void)findFont{
    NSArray *familyNames = [[NSArray alloc] initWithArray:[UIFont familyNames]];
    NSArray *fontNames;
    NSInteger indFamily, indFont;
    for (indFamily=0; indFamily<[familyNames count]; ++indFamily)
    {
        NSLog(@"Family name: %s", [[familyNames objectAtIndex:indFamily] UTF8String]);
        fontNames = [[NSArray alloc] initWithArray:
                     [UIFont fontNamesForFamilyName:
                      [familyNames objectAtIndex:indFamily]]];
        for (indFont=0; indFont<[fontNames count]; ++indFont)
        {
            NSLog(@"    Font name: %@", [fontNames objectAtIndex:indFont]);
        }
        NSLog(@"%ld", (long)indFamily);
    }
}

- (void)initUmeng{
    [MobClick startWithAppkey:@"540f14befd98c54ed001c0ce" reportPolicy:BATCH   channelId:@""];
    [MobClick checkUpdateWithDelegate:self selector:@selector(appUpdate:)];
}

- (void)registerNotification{
    [[UIApplication sharedApplication] registerForRemoteNotificationTypes:(UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeSound | UIRemoteNotificationTypeAlert)];
}

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url{
    return [ShareSDK handleOpenURL:url wxDelegate:self];
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation{
    return [ShareSDK handleOpenURL:url sourceApplication:sourceApplication annotation:annotation wxDelegate:self];
}

#pragma mark - MobClick Delegate
- (void)appUpdate:(NSDictionary *)appInfo{
    self.updateAppInfo = appInfo;
    NSString *lastVersion = [appInfo objectForKey:@"version"];
    NSString *currentVersion = appCurrentVersion;
    if (![lastVersion isEqualToString:currentVersion] && lastVersion.length > 0) {
        NSString *updateLog = [appInfo objectForKey:@"update_log"];
        NSString *logs = [updateLog stringByReplacingOccurrencesOfString:@";" withString:@"\n"];
        UIAlertView *alertview = [[UIAlertView alloc] initWithTitle:logs message:nil delegate:self cancelButtonTitle:@"暂不更新" otherButtonTitles:@"立即更新", nil];
        [alertview show];
        
        NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
        [userDefault setObject:lastVersion forKey:appLastVersion];
        [userDefault setObject:logs forKey:appUpdateInfo];
        [userDefault synchronize];
    }
}

#pragma mark - alertview
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 1) {
        NSString *appUrl = [self.updateAppInfo objectForKey:@"path"];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:appUrl]];
    }
}

#pragma mark - push
-(void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken

{
    NSString *pushToken = [[[[deviceToken description]
                             stringByReplacingOccurrencesOfString:@"<" withString:@""]
                            stringByReplacingOccurrencesOfString:@">" withString:@""]
                           stringByReplacingOccurrencesOfString:@" " withString:@""];
    //这里进行的操作，是将Device Token发送到个推服务端
    [[PushManager shareInstance] postDeviceTokenToHistoryServer:pushToken];
}

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
    [[PushManager shareInstance] postDeviceTokenToHistoryServer:@""];
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo{
    
}

#pragma mark - ShareSDK
- (void)initShareConfig{
    
    [ShareSDK registerApp:@"28c1f554769a"];
    
    [ShareSDK connectSinaWeiboWithAppKey:@"543371755" appSecret:@"fbff33068d1418f3bd189cf76d5f4ff1" redirectUri:@"http://"];
    
    //添加微信应用
    [ShareSDK connectWeChatSessionWithAppId:@"wx1820f7df3e88698e" wechatCls:[WXApi class]];
    [ShareSDK connectWeChatTimelineWithAppId:@"wx1820f7df3e88698e" wechatCls:[WXApi class]];
    [ShareSDK importWeChatClass:[WXApi class]];
}



@end
