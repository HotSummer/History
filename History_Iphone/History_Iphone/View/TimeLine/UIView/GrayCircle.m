//
//  GrayCircle.m
//  History_Iphone
//
//  Created by summer.zhu on 19/8/14.
//  Copyright (c) 2014年 zbq. All rights reserved.
//

#import "GrayCircle.h"

@implementation GrayCircle

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
    self.backgroundColor = [UIColor clearColor];
}

- (void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    
    CGFloat fRadius = MIN(rect.size.width, rect.size.height);
    CGFloat x = (rect.size.width-fRadius)/2.0;
    CGFloat y = (rect.size.height-fRadius)/2.0;
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextAddEllipseInRect(ctx, CGRectMake(x, y, fRadius, fRadius));
    [[UIColor grayColor] set];
    CGContextFillPath(ctx);
}

@end
