//
//  StoryListViewController.h
//  History_Iphone
//
//  Created by zbq on 14-5-28.
//  Copyright (c) 2014年 zbq. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "DynastyCollectView.h"

@interface StoryListViewController : BaseViewController
<
UISearchBarDelegate,
UITableViewDataSource,
UITableViewDelegate,
DynastyCollectDelegate
>{
//    IBOutlet UISearchBar *searchBar;
    IBOutlet UIScrollView *scrollDynasty;
    IBOutlet UITableViewCell *cellDynasty;
    IBOutlet UITableView *tableStoryList;
}

@end
