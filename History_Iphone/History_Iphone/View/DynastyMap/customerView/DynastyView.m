//
//  DynastyView.m
//  History_Iphone
//
//  Created by zbq on 14-5-27.
//  Copyright (c) 2014年 zbq. All rights reserved.
//

#import "DynastyView.h"

@implementation DynastyView
@synthesize dynastyName;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        lblDynastyName = [[UILabel alloc] initWithFrame:self.frame];
        lblDynastyName.textColor = [UIColor blackColor];
        lblDynastyName.textAlignment = NSTextAlignmentCenter;
        [self addSubview:lblDynastyName];
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
}

- (void)setDynastyName:(NSString *)_dynastyName{
    if (![dynastyName isEqualToString:_dynastyName]) {
        dynastyName = _dynastyName;
    }
    if (dynastyName.length > 0) {
        lblDynastyName.text = dynastyName;
    }
}

@end
