//
//  ChapterConfigView.h
//  History_Iphone
//
//  Created by summer.zhu on 6/8/14.
//  Copyright (c) 2014年 zbq. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ChapterConfigDelegate <NSObject>

@optional
- (void)selectColor:(NSInteger)iColor;
- (void)selectFont:(NSInteger)iSize;

@end

@interface ChapterConfigView : UIView{
    IBOutlet UISlider *slider;
    IBOutlet UIView *viewConfig;
    IBOutlet UILabel *lblSeperate1;
    IBOutlet UILabel *lblSeperate2;
    IBOutlet UILabel *lblColSeperate;
    IBOutlet UIButton *btnWhite;
    IBOutlet UIButton *btnColor;
    IBOutlet UIButton *btnBlack;
}
@property(nonatomic, weak) id<ChapterConfigDelegate> delegate;

- (IBAction)didPressedBtnBg:(id)sender;
- (IBAction)didPressedBtnColor:(id)sender;
- (IBAction)swipeBrightness:(id)sender;

@end
