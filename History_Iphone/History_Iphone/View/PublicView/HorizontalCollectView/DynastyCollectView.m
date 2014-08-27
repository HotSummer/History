//
//  DynastyCollectView.m
//  History_Iphone
//
//  Created by summer.zhu on 20/8/14.
//  Copyright (c) 2014年 zbq. All rights reserved.
//

#import "DynastyCollectView.h"

@implementation DynastyCollectView

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
    CGFloat fTotalLength = 20;
    
    DynastyCellView *view = [[DynastyCellView alloc] initWithFrame:CGRectMake(fTotalLength, 0, 93, 42)];
    view.strDynasty = @"全部";
    [self addSubview:view];
    view.tag = 0;
    view.delegate = self;
    fTotalLength += 98;
    
    for (int i=0; i<_arrDynasties.count; i++) {
        DynastyCellView *view = [[DynastyCellView alloc] initWithFrame:CGRectMake(fTotalLength, 0, 93, 42)];
        view.strDynasty = _arrDynasties[i];
        [self addSubview:view];
        view.tag = i+1;
        view.delegate = self;
        fTotalLength += 98;
    }
    fTotalLength += 15;
}

#pragma mark - DynastyCellDelegate
- (void)selectDynasty:(NSInteger)dynastyIndex{
    for (UIView *subView in self.subviews) {
        if ([subView isKindOfClass:[DynastyCellView class]]) {
            if (subView.tag == dynastyIndex) {
                [(DynastyCellView *)subView refreshView:YES];
            }else{
                [(DynastyCellView *)subView refreshView:NO];
            }
        }
    }
    
    if ([self.delegate respondsToSelector:@selector(didSelected:)]) {
        [self.delegate didSelected:dynastyIndex];
    }
}

@end
