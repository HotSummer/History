//
//  ChapterConfigView.m
//  History_Iphone
//
//  Created by summer.zhu on 6/8/14.
//  Copyright (c) 2014年 zbq. All rights reserved.
//

#import "ChapterConfigView.h"
#import "TriangleView.h"

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
    lblSeperate1.frame = CGRectMake(lblSeperate1.frame.origin.x, lblSeperate1.frame.origin.y, lblSeperate1.frame.size.width, thinLineHeight);
    lblSeperate2.frame = CGRectMake(lblSeperate2.frame.origin.x, lblSeperate2.frame.origin.y, lblSeperate2.frame.size.width, thinLineHeight);
    lblColSeperate.frame = CGRectMake(lblColSeperate.frame.origin.x, lblColSeperate.frame.origin.y, lblColSeperate.frame.size.width, thinLineHeight);
    
    btnWhite.layer.borderWidth = 1;
    btnWhite.layer.borderColor = [UIColor blackColor].CGColor;
    btnColor.layer.borderWidth = 1;
    btnColor.layer.borderColor = [UIColor blackColor].CGColor;
    btnBlack.layer.borderWidth = 1;
    btnBlack.layer.borderColor = [UIColor blackColor].CGColor;
    viewConfig.layer.cornerRadius = 5.0;
    
    TriangleView *triangle = [[TriangleView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    [self addSubview:triangle];
}

- (IBAction)didPressedBtnBg:(id)sender{
    [self removeFromSuperview];
}

- (IBAction)didPressedBtnColor:(id)sender{
    btnWhite.layer.borderWidth = 1;
    btnWhite.layer.borderColor = [UIColor blackColor].CGColor;
    btnColor.layer.borderWidth = 1;
    btnColor.layer.borderColor = [UIColor blackColor].CGColor;
    btnBlack.layer.borderWidth = 1;
    btnBlack.layer.borderColor = [UIColor blackColor].CGColor;
    UIButton *btn = (UIButton *)sender;
    btn.layer.borderColor = [UIColor greenColor].CGColor;
    btn.layer.borderWidth = 2;
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
