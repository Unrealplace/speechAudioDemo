//
//  OLPlayBtn.m
//  SpeechAudioDemo_1
//
//  Created by LiYang on 16/11/30.
//  Copyright © 2016年 LiYang. All rights reserved.
//

#import "OLPlayBtn.h"
#import "UIColor+THAdditions.h"

@implementation OLPlayBtn

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupView];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        [self setupView];
    }
    return self;
}

- (void)setupView {
    self.backgroundColor = [UIColor clearColor];
    self.tintColor = [UIColor clearColor];
}

- (void)setHighlighted:(BOOL)highlighted {
    [super setHighlighted:highlighted];
    [self setNeedsDisplay];
}


- (void)drawRect:(CGRect)rect {
    
    //获取色彩空间
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    //获取绘图上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //设置边线颜色，渐变亮色以及渐变暗色。
    UIColor *strokeColor = [UIColor colorWithWhite:0.06 alpha:1.0f];
    UIColor *gradientLightColor = [UIColor colorWithRed:0.101 green:0.100 blue:0.103 alpha:1.000];
    UIColor *gradientDarkColor = [UIColor colorWithRed:0.237 green:0.242 blue:0.242 alpha:1.000];
    //高亮状态时候颜色改变
    if (self.highlighted) {
        gradientLightColor = [gradientLightColor darkerColor];
        gradientDarkColor = [gradientDarkColor darkerColor];
    }
    
    // 绘制渐变色的步骤
    NSArray *gradientColors = @[(id)gradientLightColor.CGColor, (id)gradientDarkColor.CGColor];
    CGFloat locations[] = {0, 1};
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)gradientColors, locations);
    
    
    
//********************************************************?///////////////

//    //根据一个矩形画曲线
//    
//    + (UIBezierPath *)bezierPathWithRect:(CGRect)rect
//
//    //根据矩形框的内切圆画曲线
//    
//    + (UIBezierPath *)bezierPathWithOvalInRect:(CGRect)rect
//    
//    
//    //根据矩形画带圆角的曲线
//    
//    + (UIBezierPath *)bezierPathWithRoundedRect:(CGRect)rect cornerRadius:(CGFloat)cornerRadius
//    
//    
//    //在矩形中，可以针对四角中的某个角加圆角
//    
//    + (UIBezierPath *)bezierPathWithRoundedRect:(CGRect)rect byRoundingCorners:(UIRectCorner)corners cornerRadii:(CGSize)cornerRadii
//    
//    参数：
//    
//corners:枚举值，可以选择某个角
//    
//cornerRadii:圆角的大小
//    
//    //以某个中心点画弧线
//    
//    + (UIBezierPath *)bezierPathWithArcCenter:(CGPoint)center radius:(CGFloat)radius startAngle:(CGFloat)startAngle endAngle:(CGFloat)endAngle clockwise:(BOOL)clockwise;
//    
//    参数：
//    
//center:弧线中心点的坐标
//    
//radius:弧线所在圆的半径
//    
//startAngle:弧线开始的角度值
//    
//endAngle:弧线结束的角度值
//    
//clockwise:是否顺时针画弧线
//    
//    
//    //画二元曲线，一般和moveToPoint配合使用
//    
//    - (void)addQuadCurveToPoint:(CGPoint)endPoint controlPoint:(CGPoint)controlPoint
//    
//    参数：
//    
//endPoint:曲线的终点
//    
//controlPoint:画曲线的基准点
    
//以三个点画一段曲线，一般和moveToPoint配合使用
//    
//    - (void)addCurveToPoint:(CGPoint)endPoint controlPoint1:(CGPoint)controlPoint1 controlPoint2:(CGPoint)controlPoint2
//    
//    参数：
//    
//endPoint:曲线的终点
//    
//controlPoint1:画曲线的第一个基准点
//    
//controlPoint2:画曲线的第二个基准点
    
    
//********************************************************?///////////////
    
    
    

    //在这个矩形框内绘制按钮
    CGRect insetRect = CGRectInset(rect, 2.0f, 2.0f);
    CGContextSetFillColorWithColor(context, strokeColor.CGColor);
    UIBezierPath *bezelPath = [UIBezierPath bezierPathWithRoundedRect:insetRect cornerRadius:6.0f];
    //和addline 类似的，添加路径到绘图上下文
    CGContextAddPath(context, bezelPath.CGPath);
    
