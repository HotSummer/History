//
//  DynastyMapViewController.m
//  History_Iphone
//
//  Created by zbq on 14-5-28.
//  Copyright (c) 2014年 zbq. All rights reserved.
//

#import "DynastyMapViewController.h"
#import "UIController.h"
#import "DynastyView.h"
#import "DynastyList.h"

@interface DynastyMapViewController ()

@property(nonatomic, strong) NSArray *dynastyThumbnailImages;

@end

@implementation DynastyMapViewController

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
    self.navTitle = @"历史地图";
    pageView.dataSource = self;
    pageView.delegate = self;
    pageView.minimumPageScale = 0.7;
    pageView.minimumPageAlpha = 0.3;
    _dynastyThumbnailImages = @[@"xia_thumbnail.png", @"shang_early_thumbnail.png", @"shang_later_thumbnail.png", @"xizhou_thumbnail.png", @"dongzhou_thumbnail.png", @"qin_thumbnail.png"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - customer method
- (IBAction)didPressedBtnBack:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)updateImage:(NSInteger)iIndex{
    NSString *imageName = @"";
    switch (iIndex) {
        case 0:
            imageName = @"now_xia_map.png";
            break;
        case 1:
        case 2:
            imageName = @"now_shang_map.png";
            break;
        case 3:
            imageName = @"now_xizhou_map.png";
            break;
        case 4:
            imageName = @"now_dongzhou_map.png";
            break;
        case 5:
            imageName = @"now_qin_map.png";
            break;
            
        default:
            break;
    }
    [UIView animateWithDuration:0.3 animations:^{
        imageMap.image = [UIImage imageNamed:imageName];
    }];
}

#pragma mark - pageview delegate
- (NSInteger)numberOfPagesInFlowView:(PagedFlowView *)flowView{
    return [[UIController shareInstance] arrDynasties].count;
}

- (CGSize)sizeForPageInFlowView:(PagedFlowView *)flowView{
    return CGSizeMake(140, 125);
}

- (UIView *)flowView:(PagedFlowView *)flowView cellForPageAtIndex:(NSInteger)index{
    DynastyView *view = [[DynastyView alloc] initWithFrame:CGRectMake(0, 0, 140, 125)];
    DynastyList *dynastyList = [[UIController shareInstance] arrDynasties][index];
    view.dynastyName = dynastyList.dynastyName;
    view.dynastyImageName = _dynastyThumbnailImages[index];
    return view;
}

- (void)flowView:(PagedFlowView *)flowView didScrollToPageAtIndex:(NSInteger)index {
    NSLog(@"Scrolled to page # %ld", (long)index);
    //防止快速滑动导致index小于0 
    if (index < 0) {
        index = 0;
    }
    [self updateImage:index];
}

- (void)flowView:(PagedFlowView *)flowView didTapPageAtIndex:(NSInteger)index{
//    NSLog(@"Tapped on page # %ld", (long)index);
}

@end
