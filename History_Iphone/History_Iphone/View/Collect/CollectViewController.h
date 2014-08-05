//
//  CollectViewController.h
//  History_Iphone
//
//  Created by summer.zhu on 4/8/14.
//  Copyright (c) 2014年 zbq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CollectViewController : UIViewController
<
UITableViewDataSource,
UITableViewDelegate
>{
    IBOutlet UITableView *tableCollect;
}

@end
