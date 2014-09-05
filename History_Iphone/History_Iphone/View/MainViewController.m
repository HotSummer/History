//
//  MainViewController.m
//  History_Iphone
//
//  Created by zbq on 14-5-20.
//  Copyright (c) 2014年 zbq. All rights reserved.
//

#import "MainViewController.h"
#import "DynastyMapViewController.h"
#import "StoryListViewController.h"
#import "PersonListViewController.h"
#import "TimeLineViewController.h"
#import "UIController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
//    [[UIController shareInstance] addDataToDB];
    self.navigationItem.leftBarButtonItem = nil;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)didPressedBtnDynastyMap:(id)sender{
    DynastyMapViewController *dynastyMapVC = [[DynastyMapViewController alloc] initWithNibName:@"DynastyMapViewController" bundle:nil];
    [self.navigationController pushViewController:dynastyMapVC animated:YES];
}
- (IBAction)didPressedBtnDynastyStory:(id)sender{
    StoryListViewController *storyListVC = [[StoryListViewController alloc] initWithNibName:@"StoryListViewController" bundle:nil];
    [self.navigationController pushViewController:storyListVC animated:YES];
}
- (IBAction)didPressedBtnPersonStory:(id)sender{
    PersonListViewController *personListVC = [[PersonListViewController alloc] initWithNibName:@"PersonListViewController" bundle:nil];
    [self.navigationController pushViewController:personListVC animated:YES];
}
- (IBAction)didPressedBtnTimeLine:(id)sender{
    TimeLineViewController *timeLineVC = [[TimeLineViewController alloc] initWithNibName:@"TimeLineViewController" bundle:nil];
    [self.navigationController pushViewController:timeLineVC animated:YES];
}

@end
