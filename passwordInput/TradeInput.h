//
//  PasswordInput.h
//  passwordInput
//
//  Created by  sevenTian on 15/8/14.
//  Copyright (c) 2015年 SevenTian. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PasswordInputDelegate <NSObject>

@optional
- (void)pop;

@end
@interface TradeInput : UIView
@property (weak,nonatomic) id <PasswordInputDelegate> delegate;

+ (instancetype)passwordInput;
- (void)setSubviews;
@end
