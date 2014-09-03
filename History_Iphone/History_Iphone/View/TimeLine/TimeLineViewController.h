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
#import "BaseViewController.h"

@interface TimeLineViewController : BaseViewController
<
PagedFlowViewDataSource,
PagedFlowViewDelegate,
TimeLineDelegate
>{
    IBOutlet PagedFlowView *pageView;
    TimeLineView *timeLineView;
}

@end
