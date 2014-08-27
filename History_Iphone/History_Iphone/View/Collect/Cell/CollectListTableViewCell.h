//
//  CollectListTableViewCell.h
//  History_Iphone
//
//  Created by zbq on 14-8-27.
//  Copyright (c) 2014年 zbq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CollectListTableViewCell : UITableViewCell{
    IBOutlet UILabel *lblTitle;
    IBOutlet UILabel *lblDate;
    UILabel *lbl;
}

@property(nonatomic, strong) NSString *strTitle;
@property(nonatomic, strong) NSString *strDate;
@property(nonatomic) BOOL bLast;

@end
