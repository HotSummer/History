//
//  DynastyCollectView.h
//  History_Iphone
//
//  Created by summer.zhu on 20/8/14.
//  Copyright (c) 2014年 zbq. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DynastyCellView.h"
#import "DynastyList.h"

@protocol DynastyCollectDelegate <NSObject>

@optional
- (void)didSelectedDynasty:(DynastyList *)dynasty;

@end

@interface DynastyCollectView : UIView
<
DynastyCellDelegate
>{
}
@property(nonatomic, weak) id<DynastyCollectDelegate> delegate;
@property(nonatomic, strong) NSArray *arrDynasties;

@end
