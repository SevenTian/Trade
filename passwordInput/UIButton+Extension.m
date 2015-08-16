//
//  UIButton+Extension.m
//  iOSApp
//
//  Created by dingwei on 15/8/7.
//  Copyright (c) 2015年 SYY. All rights reserved.
//

#import "UIButton+Extension.h"

@implementation UIButton (Extension)
+ (void)buttonstyle:(UIButton *)button borderWidth:(CGFloat)width borderColor:(CGColorRef)color cornerRadius:(int)radius
{
    button.layer.borderWidth = width;
    button.layer.borderColor = color;
    button.layer.cornerRadius = radius;
    
}

//安全认证
+ (void)buttonFromSafetyCertificateSuperView:(UIView *)superView height:(NSString *)height
{
    UIButton *button = [[UIButton alloc]init];
    [button setImage:[UIImage imageNamed:@"save"] forState:UIControlStateNormal];
    [button setTitle:@"平台资金由***实时监督" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:14];
    button.translatesAutoresizingMaskIntoConstraints = NO;
    button.selected = NO;
    [superView addSubview:button];
    NSDictionary *views = NSDictionaryOfVariableBindings(button);
    NSDictionary *metrics = @{@"height" : height};
    [superView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[button]|" options:0 metrics:nil views:views]];
    [superView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[button(==height)]" options:0 metrics:metrics views:views]];
    [superView addConstraint:[NSLayoutConstraint constraintWithItem:button attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:superView attribute:NSLayoutAttributeBottom multiplier:1 constant:0]];
    
}

//按钮
+ (void)button:(UIButton *)button title:(NSString *)title titleColor:(UIColor *)titleColor buttonBackGround:(UIColor *)backGroundColor
{
    button.layer.cornerRadius = 5;
    button.backgroundColor = backGroundColor;
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont boldSystemFontOfSize:15];
    button.translatesAutoresizingMaskIntoConstraints = NO;
    
}





@end
