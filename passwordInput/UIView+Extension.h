//
//  UIView+Extension.h
//  iOSApp
//
//  Created by dingwei on 15/8/5.
//  Copyright (c) 2015年 SYY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Extension)
@property (assign , nonatomic) CGFloat x;
@property (assign , nonatomic) CGFloat y;
@property (assign , nonatomic) CGFloat centerX;
@property (assign , nonatomic) CGFloat centerY;
@property (assign , nonatomic) CGFloat width;
@property (assign , nonatomic) CGFloat height;
@property (assign , nonatomic) CGSize size;
@property (assign , nonatomic) CGPoint origin;
+ (UIView *)viewWithColor:(UIColor *)color height:(CGFloat)height width:(CGFloat)width x:(CGFloat)x y:(CGFloat)y;
@end
