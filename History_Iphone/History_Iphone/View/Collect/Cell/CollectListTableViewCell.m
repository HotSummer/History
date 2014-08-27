//
//  CollectListTableViewCell.m
//  History_Iphone
//
//  Created by zbq on 14-8-27.
//  Copyright (c) 2014年 zbq. All rights reserved.
//

#import "CollectListTableViewCell.h"

@implementation CollectListTableViewCell

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setStrTitle:(NSString *)strTitle{
    _strTitle = strTitle;
    if (_strTitle.length > 0) {
        lblTitle.text = _strTitle;
    }
}

- (void)setStrDate:(NSString *)strDate{
    _strDate = strDate;
    if (_strDate.length > 0) {
        lblDate.text = _strDate;
    }
}

- (void)setBLast:(BOOL)bLast{
    _bLast = bLast;
    if (!lbl) {
        lbl = [[UILabel alloc] initWithFrame:CGRectMake(20, 44-thinLineHeight, 280, thinLineHeight)];
        lbl.backgroundColor = [UIColor colorWithRed:136.0/255.0 green:136.0/255.0 blue:136.0/255.0 alpha:1.0];
        [self addSubview:lbl];
    }
    lbl.frame = CGRectMake(20, 44-thinLineHeight, 280, thinLineHeight);
}

@end
