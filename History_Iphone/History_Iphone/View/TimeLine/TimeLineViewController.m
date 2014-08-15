//
//  TimeLineViewController.m
//  History_Iphone
//
//  Created by summer.zhu on 15/8/14.
//  Copyright (c) 2014年 zbq. All rights reserved.
//

#import "TimeLineViewController.h"
#import "TimeLineManager.h"

@interface TimeLineViewController ()

@end

@implementation TimeLineViewController

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
    self.navigationItem.title = @"时间轴";
    pageView.dataSource = self;
    pageView.delegate = self;
    pageView.minimumPageScale = 0.7;//0.7;
    pageView.minimumPageAlpha = 0.8;//0.3;
    pageView.orientation = PagedFlowViewOrientationVertical;
    
    TimeLineView *timeLineView = [[[NSBundle mainBundle] loadNibNamed:@"TimeLineView" owner:self options:nil] lastObject];
    timeLineView.frame = CGRectMake(0, 64, timeLineView.frame.size.width, timeLineView.frame.size.height);
    [self.view addSubview:timeLineView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - pageview delegate
- (NSInteger)numberOfPagesInFlowView:(PagedFlowView *)flowView{
    return [TimeLineManager shareInstance].timeLines.count;
}

- (CGSize)sizeForPageInFlowView:(PagedFlowView *)flowView{
    return CGSizeMake(215, 168);
}

- (UIView *)flowView:(PagedFlowView *)flowView cellForPageAtIndex:(NSInteger)index{
    TimeLineEntity *entity = [TimeLineManager shareInstance].timeLines[index];
    UIImage *image = [UIImage imageNamed:entity.image];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 215, 168)];
    imageView.image = image;
    
    
    return imageView;
}

- (void)flowView:(PagedFlowView *)flowView didScrollToPageAtIndex:(NSInteger)index {
    //    NSLog(@"Scrolled to page # %ld", (long)index);
}

- (void)flowView:(PagedFlowView *)flowView didTapPageAtIndex:(NSInteger)index{
    //    NSLog(@"Tapped on page # %ld", (long)index);
}

@end
