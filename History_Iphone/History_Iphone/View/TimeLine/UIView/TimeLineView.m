//
//  TimeLineView.m
//  History_Iphone
//
//  Created by summer.zhu on 15/8/14.
//  Copyright (c) 2014年 zbq. All rights reserved.
//

#import "TimeLineView.h"
#import "TimeLineManager.h"
#import "WhiteCircle.h"

#define LineUpSpace 6
#define LineDownSpace 6
#define TimeLineItemMinLength 30

@interface TimeLineView ()

@property(nonatomic) CGFloat fTotalTimeLineLength;
@property(nonatomic, strong) NSMutableArray *arrRate;
@property(nonatomic, strong) UIView *viewTimeLine;

@end

@implementation TimeLineView

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

- (id)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        //
        _arrRate = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    WhiteCircle *whiteCircle = [[WhiteCircle alloc] initWithFrame:CGRectMake(69, 0, 12, 12)];
    [self  addSubview:whiteCircle];
    
    _viewTimeLine = [[UIView alloc] init];
    [scrollViewTimeLine addSubview:_viewTimeLine];
    
    [self showTimeLine];
}

//计算时间线总长度
- (CGFloat)calcTotalHeight{
    CGFloat fTotalLength = 0;
    CGFloat fMin = 1;
    
    NSArray *arrEntity = [TimeLineManager shareInstance].timeLines;
    for (TimeLineEntity *entity in arrEntity) {
        fTotalLength += entity.length;
    }
    
    for (TimeLineEntity *entity in arrEntity) {
        CGFloat rate = entity.length/fTotalLength;
        NSNumber *number = [NSNumber numberWithFloat:rate];
        [_arrRate addObject:number];
        if (fMin > rate) {
            fMin = rate;
        }
    }
    
    _fTotalTimeLineLength = TimeLineItemMinLength/fMin;
    
    return 0;
}

- (void)createTimeLine{
    _viewTimeLine.frame = CGRectMake(0, 0, self.bounds.size.width, _fTotalTimeLineLength+LineUpSpace+LineDownSpace);
    scrollViewTimeLine.contentSize = CGSizeMake(self.bounds.size.width, MAX(_fTotalTimeLineLength+LineUpSpace+LineDownSpace, self.bounds.size.height));
    
    //创建时间线
    UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(74, LineUpSpace, 1, _fTotalTimeLineLength)];
    lbl.backgroundColor = [UIColor colorWithRed:114 green:117 blue:131 alpha:1.0];
    [_viewTimeLine addSubview:lbl];
    
    NSArray *arrEntity = [TimeLineManager shareInstance].timeLines;
    for (int i=0; i<arrEntity.count; i++) {
        
    }
}

- (void)createTimeLineButton{
    
}

- (void)showTimeLine{
    [self calcTotalHeight];
    [self createTimeLine];
}

@end
