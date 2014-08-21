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
    [[UIColor redColor] set];
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextBeginPath(ctx);
    CGContextMoveToPoint (ctx, CGRectGetMinX(rect), CGRectGetMinY(rect)); // top left
//    CGContextAddLineToPoint(ctx, CGRectGetMidX(rect)-10, CGRectGetMaxY(rect)-10); // mid right
    CGContextAddArcToPoint(ctx, CGRectGetMidX(rect)-10, CGRectGetMaxY(rect)-10, CGRectGetMidX(rect)+10, CGRectGetMaxY(rect)-10, 2);
//    CGContextAddLineToPoint(ctx, CGRectGetMidX(rect)+2, CGRectGetMaxY(rect)-2); // mid right
    CGContextAddLineToPoint(ctx, CGRectGetMaxX(rect), CGRectGetMinY(rect)); // bottom left
    CGContextClosePath(ctx);
//    CGContextSetRGBFillColor(ctx, 1, 1, 0, 1);
    CGContextFillPath(ctx);
}

@end
