//
//  StoryTitleTableViewCell.h
//  History_Iphone
//
//  Created by zbq on 14-5-29.
//  Copyright (c) 2014年 zbq. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DynastyStoryList.h"

@interface StoryTitleTableViewCell : UITableViewCell{
    IBOutlet UILabel *lblTitle;
}
@property(nonatomic, strong) DynastyStoryList *storyTitle;

@end
