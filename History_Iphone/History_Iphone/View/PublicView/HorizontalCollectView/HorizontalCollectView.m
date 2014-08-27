//
//  HorizontalCollectView.m
//  History_Iphone
//
//  Created by summer.zhu on 27/8/14.
//  Copyright (c) 2014年 zbq. All rights reserved.
//

#import "HorizontalCollectView.h"

@implementation HorizontalCollectView

- (void)layoutSubviews{
    [super layoutSubviews];
}

- (void)setArrData:(NSArray *)arrData{
    _arrData = arrData;
    
    CGFloat fTotalLength = 20;
    for (int i=0; i<_arrData.count+1; i++) {
        fTotalLength += 98;
    }
    fTotalLength += 15;
    
    DynastyCollectView *dynastyCollectView = [[DynastyCollectView alloc] initWithFrame:CGRectMake(0, 0, fTotalLength, 44)];
    dynastyCollectView.arrDynasties = _arrData;
    [scrollDynasty addSubview:dynastyCollectView];
    dynastyCollectView.delegate = self;
    [scrollDynasty setContentSize:CGSizeMake(fTotalLength, 42)];
}

#pragma mark - DynastyCollectDelegate
- (void)didSelected:(NSInteger)iSelected{
    if ([self.delegate respondsToSelector:@selector(didSelected:)]) {
        [self.delegate didSelected:iSelected];
    }
}

@end
