//
//  DynastyIndicatorView.m
//  History_Iphone
//
//  Created by summer.zhu on 27/8/14.
//  Copyright (c) 2014年 zbq. All rights reserved.
//

#import "DynastyIndicatorView.h"

#define DynastyMinInterval 5
#define DynastyHeight 21

@implementation DynastyIndicatorView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (void)layoutSubviews{
    [super layoutSubviews];
    self.layer.borderWidth = 1/[UIScreen mainScreen].scale;
    self.layer.borderColor = [UIColor colorWithRed:189.0/255.0 green:189.0/255.0 blue:189.0/255.0 alpha:1.0].CGColor;
}

- (IBAction)didPressedBtnDynasty:(id)sender{
    UIButton *btn = (UIButton *)sender;
    [self setCurrentIndex:btn.tag-1];
    if ([self.delegate respondsToSelector:@selector(didSelectedDynasty:)]) {
        [self.delegate didSelectedDynasty:btn.tag-1];
    }
}

- (void)setCurrentIndex:(NSInteger)current{
    for (UIView *subView in self.subviews) {
        if ([subView isKindOfClass:[UIButton class]]) {
            UIButton *btn = (UIButton *)subView;
            [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        }
    }
    
    UIView *view = [self viewWithTag:current+1];
    UIButton *btn = (UIButton *)view;
    [btn setTitleColor:[UIColor colorWithRed:219.0/255.0 green:39.0/255.0 blue:130.0/255.0 alpha:1] forState:UIControlStateNormal];
}


@end
