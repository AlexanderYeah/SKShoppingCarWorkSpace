//
//  ParabolaManger.h
//  ParabolaMoveDemo
//
//  Created by AY on 2018/1/12.
//  Copyright © 2018年 AY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>
typedef void (^ParabolaBlock)();

@interface ParabolaManger : NSObject


@property (nonatomic,copy)ParabolaBlock paraBlock;

@property (nonatomic,strong)UIView *showView;

// 单例创建
+ (ParabolaManger *)shareManger;

// 抛物先动作
- (void)moveViewFrom:(CGPoint)startPoint to:(CGPoint)endPoint targetView:(UIView *)targetView;

@end
