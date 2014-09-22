//
//  AboutViewController.m
//  History_Iphone
//
//  Created by zbq on 14-9-22.
//  Copyright (c) 2014年 zbq. All rights reserved.
//

#import "AboutViewController.h"

@interface AboutViewController ()

@property(nonatomic, strong) IBOutlet UITableView *tableAbout;
@property(nonatomic, strong) IBOutlet UILabel *lblVersion;
@property(nonatomic, strong) IBOutlet UIView *viewHeader;
@property(nonatomic, strong) IBOutlet UILabel *lblNoticeBg;
@property(nonatomic, strong) IBOutlet UITableViewCell *cellNotice;
@property(nonatomic, strong) IBOutlet UILabel *lblVersionBg;
@property(nonatomic, strong) IBOutlet UITableViewCell *cellVersion;
@property(nonatomic, strong) IBOutlet UILabel *lblFeedBackBg;
@property(nonatomic, strong) IBOutlet UITableViewCell *cellFeedBack;
@property(nonatomic, strong) IBOutlet UIView *viewFooter;

@end

@implementation AboutViewController

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
    self.navTitle = @"关于微看历史";
    [self loadBorder];
    [self loadTableHeaderAndFooter];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadBorder{
    _lblNoticeBg.layer.borderColor = [UIColor grayColor].CGColor;
    _lblNoticeBg.layer.borderWidth = thinLineHeight;
    
    _lblVersionBg.layer.borderColor = [UIColor grayColor].CGColor;
    _lblVersionBg.layer.borderWidth = thinLineHeight;
    
    _lblFeedBackBg.layer.borderColor = [UIColor grayColor].CGColor;
    _lblFeedBackBg.layer.borderWidth = thinLineHeight;
}

- (void)loadTableHeaderAndFooter{
    _tableAbout.tableHeaderView = _viewHeader;
    _tableAbout.tableFooterView = _viewFooter;
    
    _lblVersion.text = [NSString stringWithFormat:@"版本号%@", appCurrentVersion];
}

#pragma mark - tableviewdelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:
            return _cellNotice;
        case 1:
            return _cellVersion;
        case 2:
            return _cellFeedBack;
            
        default:
            break;
    }
    return nil;
}

@end
