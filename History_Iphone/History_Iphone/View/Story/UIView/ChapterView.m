//
//  ChapterView.m
//  History_Iphone
//
//  Created by zbq on 14-6-19.
//  Copyright (c) 2014年 zbq. All rights reserved.
//

#import "ChapterView.h"
#import "PageView.h"
#import "TextKitManager.h"

@implementation ChapterView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (void)setStrContent:(NSString *)strContent{
    if (![_strContent isEqualToString:strContent]) {
        _strContent = strContent;
    }
    if (_strContent.length > 0) {
        _pageReuseView = [[NSMutableArray alloc] init];
        _pageViews = [[NSMutableArray alloc] init];
        _pageContents = [[NSMutableArray alloc] init];
        iCurrentIndex = 0;
        
        [self loadPagesView];
    }
}

//计算页面及数据
- (NSInteger)calcPages{
    NSInteger iTotalTextNumber = 0;
    NSInteger iPageNumers = 0;
    while (iTotalTextNumber < self.strContent.length) {
        iPageNumers ++;
        NSString *strLeft = [self.strContent substringFromIndex:iTotalTextNumber];
        NSInteger iPageContentNumber = [[TextKitManager shareInstance] getShowNumbers:strLeft rect:scrollText.bounds attribute:nil];
        NSLog(@"%d", iPageContentNumber);
        NSString *strContentPage = [strLeft substringToIndex:iPageContentNumber];
        [_pageContents addObject:strContentPage];
        iTotalTextNumber += iPageContentNumber;
    }
    iPageNumers ++;
    
    //创建重用的PageView
    if (iPageNumers > 2) {
        PageView *pageView = [[[NSBundle mainBundle] loadNibNamed:@"PageView" owner:self options:nil] lastObject];
        [_pageReuseView addObject:pageView];
    }
    
    return iPageNumers>3?3:iPageNumers;
}

//创建pageView
- (void)createPagesView{
    NSInteger iPages = [self calcPages];
    for (int i=0; i<iPages; i++) {
        PageView *pageView = [[[NSBundle mainBundle] loadNibNamed:@"PageView" owner:self options:nil] lastObject];
        [_pageViews addObject:pageView];
    }
}

//加载pageView
- (void)loadPagesView{
    [self createPagesView];
    scrollText.contentSize = CGSizeMake(_pageContents.count*320, 454);
    for (int i=0; i<_pageViews.count; i++) {
        PageView *pageView = _pageViews[i];
        [scrollText addSubview:pageView];
        pageView.frame = CGRectMake(i*320, 0, pageView.frame.size.width, pageView.frame.size.height);
        pageView.strContent = _pageContents[i];
    }
}

- (NSInteger)getCurrentPageIndex{
    return iCurrentIndex;
}

- (void)reusePagesView:(NSInteger)index{
    if (iCurrentIndex < index) {//往后滑动
        if (![self hasPageViewAfter:index]) {
            PageView *visibleFirstPageView = [self getVisibleFirstPageView];
            PageView *reusePageView = _pageReuseView[0];
            [_pageReuseView removeObject:reusePageView];
            [_pageViews removeObject:visibleFirstPageView];
            [_pageReuseView addObject:visibleFirstPageView];
            [_pageViews addObject:reusePageView];
            reusePageView.frame = CGRectMake((index+1)*320, 0, reusePageView.frame.size.width, reusePageView.frame.size.height);
            [scrollText addSubview:reusePageView];
            reusePageView.strContent = _pageContents[index+1];
            [visibleFirstPageView removeFromSuperview];
        }
    }else{
        if (![self hasPageViewBefore:index]) {
            PageView *visibleFirstPageView = [self getVisibleLastPageView];
            PageView *reusePageView = _pageReuseView[0];
            [_pageReuseView removeObject:reusePageView];
            [_pageViews removeObject:visibleFirstPageView];
            [_pageReuseView addObject:visibleFirstPageView];
            [_pageViews addObject:reusePageView];
            reusePageView.frame = CGRectMake((index-1)*320, 0, reusePageView.frame.size.width, reusePageView.frame.size.height);
            [scrollText addSubview:reusePageView];
            reusePageView.strContent = _pageContents[index-1];
            [visibleFirstPageView removeFromSuperview];
        }
    }
    iCurrentIndex = index;
}

//index后面还有没有PageView（如果index=最后一个，则认为有）
- (BOOL)hasPageViewAfter:(NSInteger)index{
    BOOL bHas = NO;
    if ((index+1)*320 < scrollText.contentSize.width) {
        for (UIView *subview in scrollText.subviews) {
            if ([subview isKindOfClass:[PageView class]]) {
                if (subview.frame.origin.x >= index*320+320) {
                    bHas = YES;
                    break;
                }
            }
        }
    }else{
        bHas = YES;
    }
    return bHas;
}

//index前面还有没有PageView（如果index=0，则认为有）
- (BOOL)hasPageViewBefore:(NSInteger)index{
    BOOL bHas = NO;
    if (index > 0) {
        for (UIView *subview in scrollText.subviews) {
            if ([subview isKindOfClass:[PageView class]]) {
                if (subview.frame.origin.x < index*320) {
                    bHas = YES;
                }
            }
        }
    }else{
        bHas = YES;
    }
    return bHas;
}

//获取scrollView的最前面的PageView
- (PageView *)getVisibleFirstPageView{
    PageView *pageFirst = nil;
    CGFloat f_x = MAXFLOAT;
    for (PageView *pageViewItem in self.pageViews) {
        if (pageViewItem.frame.origin.x < f_x) {
            pageFirst = pageViewItem;
            f_x = pageViewItem.frame.origin.x;
        }
    }
    return pageFirst;
}

//获取scrollView的最后面的PageView
- (PageView *)getVisibleLastPageView{
    PageView *pageLast = nil;
    CGFloat f_x = 0;
    for (PageView *pageViewItem in self.pageViews) {
        if (pageViewItem.frame.origin.x > f_x) {
            pageLast = pageViewItem;
            f_x = pageViewItem.frame.origin.x;
        }
    }
    return pageLast;
}

#pragma mark - UIScrollView Delegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat contentOffSet = scrollView.contentOffset.x;
    NSInteger index = (NSInteger)(contentOffSet/320);
    if (index != iCurrentIndex) {
        [self reusePagesView:index];
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    CGFloat contentOffSet = scrollView.contentOffset.x;
    NSInteger index = (NSInteger)(contentOffSet/320);
    [self reusePagesView:index];
}

@end
