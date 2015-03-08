//
//  ILProduct.m
//  01-ItcastLottery
//
//  Created by apple on 13-12-24.
//  Copyright (c) 2013年 itcast. All rights reserved.
//

#import "ILProduct.h"

@implementation ILProduct
+ (id)productWithDict:(NSDictionary *)dict
{
    ILProduct *p = [[self alloc] init];
    p.title = dict[@"title"];
    p.icon = dict[@"icon"];
    return p;
}
@end
