//
//  HorizontalCollectView.h
//  History_Iphone
//
//  Created by summer.zhu on 27/8/14.
//  Copyright (c) 2014年 zbq. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DynastyCollectView.h"

@protocol HorizontalCollectViewDelegate <NSObject>

@optional
- (void)didSelected:(NSInteger)iSelected;

@end

@interface HorizontalCollectView : UIView
<
DynastyCollectDelegate
>{
    IBOutlet UIScrollView *scrollDynasty;
}

@property(nonatomic, strong) NSArray *arrData;
@property(nonatomic, weak) id<HorizontalCollectViewDelegate> delegate;

@end
