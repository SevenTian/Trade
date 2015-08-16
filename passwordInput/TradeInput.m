//
//  PasswordInput.m
//  passwordInput
//
//  Created by  sevenTian on 15/8/14.
//  Copyright (c) 2015年 SevenTian. All rights reserved.
//

#import "TradeInput.h"
#import "UILabel+Extension.h"
#import "UIButton+Extension.h"
#import "PasswordTextField.h"

#define kPasswordInput_W kScreen_W * 0.69
#define kPasswordInput_H kScreen_H * 0.3
#define kPasswordInput_X (kScreen_W - kPasswordInput_W)/2
#define kPasswordInput_Y (kScreen_H - 216)/2 - kPasswordInput_H/2 - 32

@interface TradeInput ()<UITextFieldDelegate>
@property (weak , nonatomic) PasswordTextField *textField;
@property (strong,nonatomic) UIButton *confirmBtn;
@end
@implementation TradeInput

- (instancetype)initWithFrame:(CGRect)frame
{
    if ([super initWithFrame:frame]) {
        self.backgroundColor = [[UIColor grayColor]colorWithAlphaComponent:0.5];
        
    }
    return self;
}

+ (instancetype)passwordInput
{
      return [[self alloc]init];
}

- (void)setSubviews
{
    UIView *inputView = [[UIView alloc]init];
    inputView.backgroundColor = [UIColor whiteColor];
    CGFloat titleLabel_height = kPasswordInput_H * 0.3;
    CGFloat textField_height = kPasswordInput_H * 0.2;
    CGFloat confirmBtn_height = kPasswordInput_H * 0.2;
    CGFloat confirmBtn_V = kPasswordInput_H * 0.1;
    CGFloat forgetPasswordBtn_height =  kPasswordInput_H * 0.2;     inputView.frame = CGRectMake(kPasswordInput_X, kPasswordInput_Y, kPasswordInput_W, kPasswordInput_H);
    
    [self addSubview:inputView];

    UILabel *titleLabel = [UILabel labelWithTitle:@"请输入支付密码" fontSize:17];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [inputView addSubview:titleLabel];
    
    
    PasswordTextField *textField = [PasswordTextField textField];
    [textField showTextField];
    textField.delegate = self;
    [inputView addSubview:textField];
    
    UIButton *confirmBtn = [[UIButton alloc]init];
    [UIButton button:confirmBtn title:@"确定" titleColor:[UIColor whiteColor] buttonBackGround:[UIColor greenColor]];
    [confirmBtn addTarget:self action:@selector(confirmClick) forControlEvents:UIControlEventTouchUpInside];
    [inputView addSubview:confirmBtn];
    
    
    UIButton *forgetPasswordBtn = [[UIButton alloc]init];
    [UIButton button:forgetPasswordBtn title:@"忘记支付密码?" titleColor:[UIColor blueColor] buttonBackGround:[UIColor clearColor]];
    forgetPasswordBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    forgetPasswordBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [forgetPasswordBtn addTarget:self action:@selector(popToForgetPasswordController) forControlEvents:UIControlEventTouchUpInside];
    [inputView addSubview:forgetPasswordBtn];
    
    NSDictionary *views = NSDictionaryOfVariableBindings(titleLabel, textField, confirmBtn , forgetPasswordBtn);
    NSDictionary *metrics = @{@"padding" : @10 , @"titleLabel_height" : @(titleLabel_height) , @"textField_height" : @(textField_height) , @"confirmBtn_V" : @(confirmBtn_V) , @"confirmBtn_height" : @(confirmBtn_height) , @"forgetPasswordBtn_height" : @(forgetPasswordBtn_height)};

    [inputView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[titleLabel]|" options:0 metrics:nil views:views]];
    [inputView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[titleLabel(titleLabel_height)]" options:0 metrics:metrics views:views]];
    
    [inputView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-padding-[textField]-padding-|" options:0 metrics:metrics views:views]];
    [inputView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[titleLabel][textField(textField_height)]" options:0 metrics:metrics views:views]];
    
    [inputView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-padding-[confirmBtn]-padding-|" options:0 metrics:metrics views:views]];
    [inputView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[textField]-confirmBtn_V-[confirmBtn(confirmBtn_height)]" options:0 metrics:metrics views:views]];
    
    [inputView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-padding-[forgetPasswordBtn]-padding-|" options:0 metrics:metrics views:views]];
    [inputView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[confirmBtn][forgetPasswordBtn(forgetPasswordBtn_height)]" options:0 metrics:metrics views:views]];

    self.textField = textField;
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    NSLog(@"------%@",textField.text);

}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if (range.length == 0 ) {
        UIImage *image = [UIImage imageNamed:@"yuan"];
        UIImageView *imageView = [[UIImageView alloc]initWithImage:image];
            CGFloat centerX = self.textField.width/12;
            CGFloat centerY = self.textField.height/2;
            CGFloat single_width = self.textField.width/6;
            imageView.centerX = centerX + range.location * single_width;
            imageView.centerY = centerY;
        imageView.tag = range.location + 1;
        [self.textField addSubview:imageView];

    }else
    {
    
         UIImageView *imageView =(UIImageView *)[textField viewWithTag:range.location + 1];
            [imageView removeFromSuperview];
    }
    if (range.location > 5) {
        
        return NO;
    }
    return YES;
}
/**
 *  点击确定按钮
 */
- (void)confirmClick
{
    
    if (self.textField.text.length > 5) {
        [self.textField resignFirstResponder];
        [self removeFromSuperview];
    }else
    {
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"密码错误" message:@"您输入的密码有误，请重新输入" delegate:self cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
        [alertView show];
    }
}

/**
 * 执行代理
 */
- (void)popToForgetPasswordController
{
    [self.delegate pop];
}

@end
