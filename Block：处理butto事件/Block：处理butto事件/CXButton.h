//
//  CXButton.h
//  Block：处理butto事件
//
//  Created by tens04 on 16/8/23.
//  Copyright © 2016年 tens十安科技. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^HandleBlock)();


@interface CXButton : UIButton


-(void)buttonHandle:(HandleBlock)handle;
@end
