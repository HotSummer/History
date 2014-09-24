//
//  StoryViewController.m
//  History_Iphone
//
//  Created by zbq on 14-6-4.
//  Copyright (c) 2014年 zbq. All rights reserved.
//

#import "StoryViewController.h"
#import "UIController.h"
#import "CollectionEntity.h"
#import "CollectManager.h"
#import "CollectViewController.h"
#import "ChapterManager.h"

@interface StoryViewController (){
    ChapterView *chapterView;
}

@end

@implementation StoryViewController

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
    self.navigationController.navigationBarHidden = NO;
    DynastyStory *story = [[UIController shareInstance] getStory];
    
    self.navTitle = story.storyTitle;
    
    //工厂模式
    [ChapterManager shareInstance].content = story.storyContent;
    chapterView = [[ChapterManager shareInstance] createChapterView];
    [self.view addSubview:chapterView];
    chapterView.frame = CGRectMake(0, 64, 320, 454);
    
    if ([[CollectManager shareInstance] collect:story.storyId]) {
        [btnCollect setImage:[UIImage imageNamed:@"btn_collection_down.png"] forState:UIControlStateNormal];
    }else{
        [btnCollect setImage:[UIImage imageNamed:@"btn_collection_nor.png"] forState:UIControlStateNormal];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)didPressedBtnCollectList:(id)sender{
    CollectViewController *collectVC = [[CollectViewController alloc] initWithNibName:@"CollectViewController" bundle:nil];
    [self.navigationController pushViewController:collectVC animated:YES];
}

- (IBAction)didPressedBtnCollect:(id)sender{
    DynastyStory *story = [[UIController shareInstance] getStory];
    if ([[CollectManager shareInstance] collect:story.storyId]) {
        [[CollectManager shareInstance] cancelCollect:story.storyId];
        [btnCollect setImage:[UIImage imageNamed:@"btn_collection_nor.png"] forState:UIControlStateNormal];
    }else{
        CollectionEntity *collectEntity = [[CollectionEntity alloc] init];
        collectEntity.contentId = story.storyId;
        NSDateFormatter *dateformatter = [[NSDateFormatter alloc] init];
        [dateformatter setDateFormat:@"yyyy-MM-dd hh:mm:ss"];
        NSString *strTimer = [dateformatter stringFromDate:[NSDate date]];
        collectEntity.collectTime = strTimer;
        
        [[CollectManager shareInstance] addCollect:collectEntity];
        
        CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
        scaleAnimation.duration = 0.25f;
        scaleAnimation.autoreverses = YES;
        scaleAnimation.repeatCount = 1;
        scaleAnimation.toValue = [NSNumber numberWithFloat:1.5];
        scaleAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        [btnCollect.layer addAnimation:scaleAnimation forKey:@"scaleAnimation"];
        [btnCollect setImage:[UIImage imageNamed:@"btn_collection_down.png"] forState:UIControlStateNormal];
    }
}

- (IBAction)didPressedBtnChapterConfig:(id)sender{
    ChapterConfigView *chapterConfigView = [[[NSBundle mainBundle] loadNibNamed:@"ChapterConfigView" owner:self options:nil] firstObject];
    chapterConfigView.delegate = self;
    [self.view addSubview:chapterConfigView];
}

- (IBAction)didPressedBtnShare:(id)sender{
    DynastyStory *story = [[UIController shareInstance] getStory];
    id<ISSContent> publishContent = [ShareSDK content:story.storyTitle
                                       defaultContent:@"我在看微看历史"
                                                image:[self getShareImage]
                                                title:@"微看历史"
                                                  url:@"http://www.sharesdk.cn"
                                          description:@"家天下开始"
                                            mediaType:SSPublishContentMediaTypeNews];
    
    [ShareSDK showShareActionSheet:nil
                         shareList:nil
                           content:publishContent
                     statusBarTips:YES
                       authOptions:nil
                      shareOptions: nil
                            result:^(ShareType type, SSResponseState state, id<ISSPlatformShareInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
                                if (state == SSResponseStateSuccess)
                                {
                                    UIAlertView *alertview = [[UIAlertView alloc] initWithTitle:@"分享成功" message:nil delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
                                    [alertview show];
                                }
                                else if (state == SSResponseStateFail)
                                {
                                    UIAlertView *alertview = [[UIAlertView alloc] initWithTitle:@"分享失败" message:nil delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
                                    [alertview show];
                                    //                                    NSLog(@"分享失败,错误码:%d,错误描述:%@", [error errorCode], [error errorDescription]);
                                }
                            }];
}

- (id<ISSCAttachment>)getShareImage{
    CGSize imageSize = [[UIScreen mainScreen] bounds].size;
    if (NULL != UIGraphicsBeginImageContextWithOptions) {
        UIGraphicsBeginImageContextWithOptions(imageSize, NO, 0);
    }
    else
    {
        UIGraphicsBeginImageContext(imageSize);
    }
    [[self.view layer] renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    id<ISSCAttachment> shareImage = nil;
    shareImage = [ShareSDK pngImageWithImage:newImage];
    return shareImage;
}

#pragma mark - ChapterConfigDelegate
- (void)selectColor:(NSInteger)iColor{
    [[ChapterManager shareInstance] setChapterConfigReadMode:(ReadMode)iColor];
    [chapterView setReadMode:(ReadMode)iColor];   
}

- (void)selectFont:(NSInteger)iSize{
    [[ChapterManager shareInstance] setChapterConfigReadSize:(ReadSize)iSize];
    [chapterView setSizeMode];
}


@end
