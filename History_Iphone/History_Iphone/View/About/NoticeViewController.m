//
//  NoticeViewController.m
//  History_Iphone
//
//  Created by zbq on 14-10-9.
//  Copyright (c) 2014年 zbq. All rights reserved.
//

#import "NoticeViewController.h"
#import "PushViewController.h"
#import "PushManager.h"

@interface NoticeViewController (){
    IBOutlet UITableView *tablePush;
    IBOutlet UIView *viewSectionHeader;
}
@property(nonatomic, strong) NSArray *pushMessages;

@end

@implementation NoticeViewController

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
    self.navTitle = @"历史公告";
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receivePushNotification:) name:PushNotification object:nil];
    _pushMessages = [[PushManager shareInstance] readPushMessage];
    [tablePush reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)receivePushNotification:(NSNotification *)notification{
    _pushMessages = [[PushManager shareInstance] readPushMessage];
    [tablePush reloadData];
}

#pragma mark - tableview delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _pushMessages.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (_pushMessages.count == 0) {
        return 138.0f;
    }
    return 0;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (_pushMessages.count == 0) {
        return viewSectionHeader;
    }
    return nil;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIndentifier = @"CellIndentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier];
    }
    cell.textLabel.text = _pushMessages[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    PushViewController *pushVC = [[PushViewController alloc] init];
    pushVC.pushTitle = @"消息";
    pushVC.pushContent = _pushMessages[indexPath.row];
    UIViewController *topViewController = self.navigationController.topViewController;
    [topViewController.navigationController pushViewController:pushVC animated:YES];
}

@end
