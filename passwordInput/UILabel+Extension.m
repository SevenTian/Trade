//
//  UILabel+Extension.m
//  iOSApp
//
//  Created by dingwei on 15/8/11.
//  Copyright (c) 2015年 SYY. All rights reserved.
//

#import "UILabel+Extension.h"

@implementation UILabel (Extension)
/**
 *  label
 *
 *  @param title 文字
 *
 *  @return label
 */
+ (UILabel *)labelWithTitle:(NSString *)title fontSize:(CGFloat)fontSize
{
    UILabel *label = [[UILabel alloc]init];
    label.text = title;
    label.textColor = [UIColor grayColor];
    label.font = [UIFont systemFontOfSize: fontSize];
    label.translatesAutoresizingMaskIntoConstraints = NO;
    return label;
}

@end
