//
//  CarView.m
//  CAReplicatorLayer的使用
//
//  Created by 李勇猛 on 16/3/19.
//  Copyright © 2016年 李勇猛. All rights reserved.
//

#import "CarView.h"

@implementation CarView


// 可以设置view的 主图层是什么图层
+ (Class)layerClass
{
    return [CAReplicatorLayer class];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/



@end
