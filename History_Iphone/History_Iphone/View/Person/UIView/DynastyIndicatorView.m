//
//  DynastyIndicatorView.m
//  History_Iphone
//
//  Created by summer.zhu on 27/8/14.
//  Copyright (c) 2014年 zbq. All rights reserved.
//

#import "DynastyIndicatorView.h"

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

- (void)setArrDynasties:(NSArray *)arrDynasties{
    
}

@end
