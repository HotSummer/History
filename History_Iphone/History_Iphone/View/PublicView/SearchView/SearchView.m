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
    self.layer.cornerRadius = 3.0f;
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

- (id)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(textFiledEditChanged:)
                                                    name:@"UITextFieldTextDidChangeNotification"
                                                  object:txtSearch];
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

- (void)stopSearch{
    [self didPressedBtnCancel:nil];
}

-(void)textFiledEditChanged:(NSNotification *)obj{
    UITextField *textField = (UITextField *)obj.object;
    
    NSString *toBeString = textField.text;
    NSString *lang = [[textField textInputMode] primaryLanguage];//[[UITextInputMode currentInputMode] primaryLanguage]; // 键盘输入模式
    if ([lang isEqualToString:@"zh-Hans"]) { // 简体中文输入，包括简体拼音，健体五笔，简体手写
        

        UITextRange *selectedRange = [textField markedTextRange];
        //获取高亮部分
        UITextPosition *position = [textField positionFromPosition:selectedRange.start offset:0];
        // 没有高亮选择的字，则对已输入的文字进行字数统计和限制
        if (!position) {
            if ([self.delegate respondsToSelector:@selector(search:)]) {
                NSString *strSearch = toBeString;
                [self.delegate search:strSearch];
            }
        }
        // 有高亮选择的字符串，则暂不对文字进行统计和限制
        else{
            
        }
    }
    // 中文输入法以外的直接对其统计限制即可，不考虑其他语种情况
    else{
        textField.text = @"";
        UIAlertView *alertview = [[UIAlertView alloc] initWithTitle:@"请输入中文" message:nil delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alertview show];
    }
}

- (IBAction)didPressedBtnCancel:(id)sender{
    txtSearch.text = @"";
    if ([self.delegate respondsToSelector:@selector(search:)]) {
        [self.delegate search:@""];
    }
    [txtSearch resignFirstResponder];
}

#pragma mark - UITextFieldDelegate
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    [UIView animateWithDuration:0.3 animations:^{
        lblSearch.frame = CGRectMake(imageviewSearch.frame.origin.x+22, lblSearch.frame.origin.y, lblSearch.frame.size.width, lblSearch.frame.size.height);
        txtSearch.frame = CGRectMake(txtSearch.frame.origin.x, txtSearch.frame.origin.y, txtSearch.frame.size.width-40, txtSearch.frame.size.height);
        backgroudView.frame = CGRectMake(backgroudView.frame.origin.x, backgroudView.frame.origin.y, backgroudView.frame.size.width-40, backgroudView.frame.size.height);
    } completion:^(BOOL finished) {
        txtSearch.placeholder = @"搜索";
        lblSearch.text = @"";
        btnCancel.hidden = NO;
    }];
    return YES;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    if (textField.text.length == 0) {
        lblSearch.text = @"搜索";
        txtSearch.placeholder = @"";
    }
    btnCancel.hidden = YES;
    [UIView animateWithDuration:0.3 animations:^{
        lblSearch.frame = CGRectMake(imageviewSearch.frame.origin.x+124, lblSearch.frame.origin.y, lblSearch.frame.size.width, lblSearch.frame.size.height);
        txtSearch.frame = CGRectMake(txtSearch.frame.origin.x, txtSearch.frame.origin.y, txtSearch.frame.size.width+40, txtSearch.frame.size.height);
        backgroudView.frame = CGRectMake(backgroudView.frame.origin.x, backgroudView.frame.origin.y, backgroudView.frame.size.width+40, backgroudView.frame.size.height);
    } completion:^(BOOL finished) {
        
    }];
    
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    if ([self.delegate respondsToSelector:@selector(search:)]) {
        NSString *strSearch = textField.text;
        [self.delegate search:strSearch];
    }
    [txtSearch resignFirstResponder];
    return YES;
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
