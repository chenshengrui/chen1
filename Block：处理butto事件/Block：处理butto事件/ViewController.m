//
//  ViewController.m
//  Block：处理butto事件
//
//  Created by tens04 on 16/8/23.
//  Copyright © 2016年 tens十安科技. All rights reserved.
//

#import "ViewController.h"
#import "CXButton.h"

@interface ViewController ()

@property (nonatomic,strong) CXButton *button;

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    
    [self.view addSubview:self.button];
}

-(CXButton *)button{
    
    if (!_button) {
        
        _button = [CXButton buttonWithType:UIButtonTypeCustom];
        _button.frame = CGRectMake(20, 100, 300, 50);
        _button.backgroundColor = [UIColor orangeColor];
      
        [_button buttonHandle:^{
            
            NSLog(@"按钮的处理事件");
        }];
    }
    
    return _button;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
