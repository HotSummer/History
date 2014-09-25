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


- (id)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        NSTextStorage *textStorage = [[NSTextStorage alloc] init];
        
        NSLayoutManager *layoutManager = [[NSLayoutManager alloc] init];
        [textStorage addLayoutManager:layoutManager];
        layoutManager.delegate = self;
        
        textContainer = [[NSTextContainer alloc] initWithSize:CGSizeMake(320, (iPhone5?454:366))];
        [layoutManager addTextContainer:textContainer];
        
        _txtContent = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, 320, (iPhone5?454:366)) textContainer:textContainer];//设置textView样式
        _txtContent.editable = NO;
        _txtContent.scrollEnabled = NO;
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    
    [self addSubview:_txtContent];
    _txtContent.text = _strContent;
}

- (void)setStrContent:(NSString *)strContent{
    _strContent = strContent;
    _txtContent.text = strContent;
}

- (void)setFont:(UIFont *)font{
    _font = font;
    _txtContent.font = _font;
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
