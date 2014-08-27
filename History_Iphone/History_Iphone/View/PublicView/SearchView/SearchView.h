//
//  SearchView.h
//  History_Iphone
//
//  Created by zbq on 14-8-21.
//  Copyright (c) 2014年 zbq. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SearchViewDelegate <NSObject>

@optional
- (void)search:(NSString *)searchContent;

@end

@interface SearchBackgroudView : UIView

@end

@interface SearchView : UIView
<
UITextFieldDelegate
>{
    IBOutlet SearchBackgroudView *backgroudView;
    IBOutlet UIImageView *imageviewSearch;
    IBOutlet UILabel *lblSearch;
    IBOutlet UITextField *txtSearch;
    IBOutlet UIButton *btnCancel;
}
@property(nonatomic, weak) id<SearchViewDelegate> delegate;

@end
