//
//  StoryListViewController.h
//  History_Iphone
//
//  Created by zbq on 14-5-28.
//  Copyright (c) 2014年 zbq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StoryListViewController : UIViewController
<
UISearchBarDelegate,
UITableViewDataSource,
UITableViewDelegate
>{
    IBOutlet UITableView *tableStoryList;
}

@end
