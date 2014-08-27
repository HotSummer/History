//
//  DynastyCellView.h
//  History_Iphone
//
//  Created by summer.zhu on 20/8/14.
//  Copyright (c) 2014年 zbq. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DynastyCellDelegate <NSObject>

@optional
- (void)selectDynasty:(NSInteger)dynastyIndex;

@end

@interface DynastyCellView : UIView{
    UIButton *btn;
}
@property(nonatomic, weak) id<DynastyCellDelegate> delegate;
@property(nonatomic, strong) NSString *strDynasty;

- (void)refreshView:(BOOL)bSelect;

@end
