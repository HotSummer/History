//
//  TimeLineSlideView.h
//  History_Iphone
//
//  Created by summer.zhu on 19/8/14.
//  Copyright (c) 2014年 zbq. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WhiteCircle.h"

@protocol TimeLineSlideDelegate <NSObject>

@optional
- (void)selectTime:(NSInteger)iTime;

@end

@interface TimeLineSlideView : UIView{
    BOOL bEffectiveGesture;
    CGPoint prePoint;
    WhiteCircle *whiteCircle;
}
@property(nonatomic, weak) id<TimeLineSlideDelegate> delegate;
@property(nonatomic, strong) NSArray *arrRate;

- (void)scrollToTime:(NSInteger)timeNumber;


@end
