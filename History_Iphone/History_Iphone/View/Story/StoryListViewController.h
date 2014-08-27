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
#import "SearchView.h"

@interface StoryListViewController : BaseViewController
<
UISearchBarDelegate,
UITableViewDataSource,
UITableViewDelegate,
DynastyCollectDelegate,
SearchViewDelegate
>{
    IBOutlet UIButton *btnCollectList;
    IBOutlet UIScrollView *scrollDynasty;
    IBOutlet UITableViewCell *cellDynasty;
    IBOutlet UITableView *tableStoryList;
}
- (IBAction)didPressedBtnCollectList:(id)sender;

@end
