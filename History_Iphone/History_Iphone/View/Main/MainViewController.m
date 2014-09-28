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
#import "PushViewController.h"
#import "AboutViewController.h"
#import "IntroduceViewController.h"
#import "UIController.h"
#import "ArrowView.h"

@interface MainViewController ()

@property(nonatomic, strong) IBOutlet UIButton *btnAnimation;

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
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receivePushNotification:) name:PushNotification object:nil];
//    [[UIController shareInstance] addDataToDB];
    [self addArrowView];
    IntroduceViewController *introduceVC = [[IntroduceViewController alloc] init];
    [self presentViewController:introduceVC animated:NO completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}

//添加向上剪头的view
- (void)addArrowView{
    ArrowView *arrowView = [[[NSBundle mainBundle] loadNibNamed:@"ArrowView" owner:self options:nil] lastObject];
    arrowView.frame = _btnAnimation.frame;
    [self.view addSubview:arrowView];
    [self.view bringSubviewToFront:_btnAnimation];
}

- (void)receivePushNotification:(NSNotification *)notification{
    NSDictionary *pushDic = notification.userInfo;
    NSString *pushTitle = pushDic[@"pushTitle"];
    NSString *pushContent = pushDic[@"pushContent"];
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:pushTitle message:pushContent delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"查看", nil];
    [alertView show];
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
- (IBAction)didPressedBtnAbout:(id)sender{
    AboutViewController *aboutVC = [[AboutViewController alloc] initWithNibName:@"AboutViewController" bundle:nil];
    [self.navigationController pushViewController:aboutVC animated:YES];
}

- (IBAction)didPressedBtnAnimation:(id)sender{
    IntroduceViewController *introduceVC = [[IntroduceViewController alloc] init];
    [self presentViewController:introduceVC animated:YES completion:nil];
}

#pragma mark - alertView delegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 1) {
        PushViewController *pushVC = [[PushViewController alloc] init];
        pushVC.pushTitle = alertView.title;
        pushVC.pushContent = alertView.message;
        UIViewController *topViewController = self.navigationController.topViewController;
        [topViewController.navigationController pushViewController:pushVC animated:YES];
    }
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
