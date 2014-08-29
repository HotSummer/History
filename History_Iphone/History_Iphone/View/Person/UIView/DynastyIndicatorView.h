//
//  DynastyIndicatorView.h
//  History_Iphone
//
//  Created by summer.zhu on 27/8/14.
//  Copyright (c) 2014年 zbq. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DynastyIndicatorDelegate <NSObject>

@optional
- (void)didSelectedDynasty:(NSInteger)iSelected;

@end

@interface DynastyIndicatorView : UIView

@property(nonatomic, weak) id<DynastyIndicatorDelegate> delegate;

- (IBAction)didPressedBtnDynasty:(id)sender;
- (void)setCurrentIndex:(NSInteger)current;

@end
