//
//  PersonListTableViewCell.m
//  History_Iphone
//
//  Created by zbq on 14-6-8.
//  Copyright (c) 2014年 zbq. All rights reserved.
//

#import "PersonListTableViewCell.h"

@implementation PersonListTableViewCell

@synthesize personList;

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setPersonList:(DynastyPersonList *)_personList{
    if (personList != _personList) {
        personList = _personList;
    }
    if (personList != NULL) {
        lblName.text = personList.personName;
        switch (((UIController *)[UIController shareInstance]).personListSiftCondition) {
            case PersonListSiftNone:
                lblAddition.text = @"";
                break;
            case PersonListSiftFirstRole:
                lblAddition.text = personList.firstRole;
                break;
            case PersonListSiftStartKing:
                lblAddition.text = personList.startKing;
                break;
            case PersonListSiftCommentCount:
                lblAddition.text = [NSString stringWithFormat:@"%d", [personList.commentCount intValue]];
                break;
                
            default:
                break;
        }
    }
}

- (void)setBLast:(BOOL)bLast{
    _bLast = bLast;
    if (!lbl) {
        lbl = [[UILabel alloc] initWithFrame:CGRectMake(20, 44-thinLineHeight, 280, thinLineHeight)];
        lbl.backgroundColor = [UIColor colorWithRed:136.0/255.0 green:136.0/255.0 blue:136.0/255.0 alpha:1.0];
        [self addSubview:lbl];
    }
    if (_bLast) {
        lbl.frame = CGRectMake(0, 44-thinLineHeight, 320, thinLineHeight);
    }else{
        lbl.frame = CGRectMake(20, 44-thinLineHeight, 280, thinLineHeight);
    }
}

@end
