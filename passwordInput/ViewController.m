//
//  ViewController.m
//  passwordInput
//
//  Created by  sevenTian on 15/8/14.
//  Copyright (c) 2015年 SevenTian. All rights reserved.
//

#import "ViewController.h"
#import "TradeInput.h"
@interface ViewController ()<PasswordInputDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor cyanColor];

}
- (IBAction)showInput:(id)sender
{
    TradeInput *passwordInput = [TradeInput passwordInput];
    passwordInput.frame = CGRectMake(0, 0, kScreen_W, kScreen_H);
    passwordInput.delegate = self;
    [passwordInput setSubviews];
    [self.view addSubview:passwordInput];
}


/**
 *  实现代理方法
 */
- (void)pop
{
    NSLog(@"test");
}

@end
