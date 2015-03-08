//
//  ILMineViewController.m
//  ItcastLottery
//
//  Created by mj on 13-12-22.
//  Copyright (c) 2013年 itcast. All rights reserved.
//

#import "ILMineViewController.h"
#import "UIImage+Fit.h"

@interface ILMineViewController ()
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;

@end

@implementation ILMineViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 1.设置背景
    self.view.backgroundColor = ILGlobalBg;
    
    // 2.登录按钮背景
    [_loginBtn setBackgroundImage:[UIImage resizeImage:@"RedButton"] forState:UIControlStateNormal];
    [_loginBtn setBackgroundImage:[UIImage resizeImage:@"RedButtonPressed"] forState:UIControlStateHighlighted];
}

@end
