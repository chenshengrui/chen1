//
//  ViewController.m
//  CAlayer:基本使用
//
//  Created by tens04 on 16/8/24.
//  Copyright © 2016年 tens十安科技. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(20, 80,200, 150)];
    view.backgroundColor = [UIColor redColor];
    
    
    view.layer.backgroundColor = [UIColor orangeColor].CGColor;
    view.layer.borderWidth = 3;   //设置边框
    view.layer.borderColor = [UIColor whiteColor].CGColor;// 设置边框颜色
    view.layer.cornerRadius =20;  // 设置圆角
    
    [self.view addSubview:view];
    
    //1、创建layer
    CALayer *layer = [[CALayer alloc]init];
    layer.frame = CGRectMake(10, 300, 350, 200);
    layer.backgroundColor = [UIColor blueColor].CGColor;
    
    // 2、将图层添加到父图层上
    [self.view.layer addSublayer:layer];
    
    // 3、填充图片、需要将UIImage 桥接到(__bridge)CGImage
    layer.contents = (__bridge id _Nullable)([UIImage imageNamed:@"image6.jpg"].CGImage);
    
    
    // 4、使用layer CATextLayer  子类填充文字
    CATextLayer *textLayer = [[CATextLayer alloc]init];
    textLayer.frame = CGRectMake(10, 550, 300, 30);
    textLayer.string = @"这是layer填充的文字内容";
    textLayer.foregroundColor = [UIColor blackColor].CGColor; // 设置前景颜色
    textLayer.backgroundColor = [UIColor redColor].CGColor;   // 设置背景颜色
    textLayer.fontSize = 20; // 设置字体大小
    textLayer.alignmentMode = @"center"; // 设置文字显示的位置
    textLayer.font = (__bridge CFTypeRef _Nullable)([UIFont systemFontOfSize:20 weight:500]); //
    
    [self.view.layer addSublayer:textLayer];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
