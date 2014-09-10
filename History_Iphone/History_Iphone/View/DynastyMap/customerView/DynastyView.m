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
@synthesize dynastyImageName;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        imageviewDynasty = [[UIImageView alloc] initWithFrame:self.bounds];
        [self addSubview:imageviewDynasty];
        
        lblDynastyName = [[UILabel alloc] initWithFrame:self.bounds];
        lblDynastyName.textColor = [UIColor whiteColor];
        lblDynastyName.textAlignment = NSTextAlignmentCenter;
        lblDynastyName.font = [UIFont fontWithName:@"DIN Alternate" size:20.0];
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

- (void)setDynastyImageName:(NSString *)_dynastyImageName{
    if (![dynastyImageName isEqualToString:_dynastyImageName]) {
        dynastyImageName = _dynastyImageName;
    }
    
    if (dynastyImageName.length > 0) {
        imageviewDynasty.image = [UIImage imageNamed:dynastyImageName];
    }
}

@end
