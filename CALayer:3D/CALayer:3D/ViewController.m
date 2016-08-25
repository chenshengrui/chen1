//
//  ViewController.m
//  CALayer:3D
//
//  Created by tens04 on 16/8/24.
//  Copyright © 2016年 tens十安科技. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    
    CALayer *layer;
    UIView *view;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    layer = [[CALayer alloc]init];
    layer.bounds = CGRectMake(0, 0, 200, 200);
    layer.position = self.view.center;
    layer.backgroundColor = [UIColor lightGrayColor].CGColor;
    
    [self.view.layer addSublayer:layer];
    
}
    
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
        
       //1 、 通过函数设置transform
//   // layer.transform = CATransform3DTranslate(layer.transform, 0, 0, 100);  // 平移
//    
//    layer.transform = CATransform3DScale(layer.transform, 1.5, 1.5, 1); // 放大
//    
//    layer.transform = CATransform3DRotate(layer.transform, M_PI_4, 0, 0, 1); // 旋转 后面三个参数代表方向 只有0和1
//    
    //2、通过kvc 设置transform
    
    [layer setValue:@2 forKeyPath:@"transform.scale.x"];// 放大
    [layer setValue:@2 forKeyPath:@"transform.scale"];//   沿着x方向放大
    
    
    [layer setValue:@100 forKeyPath:@"transform.translation"];// 平移
    [layer setValue:@100 forKeyPath:@"transform.translation.x"];// 沿着x方向平移
    
    [layer setValue:@M_PI_4 forKeyPath:@"transform.rotation"];// 旋转
    [layer setValue:@M_PI_4 forKeyPath:@"transform.rotation.x"];// 沿着x方向旋转



}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
