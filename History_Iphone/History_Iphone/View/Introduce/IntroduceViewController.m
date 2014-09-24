//
//  IntroduceViewController.m
//  History_Iphone
//
//  Created by summer.zhu on 23/9/14.
//  Copyright (c) 2014年 zbq. All rights reserved.
//

#import "IntroduceViewController.h"
#import "DynastyList.h"
#import "UIController.h"

@interface IntroduceViewController ()

@property(nonatomic, strong) IBOutlet UILabel *lblTitle;
@property(nonatomic, strong) IBOutlet UILabel *lblXia;
@property(nonatomic, strong) IBOutlet UIImageView *imageviewXia;
@property(nonatomic, strong) IBOutlet UILabel *lblZaoShang;
@property(nonatomic, strong) IBOutlet UIImageView *imageviewZaoShang;
@property(nonatomic, strong) IBOutlet UILabel *lblYinShang;
@property(nonatomic, strong) IBOutlet UIImageView *imageviewYinShang;
@property(nonatomic, strong) IBOutlet UILabel *lblXiZhou;
@property(nonatomic, strong) IBOutlet UIImageView *imageviewXiZhou;
@property(nonatomic, strong) IBOutlet UILabel *lblDongZhou;
@property(nonatomic, strong) IBOutlet UIImageView *imageviewDongZhou;
@property(nonatomic, strong) IBOutlet UILabel *lblQin;
@property(nonatomic, strong) IBOutlet UIImageView *imageviewQin;

- (IBAction)didPressedBtnEnter:(id)sender;

@end

@implementation IntroduceViewController

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
    [self setDynastyTitle];
    
    [self performSelector:@selector(showAnimation) withObject:nil afterDelay:1.0];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

- (void)showAnimation{
    [UIView animateWithDuration:1.5 animations:^{
        _imageviewXia.alpha = 0;
        _imageviewZaoShang.alpha = 1;
        _lblXia.alpha = 0;
        _lblXia.frame = CGRectMake(-52, 20, 52, 44);
        _lblZaoShang.frame = CGRectMake(134, 20, 52, 44);
        _lblZaoShang.alpha = 1;
    } completion:^(BOOL finished) {
        if (finished) {
            [UIView animateWithDuration:1.5 animations:^{
                _imageviewZaoShang.alpha = 0;
                _imageviewYinShang.alpha = 1;
                _lblZaoShang.alpha = 0;
                _lblZaoShang.frame = CGRectMake(-52, 20, 52, 44);
                _lblYinShang.frame = CGRectMake(134, 20, 52, 44);
                _lblYinShang.alpha = 1;
            } completion:^(BOOL finished) {
                if (finished) {
                    [UIView animateWithDuration:1.5 animations:^{
                        _imageviewYinShang.alpha = 0;
                        _imageviewXiZhou.alpha = 1;
                        _lblYinShang.alpha = 0;
                        _lblYinShang.frame = CGRectMake(-52, 20, 52, 44);
                        _lblXiZhou.frame = CGRectMake(134, 20, 52, 44);
                        _lblXiZhou.alpha = 1;
                    } completion:^(BOOL finished) {
                        if (finished) {
                            [UIView animateWithDuration:1.5 animations:^{
                                _imageviewXiZhou.alpha = 0;
                                _imageviewDongZhou.alpha = 1;
                                _lblXiZhou.alpha = 0;
                                _lblXiZhou.frame = CGRectMake(-52, 20, 52, 44);
                                _lblDongZhou.frame = CGRectMake(134, 20, 52, 44);
                                _lblDongZhou.alpha = 1;
                            } completion:^(BOOL finished) {
                                if (finished) {
                                    [UIView animateWithDuration:1.5 animations:^{
                                        _imageviewDongZhou.alpha = 0;
                                        _imageviewQin.alpha = 1;
                                        _lblDongZhou.alpha = 0;
                                        _lblDongZhou.frame = CGRectMake(-52, 20, 52, 44);
                                        _lblQin.frame = CGRectMake(134, 20, 52, 44);
                                        _lblQin.alpha = 1;
                                    } completion:^(BOOL finished) {
                                        
                                    }];
                                }
                            }];
                        }
                    }];
                }
            }];
        }
    }];
}

- (void)setDynastyTitle{
    _lblXia.font = [UIFont fontWithName:@"DIN Alternate" size:22.0];
    _lblXia.textColor = [UIColor whiteColor];
    _lblZaoShang.font = [UIFont fontWithName:@"DIN Alternate" size:22.0];
    _lblZaoShang.textColor = [UIColor whiteColor];
    _lblYinShang.font = [UIFont fontWithName:@"DIN Alternate" size:22.0];
    _lblYinShang.textColor = [UIColor whiteColor];
    _lblXiZhou.font = [UIFont fontWithName:@"DIN Alternate" size:22.0];
    _lblXiZhou.textColor = [UIColor whiteColor];
    _lblDongZhou.font = [UIFont fontWithName:@"DIN Alternate" size:22.0];
    _lblDongZhou.textColor = [UIColor whiteColor];
    _lblQin.font = [UIFont fontWithName:@"DIN Alternate" size:22.0];
    _lblQin.textColor = [UIColor whiteColor];
    
    NSArray *dynasties = [[UIController shareInstance] arrDynasties];
    
    DynastyList *dynastyList = dynasties[0];
    _lblXia.text = dynastyList.dynastyName;
    DynastyList *dynastyList1 = dynasties[1];
    _lblZaoShang.text = dynastyList1.dynastyName;
    DynastyList *dynastyList2 = dynasties[2];
    _lblYinShang.text = dynastyList2.dynastyName;
    DynastyList *dynastyList3 = dynasties[3];
    _lblXiZhou.text = dynastyList3.dynastyName;
    DynastyList *dynastyList4 = dynasties[4];
    _lblDongZhou.text = dynastyList4.dynastyName;
    DynastyList *dynastyList5 = dynasties[5];
    _lblQin.text = dynastyList5.dynastyName;
    
}

- (IBAction)didPressedBtnEnter:(id)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)dealloc{
    
}

@end
