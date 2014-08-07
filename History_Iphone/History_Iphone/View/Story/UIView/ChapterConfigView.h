//
//  ChapterConfigView.h
//  History_Iphone
//
//  Created by summer.zhu on 6/8/14.
//  Copyright (c) 2014年 zbq. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ChapterConfigDelegate <NSObject>

@optional
- (void)selectColor:(NSInteger)iColor;

@end

@interface ChapterConfigView : UIView
@property(nonatomic, weak) id<ChapterConfigDelegate> delegate;

- (IBAction)didPressedBtnBg:(id)sender;
- (IBAction)didPressedBtnColor:(id)sender;

@end
