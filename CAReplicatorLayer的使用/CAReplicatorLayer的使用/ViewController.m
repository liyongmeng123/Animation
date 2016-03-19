//
//  ViewController.m
//  CAReplicatorLayer的使用
//
//  Created by 李勇猛 on 16/3/18.
//  Copyright © 2016年 李勇猛. All rights reserved.
//

#import "ViewController.h"
#import "CarView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self layer1];
    [self layer2];
    [self layer3];
    
    
    
}


- (void)layer1{

    CALayer * layer = [CALayer layer];
    layer.bounds = CGRectMake(0, 0, 30, 150);
    
    //设置矛点
    layer.anchorPoint = CGPointMake(0.5, 1);
    //设置原点
    layer.position = CGPointMake(15, self.lightView.frame.size.height);
    //设置layer的yanse
    layer.backgroundColor = [UIColor redColor].CGColor;
    //   [self.lightView.layer addSublayer:layer];
    
    CABasicAnimation * anim = [CABasicAnimation animationWithKeyPath:@"transform.scale.y"];
    
    anim.toValue = @0.3;
    
    anim.duration = 0.6;
    anim.repeatCount = MAXFLOAT;
    //设置动画翻转 就是到地下就开始升上来的效果
    anim.autoreverses = YES;
    
    [layer addAnimation:anim forKey:nil];
    
    
    //复制图层
    
    CAReplicatorLayer * repL = [CAReplicatorLayer layer];
    
    repL.frame = self.lightView.bounds;
    
    //设置要复制多少个
    repL.instanceCount = 5;
    
    // 设置复制子层偏移量，不包括原始层,相对于原始层x偏移
    repL.instanceTransform = CATransform3DMakeTranslation(45, 0, 0);
    
    //设置复制图层动画的延迟时间
    repL.instanceDelay = 0.5;
    
    // 如果设置了原始层背景色，就不需要设置这个属性
    repL.instanceColor = [UIColor greenColor].CGColor;
    
    repL.instanceGreenOffset = -0.3;
    
    [repL addSublayer:layer];
    
    [self.lightView.layer addSublayer:repL];

}

- (void)layer2{

    CALayer * layer = [CALayer layer];
    layer.bounds = CGRectMake(0, 0, 10, 10);
  //  layer.anchorPoint = CGPointMake(0.5, 1);
    layer.position = CGPointMake(self.SS.frame.size.width * 0.5, 20);
    layer.backgroundColor = [UIColor blackColor].CGColor;
    
    
    CAReplicatorLayer * repL = [CAReplicatorLayer layer];
    repL.frame = self.SS.bounds;
    CABasicAnimation * anim = [CABasicAnimation animation];
    anim.keyPath = @"transform.scale";
    
    anim.fromValue = @1;
    anim.toValue = @0;
   
    anim.repeatCount = MAXFLOAT;
    
    CGFloat duration = 1;
    anim.duration = duration;
    
    
    [layer addAnimation:anim forKey:nil];
    
    int count = 20;
    
    CGFloat angle = M_PI * 2 / count;
    
    // 设置子层总数
    repL.instanceCount = count;
    
    repL.instanceTransform = CATransform3DMakeRotation(angle, 0, 0, 1);
    
    repL.instanceDelay = duration / count;
    
   // [self.SS.layer addSublayer:repL];
    [repL addSublayer:layer];
    [self.SS.layer addSublayer:repL];
    
}

- (void)layer3{

    CAReplicatorLayer *layer = (CAReplicatorLayer *)_Req.layer;
    layer.instanceCount = 2;
    
    CATransform3D caTran;
    caTran = CATransform3DMakeTranslation(0, self.Req.frame.size.height, 0);
    caTran = CATransform3DRotate(caTran, M_PI, 1, 0, 0);
    
    layer.instanceTransform = caTran;
    
    

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
