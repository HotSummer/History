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

@property(nonatomic, strong) NSArray *arrData;

@end

@implementation TimeLineViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        [TimeLineManager shareInstance].currentLevel ++;
        NSArray *arrEntity = [[TimeLineManager shareInstance] getTimeLineByLevel:[TimeLineManager shareInstance].currentLevel hasSuper:NO];
        _arrData = [[NSArray alloc] initWithArray:arrEntity];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navTitle = @"时间轴";
    pageView.dataSource = self;
    pageView.delegate = self;
    pageView.minimumPageScale = 0.7;
    pageView.minimumPageAlpha = 0.8;
    pageView.orientation = PagedFlowViewOrientationVertical;
    
    timeLineView = [[[NSBundle mainBundle] loadNibNamed:@"TimeLineView" owner:self options:nil] lastObject];
    timeLineView.frame = CGRectMake(0, 64, timeLineView.frame.size.width, timeLineView.frame.size.height);
    timeLineView.delegate = self;
    [self.view addSubview:timeLineView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)back:(id)sender{
    [super back:sender];
    [TimeLineManager shareInstance].currentLevel --;
}

#pragma mark - pageview delegate
- (NSInteger)numberOfPagesInFlowView:(PagedFlowView *)flowView{
    return _arrData.count;
}

- (CGSize)sizeForPageInFlowView:(PagedFlowView *)flowView{
    return CGSizeMake(215, 168);
}

- (UIView *)flowView:(PagedFlowView *)flowView cellForPageAtIndex:(NSInteger)index{
    TimeLineEntity *entity = _arrData[index];
    UIImage *image = [UIImage imageNamed:entity.image];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 215, 168)];
    imageView.image = image;
    
    
    return imageView;
}

- (void)flowView:(PagedFlowView *)flowView didScrollToPageAtIndex:(NSInteger)index {
    //    NSLog(@"Scrolled to page # %ld", (long)index);
    [timeLineView scrollToTime:index];
}

- (void)flowView:(PagedFlowView *)flowView didTapPageAtIndex:(NSInteger)index{
    //    NSLog(@"Tapped on page # %ld", (long)index);
}

#pragma mark - TimeLineDelegate
- (void)selectTime:(NSInteger)iTimeNumber{
    [pageView scrollToPage:iTimeNumber];
}

- (void)showNextLevelTimeLine:(NSString *)iTimeLineId{
    TimeLineViewController *timeLineVC = [[TimeLineViewController alloc] initWithNibName:@"TimeLineViewController" bundle:nil];
    [self.navigationController pushViewController:timeLineVC animated:YES];
}

@end
