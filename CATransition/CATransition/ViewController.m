//
//  ViewController.m
//  CATransition
//
//  Created by tens04 on 16/8/26.
//  Copyright © 2016年 tens十安科技. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    static int  index = 1;
    [self.imageView.layer addAnimation:[self transitionAnimation] forKey:nil];
    
    NSString *imageName = [NSString stringWithFormat:@"image0_%d.jpg",index];
    self.imageView.image = [UIImage imageNamed:imageName];
    
    index++;
    
    if (index > 10) {
        
        index = 0;
    }
}
- (CAAnimation *)transitionAnimation{
    
    CATransition *transitionAni = [CATransition animation];
    transitionAni.duration = 1.0;
    /*
     1. fade     淡出效果
     2. moveIn 进入效果
     3. push    推出效果
     4. reveal   移出效果
     
     // 未公开的
     5. cube   立方体翻转效果
     6. suckEffect  抽走效果
     7. rippleEffect 水波效果
     8. pageCurl    翻开页效果
     9. pageUnCurl 关闭页效果
     10. cameraIrisHollowOpen  相机镜头打开效果
     11.  cameraIrisHollowClose  相机镜头关闭效果
     */
    transitionAni.type = kCATransitionPush;
    
    // 转场的方向：`fromLeft 左', `fromRight 右', `fromTop 上'  `fromBottom 下'
    transitionAni.subtype = @"fromRight";
    
    // 开始转场和结束转场的进度位置 范围0～1;
    
    transitionAni.startProgress = 0.5; // 开始位置
    transitionAni.endProgress = 1;      //   结束位置
    
    return transitionAni;
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
