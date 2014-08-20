//
//  SearchView.m
//  History_Iphone
//
//  Created by zbq on 14-8-21.
//  Copyright (c) 2014年 zbq. All rights reserved.
//

#import "SearchView.h"
@implementation SearchBackgroudView

- (void)layoutSubviews{
    [super layoutSubviews];
    
    self.backgroundColor = [UIColor whiteColor];
    
    self.layer.masksToBounds = YES;
    self.layer.borderWidth = thinLineHeight;
    self.layer.borderColor = [UIColor colorWithRed:136.0/255.0 green:136.0/255.0 blue:136.0/255.0 alpha:1.0].CGColor;
    self.layer.cornerRadius = 2.0f;
}

@end

@implementation SearchView

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

@end
