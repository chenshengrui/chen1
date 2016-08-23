//
//  CXButton.m
//  Block：处理butto事件
//
//  Created by tens04 on 16/8/23.
//  Copyright © 2016年 tens十安科技. All rights reserved.
//

#import "CXButton.h"

@interface CXButton () {
    
    HandleBlock _block;
}

@end


@implementation CXButton


-(void)buttonHandle:(HandleBlock)handle{
    
    _block = handle;
    [self addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    
}
//  判断block是否存在，存在就调用block
-(void)buttonAction{
    
    if (_block) {
        
        _block();
    }
}

@end