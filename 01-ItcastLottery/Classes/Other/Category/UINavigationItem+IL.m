//
//  UINavigationItem+IL.m
//  01-ItcastLottery
//
//  Created by apple on 13-12-23.
//  Copyright (c) 2013年 itcast. All rights reserved.
//

#import "UINavigationItem+IL.h"

@implementation UINavigationItem (IL)
- (void)copyFromItem:(UINavigationItem *)other
{
    self.leftBarButtonItem = other.leftBarButtonItem;
    self.leftBarButtonItems = other.leftBarButtonItems;
    self.rightBarButtonItem = other.rightBarButtonItem;
    self.rightBarButtonItems = other.rightBarButtonItems;
    self.titleView = other.titleView;
    self.title = other.title;
}
@end
