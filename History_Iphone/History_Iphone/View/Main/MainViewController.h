//
//  MainViewController.h
//  History_Iphone
//
//  Created by zbq on 14-5-20.
//  Copyright (c) 2014年 zbq. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@interface MainViewController : BaseViewController{
    IBOutlet UIButton *btnDynastyMap;
    IBOutlet UIButton *btnDynastyStory;
    IBOutlet UIButton *btnPersonStory;
}

- (IBAction)didPressedBtnDynastyMap:(id)sender;
- (IBAction)didPressedBtnDynastyStory:(id)sender;
- (IBAction)didPressedBtnPersonStory:(id)sender;
- (IBAction)didPressedBtnTimeLine:(id)sender;
- (IBAction)didPressedBtnAbout:(id)sender;
- (IBAction)didPressedBtnAnimation:(id)sender;

@end
