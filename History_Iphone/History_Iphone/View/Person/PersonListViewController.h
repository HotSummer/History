//
//  PersonListViewController.h
//  History_Iphone
//
//  Created by zbq on 14-6-5.
//  Copyright (c) 2014年 zbq. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "HorizontalCollectView.h"
#import "SearchView.h"
#import "DynastyIndicatorView.h"

@interface PersonListViewController : BaseViewController
<
UITableViewDataSource,
UITableViewDelegate,
UISearchBarDelegate,
SearchViewDelegate,
HorizontalCollectViewDelegate,
DynastyIndicatorDelegate
>{
    SearchView *searchView;
    NSString *searchText;
    IBOutlet UITableView *tableview;
    
    DynastyIndicatorView *indicatorView;
    NSTimer *timerAnimation;
}

@end
