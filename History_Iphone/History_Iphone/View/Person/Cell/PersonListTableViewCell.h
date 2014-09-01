//
//  PersonListTableViewCell.h
//  History_Iphone
//
//  Created by zbq on 14-6-8.
//  Copyright (c) 2014年 zbq. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIController.h"
#import "DynastyPersonList.h"

@interface PersonListTableViewCell : UITableViewCell{
    IBOutlet UILabel *lblName;
    IBOutlet UILabel *lblAddition;
    UILabel *lbl;
}

@property(nonatomic, strong) DynastyPersonList *personList;
@property(nonatomic) BOOL bLast;

@end
