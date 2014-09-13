//
//  TwoGradientImageView.m
//  History_Iphone
//
//  Created by zbq on 14-9-13.
//  Copyright (c) 2014年 zbq. All rights reserved.
//

#import "TwoGradientImageView.h"

#define SeperatePosition 0.6

@implementation TwoGradientImageView

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
    
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = CGRectMake(0, 0, 320, self.frame.size.height*SeperatePosition);
    gradientLayer.colors = @[(id)[UIColor colorWithWhite:1.0 alpha:1.0].CGColor, (id)[UIColor clearColor].CGColor];
    gradientLayer.startPoint = CGPointMake(0.5, 0);
    gradientLayer.endPoint = CGPointMake(0.5, 1);
    [self.layer addSublayer:gradientLayer];
    
    CAGradientLayer *gradientLayer1 = [CAGradientLayer layer];
    gradientLayer1.frame = CGRectMake(0, self.frame.size.height*SeperatePosition, 320, self.frame.size.height*(1-SeperatePosition));
    gradientLayer1.colors = @[(id)[UIColor clearColor].CGColor, (id)[UIColor colorWithWhite:1.0 alpha:1.0].CGColor];
    gradientLayer1.startPoint = CGPointMake(0.5, 0);
    gradientLayer1.endPoint = CGPointMake(0.5, 1);
    [self.layer addSublayer:gradientLayer1];
}

@end
