//
//  TimeLineScrollView.m
//  History_Iphone
//
//  Created by summer.zhu on 19/8/14.
//  Copyright (c) 2014年 zbq. All rights reserved.
//

#import "TimeLineScrollView.h"
#import "TimeLineSlideView.h"
#import "WhiteCircle.h"

@implementation TimeLineScrollView

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

- (BOOL)delaysContentTouches{
    return NO;
}

- (BOOL)touchesShouldCancelInContentView:(UIView *)view{
    if ([view isKindOfClass:[TimeLineSlideView class]] || [view isKindOfClass:[WhiteCircle class]]) {
        return NO;
    }
    return YES;
}

@end
