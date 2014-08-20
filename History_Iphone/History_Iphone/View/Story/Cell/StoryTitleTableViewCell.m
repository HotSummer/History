//
//  StoryTitleTableViewCell.m
//  History_Iphone
//
//  Created by zbq on 14-5-29.
//  Copyright (c) 2014年 zbq. All rights reserved.
//

#import "StoryTitleTableViewCell.h"

@implementation StoryTitleTableViewCell
@synthesize storyTitle;

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setStoryTitle:(DynastyStoryList *)_storyTitle{
    if (storyTitle != _storyTitle) {
        storyTitle = _storyTitle;
    }
    if (storyTitle != nil) {
        lblTitle.text = storyTitle.storyTitle;
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
