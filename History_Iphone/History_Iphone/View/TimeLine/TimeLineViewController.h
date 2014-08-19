//
//  TimeLineViewController.h
//  History_Iphone
//
//  Created by summer.zhu on 15/8/14.
//  Copyright (c) 2014年 zbq. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PagedFlowView.h"
#import "TimeLineView.h"

@interface TimeLineViewController : UIViewController
<
PagedFlowViewDataSource,
PagedFlowViewDelegate,
TimeLineDelegate
>{
    IBOutlet PagedFlowView *pageView;
    TimeLineView *timeLineView;
}

@end
