//
//  PageView.h
//  History_Iphone
//
//  Created by zbq on 14-6-19.
//  Copyright (c) 2014年 zbq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PageView : UIView
<
NSLayoutManagerDelegate
>{
    UITextView *txtContent;
    NSInteger iShowNumbers;
    NSTextContainer *textContainer;
    
}

@property(nonatomic, strong) NSString *strContent;

@end
