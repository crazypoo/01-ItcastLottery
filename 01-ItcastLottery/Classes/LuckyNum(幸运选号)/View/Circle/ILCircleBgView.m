//
//  ILCircleBgView.m
//  01-ItcastLottery
//
//  Created by apple on 13-12-27.
//  Copyright (c) 2013年 itcast. All rights reserved.
//

const int ILCircleWH = 286;

#import "ILCircleBgView.h"
#import "ILCircleItemView.h"

@interface ILCircleBgView()
{
//    ILCircleItemView *_selectedBtn;
}
@end

@implementation ILCircleBgView
#pragma mark - 生命周期方法
+ (instancetype)circleBgView
{
    return [[self alloc] init];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        
        // 添加所有的牌子按钮
        [self setupAllBtns];
    }
    return self;
}

#pragma mark 添加所有的牌子按钮
- (void)setupAllBtns
{
    for (int i = 0; i < 12; i++) {
        ILCircleItemView *btn = [ILCircleItemView buttonWithType:UIButtonTypeCustom];
        btn.tag = i;
        
        // 设置位置
        CGFloat posX = ILCircleWH * 0.5;
        CGFloat posY = posX;
        btn.layer.position = CGPointMake(posX, posY);
        // 旋转角度
        btn.transform = CGAffineTransformMakeRotation(M_PI / 6 * i);
        // 监听按钮点击
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
        [self addSubview:btn];
        // 第0个默认选中
        if (i == 0) {
            [self btnClick:btn];
        }
    }
}

- (void)setBg:(NSString *)normal selected:(NSString *)selected
{
    for (int i = 0; i<12; i++) {
        ILCircleItemView *btn = self.subviews[i];
        
        // 加载大图片
        UIImage *normalBig = [UIImage imageNamed:normal];
        
        // 裁剪小图片
        CGFloat miniW = normalBig.size.width / 12 * [UIScreen mainScreen].scale;
        CGFloat miniH = normalBig.size.height * [UIScreen mainScreen].scale;
        CGRect miniRect = CGRectMake(i * miniW, 0, miniW, miniH);
        
        CGImageRef miniNormalCG = CGImageCreateWithImageInRect(normalBig.CGImage, miniRect);
        [btn setImage:[UIImage imageWithCGImage:miniNormalCG] forState:UIControlStateNormal];
        
        UIImage *selectedBig = [UIImage imageNamed:selected];
        CGImageRef miniSelectedCG = CGImageCreateWithImageInRect(selectedBig.CGImage, miniRect);
        [btn setImage:[UIImage imageWithCGImage:miniSelectedCG] forState:UIControlStateSelected];
    }
}

- (void)btnClick:(ILCircleItemView *)btn
{
    _selectedBtn.selected = NO;
    btn.selected = YES;
    _selectedBtn = btn;
}

#pragma mark setFrame:和setBounds:能保证尺寸永远是286x286
- (void)setFrame:(CGRect)frame
{
    frame.size = CGSizeMake(ILCircleWH, ILCircleWH);
    [super setFrame:frame];
}

- (void)setBounds:(CGRect)bounds
{
    bounds.size = CGSizeMake(ILCircleWH, ILCircleWH);
    [super setBounds:bounds];
}

- (void)drawRect:(CGRect)rect
{
    // 1.画最底部的背景图
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // copy一个ctx对象到栈中
    CGContextSaveGState(ctx);
    
    // 2.绘图裁剪
    // 2.1.画圆
    CGFloat innerCircleXY = 9;
    CGFloat innerCircleWH = ILCircleWH - innerCircleXY * 2;
    CGRect innerCircleRect = CGRectMake(innerCircleXY, innerCircleXY, innerCircleWH, innerCircleWH);
    CGContextAddEllipseInRect(ctx, innerCircleRect);
    
    // 3.2.裁剪（CGContextClip会把之前所画的剪下来）
    CGContextClip(ctx);
    [[UIImage imageNamed:@"LuckyBaseBackground"] drawInRect:rect];
    
    CGContextRestoreGState(ctx);
    
    // 4.画中间的转盘图
    [[UIImage imageNamed:@"LuckyRotateWheel"] drawInRect:rect];
}

@end