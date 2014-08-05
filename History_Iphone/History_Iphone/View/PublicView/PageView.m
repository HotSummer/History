//
//  PageView.m
//  History_Iphone
//
//  Created by zbq on 14-6-19.
//  Copyright (c) 2014年 zbq. All rights reserved.
//

#import "PageView.h"

@implementation PageView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    
    NSTextStorage *textStorage = [[NSTextStorage alloc] init];
    
    NSLayoutManager *layoutManager = [[NSLayoutManager alloc] init];
    [textStorage addLayoutManager:layoutManager];
    layoutManager.delegate = self;
    
    textContainer = [[NSTextContainer alloc] initWithSize:self.bounds.size];
    [layoutManager addTextContainer:textContainer];
    
    txtContent = [[UITextView alloc] initWithFrame:self.bounds textContainer:textContainer];//设置textView样式
    txtContent.editable = NO;
    txtContent.scrollEnabled = NO;
    txtContent.font = [UIFont systemFontOfSize:14];
    [self addSubview:txtContent];
    txtContent.text = _strContent;
}

- (void)setStrContent:(NSString *)strContent{
    _strContent = strContent;
    txtContent.text = strContent;
}

#pragma mark - NSLayoutManagerDelegate
- (CGFloat)layoutManager:(NSLayoutManager *)layoutManager lineSpacingAfterGlyphAtIndex:(NSUInteger)glyphIndex withProposedLineFragmentRect:(CGRect)rect
{
	return 18;
}

//- (CGFloat)layoutManager:(NSLayoutManager *)layoutManager paragraphSpacingBeforeGlyphAtIndex:(NSUInteger)glyphIndex withProposedLineFragmentRect:(CGRect)rect{
//    return 20;
//}

@end