//*******************************///////////////////
//    CGContextSetShadowWithColor(CGContextRef context, CGSize offset,CGFloat blur, CGColorRef color)
//    context表示要作画的内容
//    offset表示阴影的位置
//    blur表示阴影的模糊度
//    color表示图形要填充的颜色
//*******************************///////////////////

    CGContextSetShadowWithColor(context, CGSizeMake(0.0f, 0.5f), 2.0f, [UIColor darkGrayColor].CGColor);
    CGContextDrawPath(context, kCGPathFill);
    CGContextSaveGState(context);
    
    
//***********************************////////////////
//    //CGRectInset  将原来的矩形放大或者缩小，正表示缩小，－表示放大 上下各偏移一个大小。
//    CGRect rect= CGRectMake(20, 50, 100, 80);
//    CGRect rect1=CGRectInset(rect, -10, 20);
//    NSLog(@"%@",p(rect1));
//    //输出结果：2014-11-22 18:48:55.351 TestCGRectInset[8893:60b] {{10, 70}, {120, 40}}
//    
//    
//    //CGRectOffset 这个函数就是将原来矩形的坐标点变化一下，就是左上角点
//    CGRect rect= CGRectMake(20, 50, 100, 80);
//    CGRect rect1=CGRectOffset(rect, -10, 20);
//    NSLog(@"%@",p(rect1));
//    //输出结果：2014-11-22 18:51:58.217 TestCGRectInset[8913:60b] {{10, 70}, {100, 80}}
//    
//    //UIEdgeInsetsInsetRect 表示在原来的rect基础上根据边缘距离内切一个rect出来
//    CGRect rect= CGRectMake(20, 50, 100, 80);
//    UIEdgeInsets ed=UIEdgeInsetsMake(-3, -4, -5, -6);
//    CGRect  r=  UIEdgeInsetsInsetRect(rect, ed);
//    NSLog(@"%@",p(r));
////***********************************////////////////
    
    
    
    //绘制三角形后面的渐变颜色
    insetRect = CGRectInset(insetRect, 3.0f, 3.0f);
    UIBezierPath *buttonPath = [UIBezierPath bezierPathWithRoundedRect:insetRect cornerRadius:4.0f];
    CGContextAddPath(context, buttonPath.CGPath);
    //裁剪一下使绘图上下文在这个范围内
    CGContextClip(context);
    
    CGFloat midX = CGRectGetMidX(insetRect);
    
    CGPoint startPoint = CGPointMake(midX, CGRectGetMaxY(insetRect));
    CGPoint endPoint = CGPointMake(midX, CGRectGetMinY(insetRect));
    CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, 0);
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorSpace);
    CGContextRestoreGState(context);
    
    UIColor *fillColor = [UIColor colorWithWhite:0.9f alpha:1.0f];
    CGContextSetFillColorWithColor(context, fillColor.CGColor);
    CGContextSetStrokeColorWithColor(context, [fillColor darkerColor].CGColor);
    
    CGFloat iconDim = 24.0f;
    
    // 绘制播放的三角形（
    if (!self.selected) {
        CGContextSaveGState(context);
        
//        CGContextScaleCTM 缩放
//        CGContextRotateCTM 旋转
        //移动坐标系
        CGContextTranslateCTM(context, CGRectGetMidX(rect) - (iconDim - 3) / 2, CGRectGetMidY(rect) - iconDim / 2);
        CGContextMoveToPoint(context, 0.0f, 0.0f);
        CGContextAddLineToPoint(context, 0.0f, iconDim);
        CGContextAddLineToPoint(context, iconDim, iconDim / 2);
        CGContextClosePath(context);
        CGContextDrawPath(context, kCGPathFill);
        CGContextRestoreGState(context);
    }
    // 绘制暂停的图标
    else {
        CGContextSaveGState(context);
        CGFloat tx = (CGRectGetWidth(rect) - iconDim) / 2;
        CGFloat ty = (CGRectGetHeight(rect) - iconDim) / 2;
        CGContextTranslateCTM(context, tx, ty);
        CGRect stopRect = CGRectMake(0.0f, 0.0f, iconDim, iconDim);
        UIBezierPath *stopPath = [UIBezierPath bezierPathWithRoundedRect:stopRect cornerRadius:2.0f];
        CGContextAddPath(context, stopPath.CGPath);
        CGContextDrawPath(context, kCGPathFill);
        CGContextRestoreGState(context);
    }

}


@end
