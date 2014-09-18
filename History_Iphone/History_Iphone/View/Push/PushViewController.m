//
//  PushViewController.m
//  History_Iphone
//
//  Created by zbq on 14-9-18.
//  Copyright (c) 2014年 zbq. All rights reserved.
//

#import "PushViewController.h"

@interface PushViewController (){
    IBOutlet UITextView *txtPushContent;
}

@end

@implementation PushViewController

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
    self.navTitle = _pushTitle;
    txtPushContent.text = _pushContent;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
