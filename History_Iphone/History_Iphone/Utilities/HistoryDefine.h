//
//  HistoryDefine.h
//  History_Iphone
//
//  Created by summer.zhu on 20/8/14.
//  Copyright (c) 2014年 zbq. All rights reserved.
//

#ifndef History_Iphone_HistoryDefine_h
#define History_Iphone_HistoryDefine_h


#define thinLineHeight 1/[UIScreen mainScreen].scale

#define PushNotification @"PushNotification"

#define appCurrentVersion [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]

#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)

#endif
