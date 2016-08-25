//
//  ViewController.m
//  时钟
//
//  Created by tens04 on 16/8/24.
//  Copyright © 2016年 tens十安科技. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


#define CWidth   _clockLayer.bounds.size.width

#define perHourA 30      // 时针 1小时30度

#define perMintueA 6     //  分针 1分钟6度

#define perSecondA 6       // 秒针 1秒6度

#define perMinHourA 0.5      // 每分钟时针转（30 ／ 60）

#define angle2radion(angle) ((angle) / 180.0 *M_PI)

@property (nonatomic,strong) CALayer *clockLayer; // 表盘
@property (nonatomic,strong) CALayer *hourLayer;  //  时针
@property (nonatomic,strong) CALayer *minLayer;   //   分针
@property (nonatomic,strong) CALayer *secomdLayer; //   秒针

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self dial];
    [self hourHand];
    [self minuteHand];
    [self secondHand];
    [self changeTimer];
    // 时间定时器
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(changeTimer) userInfo:nil repeats:YES];
}

-(void)dial{
    
    _clockLayer = [CALayer layer];
    _clockLayer.bounds = CGRectMake(0, 0, 300, 300);
    _clockLayer.position = self.view.center;
    _clockLayer.contents = (__bridge id _Nullable)([UIImage imageNamed:@"dial"].CGImage);
    
    [self.view.layer addSublayer:self.clockLayer];
}
-(void)hourHand{
    
    _hourLayer = [CALayer layer];
    _hourLayer.bounds = CGRectMake(0, 0, 16, 60);
    _hourLayer.position = CGPointMake(CWidth / 2, CWidth / 2);
    _hourLayer.anchorPoint = CGPointMake(0.5, 1);
    _hourLayer.contents = (__bridge id _Nullable)([UIImage imageNamed:@"hourHand"].CGImage);
    
    [_clockLayer addSublayer:self.hourLayer];
}
-(void)minuteHand{
    
    _minLayer = [CALayer layer];
    _minLayer.bounds = CGRectMake(0, 0, 13, 80);
    _minLayer.position = CGPointMake(CWidth / 2, CWidth / 2);
    _minLayer.anchorPoint = CGPointMake(0.5, 1);
    _minLayer.contents =(__bridge id _Nullable)([UIImage imageNamed:@"minuteHand"].CGImage);
    
    [_clockLayer addSublayer:self.minLayer];
}
-(void)secondHand{
    _secomdLayer = [CALayer layer];
    _secomdLayer.bounds = CGRectMake(0, 0, 10, 90);
    _secomdLayer.position = CGPointMake(CWidth / 2, CWidth / 2);
    _secomdLayer.anchorPoint = CGPointMake(0.5, 1);
    _secomdLayer.contents =(__bridge id _Nullable)([UIImage imageNamed:@"secondHand"].CGImage);
    
    [_clockLayer addSublayer:self.secomdLayer];
    
}

-(void)changeTimer{
    
    // 获取当前系统时间
    NSCalendar *calender = [NSCalendar currentCalendar];
    
    NSDateComponents *cmp = [calender components:NSCalendarUnitSecond | NSCalendarUnitMinute | NSCalendarUnitHour  fromDate:[NSDate date]];
    CGFloat second = cmp.second;
    
    CGFloat secondA = (second *perSecondA);
    
    NSInteger minute = cmp.minute;
    
    CGFloat mintuteA = minute * perMintueA;
    NSInteger hour = cmp.hour;
    CGFloat hourA = hour *perHourA + minute * perMinHourA;
    
    _secomdLayer.transform = CATransform3DMakeRotation(angle2radion(secondA), 0, 0, 1);
    _minLayer.transform = CATransform3DMakeRotation(angle2radion(mintuteA), 0, 0, 1);
    _hourLayer.transform = CATransform3DMakeRotation(angle2radion(hourA), 0, 0, 1);
    

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
