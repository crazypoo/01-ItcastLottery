//
//  ILAboutViewController.m
//  01-ItcastLottery
//
//  Created by apple on 13-12-24.
//  Copyright (c) 2013年 itcast. All rights reserved.
//

#import "ILAboutViewController.h"
#import "ILAboutHeaderView.h"

@interface ILAboutViewController ()

@end

@implementation ILAboutViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"关于";
    
    // 1.1 评分支持
    ILSettingArrowItem *mark = [ILSettingArrowItem itemWithTitle:@"评分支持"];
    
    // 1.2 客服电话
    ILSettingArrowItem *phone = [ILSettingArrowItem itemWithTitle:@"客服电话"];
    phone.subtitle = @"020-83568090";
    
    ILSettingGroup *group = [[ILSettingGroup alloc] init];
    group.items = @[mark, phone];
    [_allGroups addObject:group];
    
    // 2.设置表格的头部控件
    self.tableView.tableHeaderView = [ILAboutHeaderView headerView];
//    self.tableView.scrollEnabled = NO;
}

@end
