//
//  ILLuckyNumViewController.m
//  ItcastLottery
//
//  Created by mj on 13-12-22.
//  Copyright (c) 2013年 itcast. All rights reserved.
//

#import "ILLuckyNumViewController.h"
#import "ILThreeButton.h"
#import "ILCircleView.h"

@interface ILLuckyNumViewController () <ILCircleViewDelegate>
{
    ILThreeButton *_threeButton;
    ILCircleView *_circle;
}
@end

@implementation ILLuckyNumViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 1.添加一个全屏的背景
    [self setupBg];
    
    // 2.添加3个选择按钮
    [self setupThreeBtn];
    
    // 2.添加转盘
    [self setupCircle];
}

#pragma mark 添加转盘
- (void)setupCircle
{
    ILCircleView *circle = [ILCircleView circleView];
    circle.delegate = self;
    // 设置转盘为星座类型
    circle.circleType = ILCircleViewTypeAstrology;
    
    CGFloat cx = _threeButton.center.x;
    CGFloat cy = CGRectGetMaxY(_threeButton.frame) + circle.frame.size.height * 0.5;
    
    if (!is4inch) { // 3.5inch屏幕，往上移动10个点
        cy -= 20;
    }
    
    circle.center = CGPointMake(cx, cy);
    [self.view addSubview:circle];
    
    _circle = circle;
}

#pragma mark 添加3个选择按钮
- (void)setupThreeBtn
{
    ILThreeButton *tb = [ILThreeButton threeButton];
    CGFloat cx = self.view.frame.size.width * 0.5;
    CGFloat cy = tb.frame.size.height * 0.5 + 20;
    tb.center = CGPointMake(cx, cy);
    [self.view addSubview:tb];
    _threeButton = tb;
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
    [_circle pauseRotate];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [_circle startRotate];
}

#pragma mark 添加一个全屏的背景
- (void)setupBg
{
    UIImageView *bg = [[UIImageView alloc] initWithFrame:self.view.bounds];
    bg.image = [UIImage imageNamed:is4inch?@"LuckyBackground-568h@2x.jpg":@"LuckyBackground@2x.jpg"];
    bg.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:bg];
}

#pragma mark - 转盘的代理方法
- (void)circleView:(ILCircleView *)circleView didRoateToIndex:(NSUInteger)index
{
    ILLog(@"快速转到了哪个生肖---%d", index);
}

- (void)circleView:(ILCircleView *)circleView willRoateToIndex:(NSUInteger)index
{
    ILLog(@"即将转到了哪个生肖---%d", index);
}

@end
