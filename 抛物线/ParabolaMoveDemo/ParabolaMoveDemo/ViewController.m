//
//  ViewController.m
//  ParabolaMoveDemo
//
//  Created by AY on 2018/1/12.
//  Copyright © 2018年 AY. All rights reserved.
//

#import "ViewController.h"
#import "ParabolaManger.h"
@interface ViewController ()

@property (nonatomic,strong)UIView *showView;

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	
	UIView *view = [[UIView alloc]initWithFrame:CGRectMake(100, 300, 50, 50)];
	_showView = view;
	view.backgroundColor = [UIColor redColor];
	[self.view addSubview:view];
	

	
	
	
	
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
	
	[[ParabolaManger shareManger]moveViewFrom:CGPointMake(100, 300) to:CGPointMake(300, 500) targetView:_showView];

}


- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}


@end
