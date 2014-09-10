//
//  DynastyView.h
//  History_Iphone
//
//  Created by zbq on 14-5-27.
//  Copyright (c) 2014年 zbq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DynastyView : UIView{
    UILabel *lblDynastyName;
    UIImageView *imageviewDynasty;
}
@property(nonatomic, strong) NSString *dynastyName;
@property(nonatomic, strong) NSString *dynastyImageName;

@end
