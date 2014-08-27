//
//  DynastyCellView.m
//  History_Iphone
//
//  Created by summer.zhu on 20/8/14.
//  Copyright (c) 2014年 zbq. All rights reserved.
//

#import "DynastyCellView.h"

@implementation DynastyCellView

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

- (void)layoutSubviews{
    [super layoutSubviews];
    
    btn = [[UIButton alloc] initWithFrame:CGRectMake(3, 3, self.bounds.size.width-6, self.bounds.size.height-6)];
    [self addSubview:btn];
    btn.backgroundColor = [UIColor clearColor];
    [btn setTitleColor:[UIColor colorWithRed:172.0/255.0 green:131.0/255.0 blue:92.0/255.0 alpha:1.0] forState:UIControlStateNormal];
    [btn setTitle:_strDynasty forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:16.0];
    [btn addTarget:self action:@selector(didPressedBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    [btn.layer setCornerRadius:3.0];
    btn.layer.borderWidth = thinLineHeight;
    btn.layer.borderColor = [UIColor colorWithRed:172.0/255.0 green:131.0/255.0 blue:92.0/255.0 alpha:1.0].CGColor;
}

- (void)didPressedBtn:(UIButton *)btn{
    if ([self.delegate respondsToSelector:@selector(selectDynasty:)]) {
        [self.delegate selectDynasty:self.tag];
    }
}

- (void)refreshView:(BOOL)bSelect{
    if (bSelect) {
        [btn setTitleColor:[UIColor colorWithRed:60.0/255.0 green:45.0/255.0 blue:42.0/255.0 alpha:1.0] forState:UIControlStateNormal];
        btn.layer.borderColor = [UIColor colorWithRed:60.0/255.0 green:45.0/255.0 blue:42.0/255.0 alpha:1.0].CGColor;
    }else{
        [btn setTitleColor:[UIColor colorWithRed:172.0/255.0 green:131.0/255.0 blue:92.0/255.0 alpha:1.0] forState:UIControlStateNormal];
        btn.layer.borderColor = [UIColor colorWithRed:172.0/255.0 green:131.0/255.0 blue:92.0/255.0 alpha:1.0].CGColor;
    }
}

@end
