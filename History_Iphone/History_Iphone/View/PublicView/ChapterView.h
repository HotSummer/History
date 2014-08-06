//
//  ChapterView.h
//  History_Iphone
//
//  Created by zbq on 14-6-19.
//  Copyright (c) 2014年 zbq. All rights reserved.
//

#define lineSpace 10
#define textSize 14

#import <UIKit/UIKit.h>

typedef enum {
    Day = 0,
    Color,
    Black
}ReadMode;

@interface ChapterView : UIView
<
UIScrollViewDelegate
>{
    IBOutlet UIScrollView *scrollText;
    NSInteger iCurrentIndex;
}

@property(nonatomic, strong) NSString *strContent;
@property(nonatomic, strong) NSMutableArray *pageViews;//Visible的page
@property(nonatomic, strong) NSMutableArray *pageReuseView;//Reuse的Page
@property(nonatomic, strong) NSMutableArray *pageContents;

//计算每个page的content
- (NSInteger)calcPages;
//创建pageview
- (void)createPagesView;
//显示pageView
- (void)loadPagesView;
//获取当前的pageview
- (NSInteger)getCurrentPageIndex;

//设置阅读模式
- (void)setReadMode:(ReadMode)mode;


@end
