//
//  ViewController.m
//  CABasicAnimation
//
//  Created by tens04 on 16/8/26.
//  Copyright © 2016年 tens十安科技. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    
    CALayer *animationLayer;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    animationLayer = [CALayer layer];
    animationLayer.frame = CGRectMake(100, 50, 100, 100);
    animationLayer.contents = (__bridge id _Nullable)([UIImage imageNamed:@"飞机"].CGImage);
    
    [self.view.layer addSublayer:animationLayer];
    
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    // 给layer 添加动画
    [animationLayer addAnimation:[self positionAnimation] forKey:@"position"];
    [animationLayer addAnimation:[self rotationAnimation] forKey:@"rotation"];
   // [animationLayer addAnimation:[self positionAnimation] forKey:@"bounds"];
    //[animationLayer addAnimation:[self positionAnimation] forKey:@"scale"];
}

- (CAAnimation *)positionAnimation {
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
    animation.fromValue = [NSValue valueWithCGPoint:CGPointMake(150, 550)];
    animation.duration = 2.0;
    
    
    animation.fillMode = kCAFillModeBackwards;
    animation.removedOnCompletion = NO;
    animation.autoreverses = YES;
    animation.repeatCount = HUGE_VALF; // 表示最大浮点数，表示无限次重复
    
    /*动画的线性变换(动画速度变化)
    kCAMediaTimingFunctionLinear 匀速
    kCAMediaTimingFunctionEaseIn 加速
    kCAMediaTimingFunctionEaseOut 减速
    kCAMediaTimingFunctionEaseInEaseOut 缓慢进入缓慢出去
    kCAMediaTimingFunctionDefault 默认
    */

    
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    
    return animation;
}

-(CAAnimation *)rotationAnimation{
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    animation.byValue = @( -2 * M_PI); // 负数为逆时针旋转，正数为正时针旋转
    
    animation.duration = 2.0;
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = NO;
    animation.autoreverses = YES;
    animation.repeatCount = HUGE_VALF;
    
    return animation;

}

- (CAAnimation *)boundsAnimation {
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"bounds"];
    animation.fromValue = [NSValue valueWithCGRect:CGRectMake(0, 0, 100, 100)];
    animation.toValue = [NSValue valueWithCGRect:CGRectMake(0, 0, 300, 300)];
    
    animation.duration = 2.0;
    
    return animation;
}

- (CAAnimation *)scaleAnimation {
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    
    // 1、初始值
    animation.fromValue = @1.0;
    // 2、目标值
    animation.toValue = @2.0;
    
    // 3、变化的值， fromValue ~ toValue 值的变化量  负数为逆时针旋转，正数为正时针旋转
    // animation.byValue = @1.0;
    
    // 4、动画时间
    animation.duration = 2.0;
    
    /* 5、动画的填充模式：
     kCAFillModeForwards
     kCAFillModeBackwards
     kCAFillModeBoth
     kCAFillModeRemoved
     */
    animation.fillMode = kCAFillModeForwards;
    
    // 6、动画后是否移除动画后的状态(回到原始状态)，默认是YES, 前提是要设置fillModle为：kCAFillModeForwards
    animation.removedOnCompletion = NO;
    
    // 7、是否有回复效果
    animation.autoreverses = YES;
    
    // 8、设置动画重复次数
    animation.repeatCount = HUGE_VALF; //  HUGE_VALF 最大浮点数，表示无限次重复
    
    // 9、播放动画的速度
    animation.speed = 2;
    
    return animation;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
