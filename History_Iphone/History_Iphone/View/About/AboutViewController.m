//
//  AboutViewController.m
//  History_Iphone
//
//  Created by zbq on 14-9-22.
//  Copyright (c) 2014年 zbq. All rights reserved.
//

#import "AboutViewController.h"
#import "DXAlertView.h"
#import "WXApi.h"
#import "AppDelegate.h"

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

- (IBAction)didPressedBtnSina:(id)sender;
- (IBAction)didPressedBtnWeiXin:(id)sender;
- (IBAction)didPressedBtnQQ:(id)sender;

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

//- (BOOL) navigationBar: (UINavigationBar * ) navigationBar
//         shouldPopItem: (UINavigationItem * ) item {
//    //在此处添加点击back按钮之后的操作代码
//    return YES;
//}

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
//    _tableAbout.tableFooterView = _viewFooter;
    
    _lblVersion.text = [NSString stringWithFormat:@"版本号%@", appCurrentVersion];
}

- (IBAction)didPressedBtnSina:(id)sender{
//    WBMessageObject *message = [WBMessageObject message];
//    message.text = @"测试通过WeiboSDK发送文字到微博!";
//    WBSendMessageToWeiboRequest *request = [WBSendMessageToWeiboRequest requestWithMessage:message];
//    [WeiboSDK sendRequest:request];
//    NSDictionary *dic = @{@"uid": @"2704709665", @"screen_name":@"HotSummer1989"};
//    [WBHttpRequest requestWithURL:@"https://api.weibo.com/2/friendships/create.json"
//                       httpMethod:@"POST"
//                           params:dic
//                         delegate:self
//                          withTag:@"1"];
    
    [ShareSDK followUserWithType:ShareTypeSinaWeibo                    //平台类型
                           field:@"2704709665"                                   //关注用户的名称或ID
                       fieldType:SSUserFieldTypeName      //字段类型，用于指定第二个参数是名称还是ID
                     authOptions:nil                     //授权选项
                    viewDelegate:nil                    //授权视图委托
                          result:^(SSResponseState state, id<ISSPlatformUser> userInfo, id<ICMErrorInfo> error) {               //返回回调
//                              NSString *msg = nil;
                              if (state == SSResponseStateSuccess)
                              {
                                  UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"关注成功" message:nil delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
                                  [alert show];
                                  NSLog(@"关注成功");
                              }
                              else if (state == SSResponseStateFail)
                              {
                                  UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"关注失败" message:nil delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
                                  [alert show];
                                  NSLog(@"%@", [NSString stringWithFormat:@"关注失败:%@", error.errorDescription]);
                              }
                          }];
    
}

- (IBAction)didPressedBtnWeiXin:(id)sender{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"您可以在微信中通过搜索“hotsummer1989”，找到我们的微信号。" message:nil delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"去微信", nil];
    [alert show];
}

- (IBAction)didPressedBtnQQ:(id)sender{
    [ShareSDK followUserWithType:ShareTypeQQ                    //平台类型
                           field:@"2759199007"                                   //关注用户的名称或ID
                       fieldType:SSUserFieldTypeName      //字段类型，用于指定第二个参数是名称还是ID
                     authOptions:nil                     //授权选项
                    viewDelegate:nil                    //授权视图委托
                          result:^(SSResponseState state, id<ISSPlatformUser> userInfo, id<ICMErrorInfo> error) {               //返回回调
                              //                              NSString *msg = nil;
                              if (state == SSResponseStateSuccess)
                              {
                                  UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"关注成功" message:nil delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
                                  [alert show];
                                  NSLog(@"关注成功");
                              }
                              else if (state == SSResponseStateFail)
                              {
                                  UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"关注失败" message:nil delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
                                  [alert show];
                                  NSLog(@"%@", [NSString stringWithFormat:@"关注失败:%@", error.errorDescription]);
                              }
                          }];
}

#pragma mark - alertviewdelegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (alertView.tag == 1) {
        if (buttonIndex == 1) {
            NSString *appUrl = [[HistoryAppDelegate updateAppInfo] objectForKey:@"path"];
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:appUrl]];
        }
    }
}

#pragma mark - WBHttpRequestDelegate
//- (void)didReceiveWeiboResponse:(WBBaseResponse *)response{
//    if ([response isKindOfClass:WBAuthorizeResponse.class]) {
//        NSDictionary *dic = @{@"uid": @"2704709665", @"screen_name":@"HotSummer1989"};
//        [WBHttpRequest requestWithURL:@"https://api.weibo.com/2/friendships/create.json"
//                           httpMethod:@"POST"
//                               params:dic
//                             delegate:self
//                              withTag:@"1"];
//    }
//}
//
- (void)request:(WBHttpRequest *)request didFailWithError:(NSError *)error{
    
}

- (void)request:(WBHttpRequest *)request didFinishLoadingWithResult:(NSString *)result{
    
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 1) {
        NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
        NSString *lastVersion = [userDefault objectForKey:appLastVersion];
        NSString *currentVersion = appCurrentVersion;
        if (![lastVersion isEqualToString:currentVersion] && lastVersion.length > 0) {
            NSString *logs = [userDefault objectForKey:appUpdateInfo];
            UIAlertView *alertview = [[UIAlertView alloc] initWithTitle:logs message:nil delegate:self cancelButtonTitle:@"暂不更新" otherButtonTitles:@"立即更新", nil];
            alertview.tag = 1;
            [alertview show];
        }else{
            UIAlertView *alertview = [[UIAlertView alloc] initWithTitle:@"没有检测到新版本" message:nil delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
            [alertview show];
        }
    }
    else if (indexPath.row == 2) {
        DXAlertView *alert = [[DXAlertView alloc] initWithTitle:@"您可以在微信中通过搜索“hotsummer1989”，找到我们的微信号。通过微信告诉我们您对这款App的想法，帮助我们完善它。" contentText:nil leftButtonTitle:@"没想法" rightButtonTitle:@"去微信"];
        [alert show];
        alert.leftBlock = ^() {
            
        };
        alert.rightBlock = ^() {
            [WXApi openWXApp];
        };
        alert.dismissBlock = ^() {
            
        };
    }
}

@end
