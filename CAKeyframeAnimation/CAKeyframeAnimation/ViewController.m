//
//  ViewController.m
//  CAKeyframeAnimation
//
//  Created by tens04 on 16/8/26.
//  Copyright © 2016年 tens十安科技. All rights reserved.
//

#import "ViewController.h"


#define TXScreenWidth [UIScreen mainScreen].bounds.size.width
#define TXScreenHeight [UIScreen mainScreen].bounds.size.height

@interface ViewController (){
    
    CALayer *animationLayer;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    animationLayer = [CALayer layer];
    animationLayer.bounds = CGRectMake(0, 0, 150, 150);
    animationLayer.position = CGPointMake(TXScreenWidth / 2, 50);
    animationLayer.contents = (__bridge id _Nullable)(([UIImage imageNamed:@"飞机"].CGImage));
    
    [self.view.layer addSublayer:animationLayer];

}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [animationLayer addAnimation:[self KeyframeAnimation] forKey:@"keyAnimation"];
}

-(CAAnimation *)KeyframeAnimation{
    
    CAKeyframeAnimation *keyAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    keyAnimation.duration = 4;
    
    keyAnimation.repeatCount = HUGE_VALF;
    
    NSValue *point_1 = [NSValue valueWithCGPoint:CGPointMake(TXScreenWidth / 2, 0)];
    NSValue *point_2 = [NSValue valueWithCGPoint:CGPointMake(50, TXScreenHeight / 2)];
    NSValue *point_3 = [NSValue valueWithCGPoint:CGPointMake(TXScreenWidth / 2, TXScreenHeight - 50)];
    NSValue *point_4 = [NSValue valueWithCGPoint:CGPointMake(TXScreenWidth - 50, TXScreenHeight / 2)];
    NSValue *point_5 = [NSValue valueWithCGPoint:CGPointMake(TXScreenWidth / 2, 0)];
    
    // values:设置关键帧多个目标点
    
    keyAnimation.values = @[point_1,point_2,point_3,point_4,point_5];
    
     // 设置每一个桢所在的时间比例
    keyAnimation.keyTimes = @[@0,@0.2,@0.5,@0.7,@1.0];
    
    /* 插值计算模式：
     kCAAnimationLinear  关键帧之间进行插值计算（线性的）
     kCAAnimationDiscrete 关键帧之间不进行插值计算（离散的）
     kCAAnimationPaced 关键帧之间匀速切换，keyTimes\timingFunctions的设置将不起作用
     kCAAnimationCubic 关键帧进行圆滑曲线相连后插值计算
     kCAAnimationCubicPaced 匀速并且关键帧进行圆滑曲线相连后插值计算
     */

    
    keyAnimation.calculationMode = kCAAnimationCubicPaced;
    
    return keyAnimation;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
