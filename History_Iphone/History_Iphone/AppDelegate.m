//
//  AppDelegate.m
//  History_Iphone
//
//  Created by zbq on 14-5-20.
//  Copyright (c) 2014年 zbq. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"

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
        NSLog(@"%d", indFamily);
    }
}

- (void)initUmeng{
    [MobClick startWithAppkey:@"540f14befd98c54ed001c0ce" reportPolicy:BATCH   channelId:@""];
//    [MobClick checkUpdate];+ (void)checkUpdateWithDelegate:(id)delegate selector:(SEL)callBackSelectorWithDictionary
    [MobClick checkUpdateWithDelegate:self selector:@selector(appUpdate:)];
}

#pragma mark - MobClick Delegate
- (void)appUpdate:(NSDictionary *)appInfo{
    self.updateAppInfo = appInfo;
//    ((AppDelegate *)[UIApplication sharedApplication].delegate).updateAppInfo = appInfo;
    
//    NSString *updateLog = [appInfo objectForKey:@"update_log"];
//    NSString *logs = [updateLog stringByReplacingOccurrencesOfString:@";" withString:@"\n"];
//    UIAlertView *alertview = [[UIAlertView alloc] initWithTitle:logs message:nil delegate:self cancelButtonTitle:@"立即更新" otherButtonTitles:nil, nil];
//    [alertview show];
}

#pragma mark - alertview
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    NSString *appUrl = [self.updateAppInfo objectForKey:@"path"];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:appUrl]];
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - ShareSDK
- (void)initShareConfig{
    [ShareSDK registerApp:@"28c1f554769a"];
    
    [ShareSDK connectSinaWeiboWithAppKey:@"543371755" appSecret:@"fbff33068d1418f3bd189cf76d5f4ff1" redirectUri:@"http://"];
}

@end
