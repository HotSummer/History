//
//  StoryViewController.h
//  History_Iphone
//
//  Created by zbq on 14-6-4.
//  Copyright (c) 2014年 zbq. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChapterView.h"

@interface StoryViewController : UIViewController
<
NSLayoutManagerDelegate
>{
    IBOutlet UITextView *txtContent;
    IBOutlet UITextView *txtContentText;
}

@end
