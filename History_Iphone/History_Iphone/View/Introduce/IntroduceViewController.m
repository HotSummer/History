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
#import "UIView+Explode.h"

typedef enum : NSUInteger {
    Destroy,
    Move
} DynastyDisappearStyle;

@interface IntroduceViewController ()

@property(nonatomic, strong) IBOutlet UIImageView *imageXia;
@property(nonatomic, strong) IBOutlet UIImageView *imageviewXia;
@property(nonatomic, strong) IBOutlet UIImageView *imageZaoShang;
@property(nonatomic, strong) IBOutlet UIImageView *imageviewZaoShang;
@property(nonatomic, strong) IBOutlet UIImageView *imageYinShang;
@property(nonatomic, strong) IBOutlet UIImageView *imageviewYinShang;
@property(nonatomic, strong) IBOutlet UIImageView *imageXiZhou;
@property(nonatomic, strong) IBOutlet UIImageView *imageviewXiZhou;
@property(nonatomic, strong) IBOutlet UIImageView *imageDongZhou;
@property(nonatomic, strong) IBOutlet UIImageView *imageviewDongZhou;
@property(nonatomic, strong) IBOutlet UIImageView *imageQin;
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

/**
 @brief 根据朝代更替的方式执行动画
 @param style 朝代更替的方式（Destroy, Move）
 @param originalDynasty 原来朝代的title
 @param currentDynasty 现在朝代的title
 @param dynastyOriginalMap 原来朝代的地图
 @param dynastyCurrentMap 现在朝代的地图
 @param completion 动画执行完的回掉
 */
- (void)dynastyExchangeAnimation:(DynastyDisappearStyle)style
                 originalDynasty:(UIView *)originalDynasty
                  currentDynasty:(UIView *)currentDynasty
                     originalMap:(UIView *)dynastyOriginalMap
                      currentMap:(UIView *)dynastyCurrentMap
                   completeBlock:(void (^)())completion{
    CGAffineTransform goTranslation = CGAffineTransformConcat(originalDynasty.transform, CGAffineTransformMakeTranslation(-186, 0));
    CGAffineTransform goScale = CGAffineTransformMakeScale(0.3, 0.3);
    CGAffineTransform goTransform = CGAffineTransformConcat(goScale, goTranslation);
    CGAffineTransform comeTranslation = CGAffineTransformMakeTranslation(-186, 0);
    CGAffineTransform comeScale = CGAffineTransformMakeScale(1.0, 1.0);
    CGAffineTransform comeTransform = CGAffineTransformConcat(comeTranslation, comeScale);
    
    [UIView animateWithDuration:1.5 animations:^{
        dynastyOriginalMap.alpha = 0;
        dynastyCurrentMap.alpha = 1;
        if (style == Move) {
            originalDynasty.transform = goTransform;
        }
        currentDynasty.transform = comeTransform;
        
    } completion:^(BOOL finished) {
        if (finished) {
            if (style == Destroy) {
                [originalDynasty lp_explode:^(CAAnimation *animation) {
                    completion();
                }];
            }else{
                completion();
            }
        }
    }];
}

- (void)showAnimation{
    _imageZaoShang.transform = CGAffineTransformMakeScale(0.3, 0.3);
    _imageYinShang.transform = CGAffineTransformMakeScale(0.3, 0.3);
    _imageXiZhou.transform = CGAffineTransformMakeScale(0.3, 0.3);
    _imageDongZhou.transform = CGAffineTransformMakeScale(0.3, 0.3);
    _imageQin.transform = CGAffineTransformMakeScale(0.3, 0.3);
    
    //夏到早商
    [self dynastyExchangeAnimation:Destroy originalDynasty:_imageXia currentDynasty:_imageZaoShang originalMap:_imageviewXia currentMap:_imageviewZaoShang completeBlock:^{
        //早商到殷商
        [self dynastyExchangeAnimation:Move originalDynasty:_imageZaoShang currentDynasty:_imageYinShang originalMap:_imageviewZaoShang currentMap:_imageviewYinShang completeBlock:^{
            //殷商到西周
            [self dynastyExchangeAnimation:Destroy originalDynasty:_imageYinShang currentDynasty:_imageXiZhou originalMap:_imageviewYinShang currentMap:_imageviewXiZhou completeBlock:^{
                //西周到东周
                [self dynastyExchangeAnimation:Move originalDynasty:_imageXiZhou currentDynasty:_imageDongZhou originalMap:_imageviewXiZhou currentMap:_imageviewDongZhou completeBlock:^{
                    //东周到秦
                    [self dynastyExchangeAnimation:Destroy originalDynasty:_imageDongZhou currentDynasty:_imageQin originalMap:_imageviewDongZhou currentMap:_imageviewQin completeBlock:^{
                        
                    }];
                }];
            }];
        }];
    }];
}

- (IBAction)didPressedBtnEnter:(id)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)dealloc{
    
}

@end
