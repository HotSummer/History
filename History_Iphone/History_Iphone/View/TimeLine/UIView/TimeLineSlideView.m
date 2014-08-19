//
//  TimeLineSlideView.m
//  History_Iphone
//
//  Created by summer.zhu on 19/8/14.
//  Copyright (c) 2014年 zbq. All rights reserved.
//

#import "TimeLineSlideView.h"

@implementation TimeLineSlideView

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
    whiteCircle = [[WhiteCircle alloc] initWithFrame:CGRectMake(0, 0, 12, 12)];
    [self addSubview:whiteCircle];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint touchPoint = [touch locationInView:self];
    if (CGRectContainsPoint(whiteCircle.frame, touchPoint)) {
        bEffectiveGesture = YES;
        prePoint = touchPoint;
    }else{
        bEffectiveGesture = NO;
    }
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    if (bEffectiveGesture) {
        UITouch *touch = [touches anyObject];
        CGPoint touchPoint = [touch locationInView:self];
        CGFloat yDelta = touchPoint.y-prePoint.y;
        CGRect rect = whiteCircle.frame;
        rect.origin.y = rect.origin.y+yDelta;
        if (rect.origin.y < 0) {
            rect.origin.y = 0;
        }
        if (rect.origin.y > self.frame.size.height) {
            rect.origin.y = self.frame.size.height;
        }
        whiteCircle.frame = rect;
        prePoint = touchPoint;
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    bEffectiveGesture = NO;
    UITouch *touch = [touches anyObject];
    CGPoint touchPoint = [touch locationInView:self];
    
    NSInteger fEndArea = [self calcEndArea:touchPoint.y];
    CGFloat fEndYPosition = [self correctPosition:fEndArea];
    CGRect rect = whiteCircle.frame;
    rect.origin.y = (fEndYPosition==0)?0:(fEndYPosition-6);
    [UIView animateWithDuration:0.3 animations:^{
        whiteCircle.frame = rect;
    }];
    if ([self.delegate respondsToSelector:@selector(selectTime:)]) {
        [self.delegate selectTime:fEndArea];
    }
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event{
    bEffectiveGesture = NO;
    UITouch *touch = [touches anyObject];
    CGPoint touchPoint = [touch locationInView:self];
    
    NSInteger fEndArea = [self calcEndArea:touchPoint.y];
    CGFloat fEndYPosition = [self correctPosition:fEndArea];
    CGRect rect = whiteCircle.frame;
    rect.origin.y = (fEndYPosition==0)?0:(fEndYPosition-6);
    [UIView animateWithDuration:0.3 animations:^{
        whiteCircle.frame = rect;
    }];
    if ([self.delegate respondsToSelector:@selector(selectTime:)]) {
        [self.delegate selectTime:fEndArea];
    }
}

//计算大的白色圆形最后应该在哪个区域
- (NSInteger)calcEndArea:(CGFloat)y{
    NSInteger iArea = _arrRate.count-1;
    CGFloat fAreaRate = 0;
    for (int i=0; i<_arrRate.count-1; i++) {
        NSNumber *number = _arrRate[i];
        CGFloat fY = [number floatValue];
        fAreaRate += [number floatValue];
        if (y<fAreaRate*self.frame.size.height) {
            if (y > ((fAreaRate - fY)*self.frame.size.height+0.5*fY*self.frame.size.height)) {
                iArea = i+1;
            }else{
                iArea = i;
            }
            break;
        }
    }
    return iArea;
}

//根据哪块区域调整大的白色圆形的位置
- (CGFloat)correctPosition:(NSInteger)iArea{
    
    if (iArea==0) {
        return 0;
    }else if(iArea == _arrRate.count-1){
        CGFloat lastAreaLength = [[_arrRate lastObject] floatValue]*self.frame.size.height;
        return self.frame.size.height - lastAreaLength;
    }else{
        CGFloat fRateTotal = 0;
        for (int i=0; i<iArea; i++) {
            fRateTotal += [_arrRate[i] floatValue];
        }
        return self.frame.size.height * fRateTotal;
    }
}


- (void)scrollToTime:(NSInteger)timeNumber{
    CGFloat fRateTotal = 0;
    for (int i=0; i<timeNumber; i++) {
        fRateTotal += [_arrRate[i] floatValue];
    }
    CGRect rect = whiteCircle.frame;
    CGFloat fY = fRateTotal*self.frame.size.height;
    rect.origin.y =  (fY==0)?0:(fY-6);
    [UIView animateWithDuration:0.3 animations:^{
        whiteCircle.frame = rect;
    }];
}

@end
