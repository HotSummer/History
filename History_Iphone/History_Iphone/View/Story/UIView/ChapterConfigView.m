//
//  ChapterConfigView.m
//  History_Iphone
//
//  Created by summer.zhu on 6/8/14.
//  Copyright (c) 2014年 zbq. All rights reserved.
//

#import "ChapterConfigView.h"

@implementation ChapterConfigView

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

- (IBAction)didPressedBtnBg:(id)sender{
    [self removeFromSuperview];
}

- (IBAction)didPressedBtnColor:(id)sender{
    UIButton *btn = (UIButton *)sender;
    if ([self.delegate respondsToSelector:@selector(selectColor:)]) {
        [self.delegate selectColor:btn.tag];
    }
}

@end
