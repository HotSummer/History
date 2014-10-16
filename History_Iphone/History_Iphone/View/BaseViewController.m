//
//  BaseViewController.m
//  History_Iphone
//
//  Created by zbq on 14-8-19.
//  Copyright (c) 2014年 zbq. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

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
    // Do any additional setup after loading the view.
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 50, 30);
    [btn setImage:[UIImage imageNamed:@"btn_back.png"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *leftBar = [[UIBarButtonItem alloc] initWithCustomView:btn];
    self.navigationItem.leftBarButtonItem = leftBar;
    
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:67.0/255.0 green:6.0/255.0 blue:9.0/255.0 alpha:1.0]];
    self.navigationController.navigationBarHidden = NO;
}

- (void)setNavTitle:(NSString *)navTitle{
    _navTitle = navTitle;
    UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 64, 100, 44)];
    lbl.font = [UIFont fontWithName:@"DIN Alternate" size:22.0];//
    lbl.textColor = [UIColor whiteColor];
    lbl.text = _navTitle;
    lbl.textAlignment = NSTextAlignmentCenter;
    self.navigationItem.titleView = lbl;
}

- (void)back:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
