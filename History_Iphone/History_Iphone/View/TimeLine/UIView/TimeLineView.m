//
//  TimeLineView.m
//  History_Iphone
//
//  Created by summer.zhu on 15/8/14.
//  Copyright (c) 2014年 zbq. All rights reserved.
//

#import "TimeLineView.h"
#import "TimeLineManager.h"
#import "GrayCircle.h"

#define LineUpSpace 6
#define LineDownSpace 6
#define TimeLineItemMinLength 8

@interface TimeLineView ()

@property(nonatomic, strong) NSArray *arrData;
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
        NSArray *arrEntity = [[TimeLineManager shareInstance] getTimeLineByLevel:[TimeLineManager shareInstance].currentLevel hasSuper:NO];
        _arrData = [[NSArray alloc] initWithArray:arrEntity];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    _viewTimeLine = [[UIView alloc] init];
    [scrollViewTimeLine addSubview:_viewTimeLine];
    
    [self showTimeLine];
    
    timeLineSlideView = [[TimeLineSlideView alloc] initWithFrame:CGRectMake(69, 0, 12, _fTotalTimeLineLength)];
    timeLineSlideView.tag = 1000;
    [scrollViewTimeLine addSubview:timeLineSlideView];
    timeLineSlideView.arrRate = _arrRate;
    timeLineSlideView.delegate = self;
}

//计算时间线总长度
- (CGFloat)calcTotalHeight{
    CGFloat fTotalLength = 0;
    CGFloat fMin = 1;
    
    for (TimeLineEntity *entity in _arrData) {
        fTotalLength += entity.length;
    }
    
    for (TimeLineEntity *entity in _arrData) {
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

//创建时间线
- (void)createTimeLine{
    _viewTimeLine.frame = CGRectMake(0, 0, self.bounds.size.width, _fTotalTimeLineLength+LineUpSpace+LineDownSpace);
    scrollViewTimeLine.contentSize = CGSizeMake(self.bounds.size.width, MAX(_fTotalTimeLineLength+LineUpSpace+LineDownSpace, self.bounds.size.height));
    
    //创建时间线
    UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(74, LineUpSpace, 1, _fTotalTimeLineLength)];
    lbl.backgroundColor = [UIColor colorWithRed:114 green:117 blue:131 alpha:1.0];
    [_viewTimeLine addSubview:lbl];
    
}

//创建时间线上的button
- (void)createTimeLineButton{
    CGFloat fYPosition = 0;
    for (int i=0; i<_arrData.count; i++) {
        TimeLineEntity *entity = _arrData[i];
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        if (i==0) {
            btn.frame = CGRectMake(4, 0, 68, 12);
            fYPosition = 0;
        }else{
            btn.frame = CGRectMake(4, _fTotalTimeLineLength*[_arrRate[i-1] floatValue]+fYPosition-6, 68, 12);
            fYPosition += _fTotalTimeLineLength*[_arrRate[i-1] floatValue];
        }
        
        [btn setTitle:entity.name forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:14.0];
        btn.tag = i;
        [btn addTarget:self action:@selector(showNextLevelTimeLine:) forControlEvents:UIControlEventTouchUpInside];
        [_viewTimeLine addSubview:btn];
        
        GrayCircle *grapCircle = [[GrayCircle alloc] initWithFrame:CGRectMake(71, btn.frame.origin.y+3, 6, 6)];
        [_viewTimeLine addSubview:grapCircle];
    }
}

- (void)showNextLevelTimeLine:(id)sender{
    UIButton *btn = (UIButton *)sender;
    TimeLineEntity *entity = _arrData[btn.tag];
    if ([self.delegate respondsToSelector:@selector(showNextLevelTimeLine:)]) {
        [self.delegate showNextLevelTimeLine:entity.story_id];
    }
}

- (void)showTimeLine{
    [self calcTotalHeight];
    [self createTimeLine];
    [self createTimeLineButton];
}

- (void)scrollToTime:(NSInteger)timeNumber{
    [timeLineSlideView scrollToTime:timeNumber];
    
    CGFloat fY = 0;
    if (scrollViewTimeLine.contentSize.height <= scrollViewTimeLine.frame.size.height) {
        fY = 0;
    }else{
        if (timeNumber == 0) {
            fY = 0;
        }else if (timeNumber == _arrData.count -1){
            fY = scrollViewTimeLine.contentSize.height-504;
            fY = (fY>0)?fY:0;
        }else{
            CGFloat fRate = 0;
            for (int i=0; i<timeNumber; i++) {
                NSNumber *number = _arrRate[i];
                fRate += [number floatValue];
            }
            fY = fRate*scrollViewTimeLine.contentSize.height-scrollViewTimeLine.frame.size.height/2.0;
            fY = (fY>0)?fY:0;
            CGFloat fMore = fY+scrollViewTimeLine.frame.size.height - scrollViewTimeLine.contentSize.height;
            if (fMore > 0) {
                fY = scrollViewTimeLine.contentSize.height - scrollViewTimeLine.frame.size.height;
            }
        }
    }
    [scrollViewTimeLine setContentOffset:CGPointMake(0, fY) animated:YES];
}

#pragma mark - TimeLineSlideDelegate
- (void)selectTime:(NSInteger)iTimeNumber{
    if ([self.delegate respondsToSelector:@selector(selectTime:)]) {
        [self.delegate selectTime:iTimeNumber];
    }
    
    [self scrollToTime:iTimeNumber];
}

@end
