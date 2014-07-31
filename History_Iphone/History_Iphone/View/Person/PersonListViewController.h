//
//  PersonListViewController.h
//  History_Iphone
//
//  Created by zbq on 14-6-5.
//  Copyright (c) 2014年 zbq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PersonListViewController : UIViewController
<
UITableViewDataSource,
UITableViewDelegate,
UISearchBarDelegate
>{
    IBOutlet UIButton *btnBack;
    IBOutlet UILabel *lblLine;
    IBOutlet UISearchBar *personListSearchBar;
    IBOutlet UITableView *tableview;
}

- (IBAction)didPressedBtnBack:(id)sender;
- (IBAction)didBeginPressedBtn:(id)sender;
- (IBAction)didPressedBtn:(id)sender;

@end
