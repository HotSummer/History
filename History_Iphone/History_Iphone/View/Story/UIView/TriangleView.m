//
//  TriangleView.m
//  History_Iphone
//
//  Created by zbq on 14-8-22.
//  Copyright (c) 2014年 zbq. All rights reserved.
//

#import "TriangleView.h"

@implementation TriangleView

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
    [[UIColor colorWithRed:251.0/255.0 green:163.0/255.0 blue:65.0/255.0 alpha:1.0] set];
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextBeginPath(ctx);
    
    CGContextMoveToPoint(ctx, CGRectGetMinX(rect), CGRectGetMinY(rect));//左上
    CGContextAddArcToPoint(ctx, CGRectGetMidX(rect), CGRectGetMaxY(rect), CGRectGetMaxX(rect), CGRectGetMinY(rect), 5);
    CGContextAddLineToPoint(ctx, CGRectGetMaxX(rect), CGRectGetMinY(rect)); // mid right

    CGContextClosePath(ctx);
    CGContextFillPath(ctx);
}

@end
