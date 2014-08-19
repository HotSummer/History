//
//  TimeLineView.h
//  History_Iphone
//
//  Created by summer.zhu on 15/8/14.
//  Copyright (c) 2014年 zbq. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TimeLineSlideView.h"

@protocol TimeLineDelegate <NSObject>

@optional
- (void)selectTime:(NSInteger)iTimeNumber;

@end

@interface TimeLineView : UIView
<
TimeLineSlideDelegate
>{
    IBOutlet UIScrollView *scrollViewTimeLine;
    TimeLineSlideView *timeLineSlideView;
}
@property(nonatomic, weak) id<TimeLineDelegate> delegate;

- (void)scrollToTime:(NSInteger)timeNumber;

@end
