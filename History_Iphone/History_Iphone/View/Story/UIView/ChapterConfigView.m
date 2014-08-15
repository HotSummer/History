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

- (void)layoutSubviews{
    [super layoutSubviews];
    slider.value = [UIScreen mainScreen].brightness;
}

- (IBAction)didPressedBtnBg:(id)sender{
    [self removeFromSuperview];
}

- (IBAction)didPressedBtnColor:(id)sender{
    UIButton *btn = (UIButton *)sender;
    if ([self.delegate respondsToSelector:@selector(selectColor:)]) {
        [self.delegate selectColor:btn.tag];
    }
}

- (IBAction)swipeBrightness:(id)sender{
    [UIScreen mainScreen].brightness = slider.value;
}

- (IBAction)didPressedBtnSize:(id)sender{
    UIButton *btn = (UIButton *)sender;
    if ([self.delegate respondsToSelector:@selector(selectFont:)]) {
        [self.delegate selectFont:btn.tag];
    }
}

@end
