//
//  PersonDetailViewController.h
//  History_Iphone
//
//  Created by zbq on 14-6-10.
//  Copyright (c) 2014年 zbq. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@interface PersonDetailViewController : BaseViewController
<
UITableViewDataSource,
UITableViewDelegate
>{
    IBOutlet UITableView *tableview;
    IBOutlet UILabel *lblName;
    IBOutlet UILabel *lblGender;
    IBOutlet UILabel *lblCareer;
//    IBOutlet UILabel *lblAddress;
    
    UILabel *lblAddress;
    
    IBOutlet UILabel *lblId;
    IBOutlet UIImageView *imageviewIcon;
    IBOutlet UITableViewCell *cellId;
    IBOutlet UITableViewCell *cellHistoryContribute;
    IBOutlet UITableViewCell *cellEvalution;
}

@end
