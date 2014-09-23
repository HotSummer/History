//
//  AboutViewController.h
//  History_Iphone
//
//  Created by zbq on 14-9-22.
//  Copyright (c) 2014年 zbq. All rights reserved.
//

#import "BaseViewController.h"
#import "WeiboSDK.h"

@interface AboutViewController : BaseViewController
<
UITableViewDataSource,
UITableViewDelegate,
WBHttpRequestDelegate
>

@end
