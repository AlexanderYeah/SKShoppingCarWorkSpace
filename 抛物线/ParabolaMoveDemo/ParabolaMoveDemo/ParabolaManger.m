//
//  ParabolaManger.m
//  ParabolaMoveDemo
//
//  Created by AY on 2018/1/12.
//  Copyright © 2018年 AY. All rights reserved.
//

#import "ParabolaManger.h"

static ParabolaManger *_mgr = nil;

@implementation ParabolaManger

+ (ParabolaManger *)shareManger
{

	if (!_mgr)
    {
        _mgr = [[[self class]alloc] init];
    }
	return _mgr;

}





#pragma mark -  抛物线动画
- (void)moveViewFrom:(CGPoint)startPoint to:(CGPoint)endPoint targetView:(UIView *)targetView
{

	self.showView = targetView;
	// 贝塞尔曲线
	UIBezierPath *path = [UIBezierPath bezierPath];
	// 移到开始的位置
	[path moveToPoint:CGPointMake(startPoint.x, startPoint.y)];
	// 二次贝塞尔曲线
	[path addQuadCurveToPoint:CGPointMake(endPoint.x+25, endPoint.y+25)controlPoint:CGPointMake(startPoint.x + 100, startPoint.y - 50)];
	
  	[self groupAnimation:path];

}

#pragma mark - 组合动画
- (void)groupAnimation:(UIBezierPath *)path{
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    animation.path = path.CGPath;
    animation.rotationMode = kCAAnimationRotateAuto;
    
    CABasicAnimation *alphaAnimation = [CABasicAnimation animationWithKeyPath:@"alpha"];
    alphaAnimation.duration = 0.8f;
    alphaAnimation.fromValue = [NSNumber numberWithFloat:1.0];
    alphaAnimation.toValue = [NSNumber numberWithFloat:0.1];
    alphaAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    
    CAAnimationGroup *groups = [CAAnimationGroup animation];
    groups.animations = @[animation,alphaAnimation];
    groups.duration = 0.6f;
    groups.removedOnCompletion = NO;
    groups.fillMode = kCAFillModeForwards;
    groups.delegate = self;
    [groups setValue:@"groupsAnimation" forKey:@"animationName"];
    [self.showView.layer addAnimation:groups forKey:@"position scale"];


}


@end
