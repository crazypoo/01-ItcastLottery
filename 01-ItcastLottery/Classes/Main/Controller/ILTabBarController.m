//
//  ILTabBarController.m
//  01-ItcastLottery
//
//  Created by apple on 13-12-23.
//  Copyright (c) 2013年 itcast. All rights reserved.
//

#import "ILTabBarController.h"
#import "ILTabBar.h"
#import "UINavigationItem+IL.h"

@interface ILTabBarController () <ILTabBarDelegate>

@end

@implementation ILTabBarController
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if (iOS7) {
        // 1.UIRectEdgeNone不要往四周边缘展开(按照非iOS7的传统来展示)
        self.edgesForExtendedLayout = UIRectEdgeNone;
        
        // 2.让所有的子控制器都不能展开
        for (UIViewController *vc in self.childViewControllers) {
            vc.edgesForExtendedLayout = UIRectEdgeNone;
        }
        
        // NO代表展开的时候不要包含那个条
//        self.extendedLayoutIncludesOpaqueBars = NO;
    }
    
    // 自动会调用scrollView的contentInsets（比如group样式的tableView的insets.top=64）
//    self.automaticallyAdjustsScrollViewInsets = YES;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        // 1.删除默认的tab按钮
        [self.tabBar removeFromSuperview];
//        for (UIControl *btn in self.tabBar.subviews) {
//            [btn removeFromSuperview];
//        }
        
        // 2.创建tabbar
        ILTabBar *myTabBar = [[ILTabBar alloc] init];
        myTabBar.frame = self.tabBar.frame;
        myTabBar.delegate = self;
        [self.view addSubview:myTabBar];
        
        // 3.添加5个按钮
        for (int i = 1; i<=5; i++) {
            NSString *normal = [NSString stringWithFormat:@"TabBar%d", i];
            NSString *selected = [normal stringByAppendingString:@"Sel"];
            [myTabBar addTabBarButton:normal selIcon:selected];
        }
    });
}

#pragma mark - tabbar代理方法
- (void)tabBar:(ILTabBar *)tabBar didSelectButtonFrom:(NSUInteger)from to:(NSUInteger)to
{
    // 1.根据位置选中某个控制器（这个是UITabBarController自带的API）
    self.selectedIndex = to;
//    self.selectedViewController = self.childViewControllers[to];
    
    UITableViewController *newVC = self.childViewControllers[to];
    // 2.将新控制器的navigationItem值转移给TabBarController
    [self.navigationItem copyFromItem:newVC.navigationItem];
}
@end