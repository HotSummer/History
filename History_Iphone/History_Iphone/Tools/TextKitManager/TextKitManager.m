//
//  TextKitManager.m
//  History_Iphone
//
//  Created by zbq on 14-6-27.
//  Copyright (c) 2014年 zbq. All rights reserved.
//

#import "TextKitManager.h"

@implementation TextKitManager

+ (TextKitManager *)shareInstance{
    static TextKitManager *manager = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        manager = [[TextKitManager alloc] init];
    });
    return manager;
}

- (NSInteger)getShowNumbers:(NSString *)strContent rect:(CGRect)rect attribute:(NSDictionary *)dic{
    
    UIFont *font = dic[@"font"];
    
    NSTextStorage *textStorage = [[NSTextStorage alloc] initWithString:strContent];
    [textStorage addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, strContent.length)];
    
    NSLayoutManager *layoutManager = [[NSLayoutManager alloc] init];
    [textStorage addLayoutManager:layoutManager];
    layoutManager.delegate = self;
    
    NSTextContainer *textContainer = [[NSTextContainer alloc] initWithSize:rect.size];
//    textContainer.lineBreakMode = NSLineBreakByWordWrapping;
//    textContainer.lineFragmentPadding = 0;
    [layoutManager addTextContainer:textContainer];
    
    NSRange charRange = [layoutManager glyphRangeForTextContainer:textContainer];//[layoutManager glyphRangeForBoundingRectWithoutAdditionalLayout:rect inTextContainer:textContainer];//
    
    return charRange.length;
}

#pragma mark - NSLayoutManagerDelegate
- (CGFloat)layoutManager:(NSLayoutManager *)layoutManager lineSpacingAfterGlyphAtIndex:(NSUInteger)glyphIndex withProposedLineFragmentRect:(CGRect)rect
{
	return customerLineSpace;
}

//- (CGFloat)layoutManager:(NSLayoutManager *)layoutManager paragraphSpacingBeforeGlyphAtIndex:(NSUInteger)glyphIndex withProposedLineFragmentRect:(CGRect)rect{
//    return customerParagraphSpac;
//}

@end
