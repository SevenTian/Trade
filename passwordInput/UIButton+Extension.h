//
//  UIButton+Extension.h
//  iOSApp
//
//  Created by dingwei on 15/8/7.
//  Copyright (c) 2015年 SYY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Extension)

+ (void)buttonstyle:(UIButton *)button borderWidth:(CGFloat)width borderColor:(CGColorRef)color cornerRadius:(int)radius;
+ (void)buttonFromSafetyCertificateSuperView:(UIView *)superView height:(NSString *)height;
+ (void)button:(UIButton *)button title:(NSString *)title titleColor:(UIColor *)titleColor buttonBackGround:(UIColor *)backGroundColor;


@end
