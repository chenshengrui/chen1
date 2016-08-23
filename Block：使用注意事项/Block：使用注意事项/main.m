//
//  main.m
//  Block：使用注意事项
//
//  Created by tens04 on 16/8/23.
//  Copyright © 2016年 tens十安科技. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
    
        int value = 3;
        
        int  (^block)(int x, int y) = ^(int x,int y){
            
            return (x +y) * value;
        };
        NSLog(@"%d",block(2,3));
        
        //
        __block int number = 3;
        void (^numBlock)() = ^{
            
            number = 5;
        };
        
        numBlock();
        
        
        // Block内使用局部变量时会对局部变量进行一份拷贝，也就是说block中使用的局部变量和外面的变量已经不是同一个了
        int a = 100;
        void(^aBlock)() = ^{
            
            NSLog(@"a = %d",a);
        };
        
        a = 200;
        aBlock();
        
        NSLog(@"a = %d",a);
        
        // 使用__block修饰后就不在进行拷贝，内部变量和外部变量都是同一个
        __block int n = 100;
        void(^nBlock)() = ^{
            
            NSLog(@"n = %d",n);
        };
        n = 200;
        nBlock();
        
        NSLog(@"n = %d",n);
    }
    return 0;
}
