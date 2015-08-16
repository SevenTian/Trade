//
//  TextField.m
//  iOSApp
//
//  Created by sevenTian on 15/8/12.
//  Copyright (c) 2015年  sevenTian. All rights reserved.
//

#import "PasswordTextField.h"

@implementation PasswordTextField

- (instancetype)initWithFrame:(CGRect)frame
{
    if ([super initWithFrame:frame]) {
        [self becomeFirstResponder];
    }
    return self;
}

+ (instancetype)textField
{
    return [[self alloc]init];
}


-(BOOL)canPerformAction:(SEL)action withSender:(id)sender

{
    
    if ([UIMenuController sharedMenuController]) {
        
        [UIMenuController sharedMenuController].menuVisible = NO;
        
    }
    
    return NO;
    
}
- (void)showTextField
{
    self.borderStyle = UITextBorderStyleNone;
    self.keyboardType = UIKeyboardTypeNumberPad;
    self.textColor = [UIColor clearColor];
    self.tintColor = [UIColor clearColor];
    self.background = [UIImage imageNamed:@"password_in"];
    self.translatesAutoresizingMaskIntoConstraints = NO;
}


@end
