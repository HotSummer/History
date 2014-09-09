//
//  DynastyMapViewController.h
//  History_Iphone
//
//  Created by zbq on 14-5-28.
//  Copyright (c) 2014年 zbq. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PagedFlowView.h"
#import "BaseViewController.h"

@interface DynastyMapViewController : BaseViewController
<
PagedFlowViewDataSource,
PagedFlowViewDelegate
>{
    IBOutlet UIImageView *imageMap;
    
    IBOutlet PagedFlowView *pageView;
}
- (IBAction)didPressedBtnBack:(id)sender;

@end
