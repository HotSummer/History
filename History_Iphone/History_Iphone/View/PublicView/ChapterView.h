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

- (NSInteger)calcPages;
- (void)createPagesView;
- (void)loadPagesView;
- (NSInteger)getCurrentPageIndex;

@end
