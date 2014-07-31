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

@end
