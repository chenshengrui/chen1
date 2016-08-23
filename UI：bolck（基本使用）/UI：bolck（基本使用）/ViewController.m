//
//  ViewController.m
//  UI：bolck（基本使用）
//
//  Created by tens04 on 16/8/23.
//  Copyright © 2016年 tens十安科技. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

// 使用typedof 定义block 类型： 定义一个名称为SumBlock 类型为void(^)(int, int)
typedef void(^SumBlock)(int a,int b);

@implementation ViewController


// C 语言
int function(int a,int b){
    
    return a + b;
}

- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    
    //   函数指针
    int (*p)(int,int) = function;
    
    NSLog(@" %d",p(10,20));
    
     // Bolck 基本定义
    // myBolck bolck 变量的名称：a、b，参数：^（int a, int b,）（return a + b) bolck 体
    
    int  (^myBolck)(int a, int b) = ^(int a, int b) {
        
        return a + b;
    };
    
    int sum = myBolck(10,20);
    
    NSLog(@"sum = %d",sum);
    
    // 没有返回值的bolck
    void(^vBolck)(int a) = ^(int a){
        
        NSLog(@"a = %d",a);
    };
    // 没有返回值，没有参数的Block
    
    void (^mBolck)() = ^{
        
        NSLog(@"");
        
    };
    
    mBolck();
    
    
    
    
    
    // bolck 作为函数、方法的参数
    
    int value = sumFunction(myBolck);
    int value_ = sumFunction(^int(int a,int b){
        
        return 100 + 200;
    });
    
    NSLog(@"value = %d",value_);
    
    
    // 调用带有bolck参数的方法
    [self sumMothod:^void (int a,int b){
        
        NSLog(@"a + b = %d",a + b);
        
    }];
    
    [self sum_Mothod:^(int a, int b){
        
        NSLog(@"a + b = %d",a + b);
    }];
    // 使用sumblock 类型定义block 变量
    SumBlock sBlock = ^(int a, int b){
        
        NSLog(@"%d",a + b);
    };
    
}
  // block 作为函数参数
int sumFunction(int (^sumBlock)(int a, int b)){
    
    return sumBlock(100,110);
    
}
// block 作为方法的参数
-(void)sumMothod:(void (^)(int a,int b))sumBlock{
    
    sumBlock(188,192);
    
}

    
-(void)sum_Mothod:(SumBlock)sumBlock{
    
    sumBlock(998,888);
    
}
    
    

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
