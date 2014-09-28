//
//  ArrowView.m
//  History_Iphone
//
//  Created by summer.zhu on 28/9/14.
//  Copyright (c) 2014年 zbq. All rights reserved.
//

#import "ArrowView.h"

@interface ArrowView ()

@property(nonatomic, strong) IBOutlet UILabel *lblArrow;

@end

@implementation ArrowView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    
    _lblArrow.transform = CGAffineTransformMakeRotation(-M_PI_2);
}


- (void)layoutSubviews{
    [super layoutSubviews];
}

@end
