//
//  ILTabBar.h
//  01-ItcastLottery
//
//  Created by apple on 13-12-23.
//  Copyright (c) 2013年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ILTabBar;

@protocol ILTabBarDelegate <NSObject>

@optional
- (void)tabBar:(ILTabBar *)tabBar didSelectButtonFrom:(NSUInteger)from to:(NSUInteger)to;

@end

@interface ILTabBar : UIView
- (void)addTabBarButton:(NSString *)icon selIcon:(NSString *)selIcon;

@property (nonatomic, weak) id<ILTabBarDelegate> delegate;
@end
