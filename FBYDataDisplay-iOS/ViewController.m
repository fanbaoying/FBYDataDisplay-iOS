//
//  ViewController.m
//  FBYDataDisplay-iOS
//
//  Created by fby on 2018/1/18.
//  Copyright © 2018年 FBYDataDisplay-iOS. All rights reserved.
//

#import "ViewController.h"

#import "FBYLineGraphView.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    // 初始化折线图
    FBYLineGraphView *LineGraphView = [[FBYLineGraphView alloc] initWithFrame:CGRectMake(10, 100, SCREEN_WIDTH - 20, 220)];
    
    // 设置折线图属性
    
    LineGraphView.title = @"折线统计图"; // 折线图名称
    LineGraphView.maxValue = 100;   // 最大值
    LineGraphView.yMarkTitles = @[@"0",@"20",@"40",@"60",@"80",@"100"]; // Y轴刻度标签
    
    [LineGraphView setXMarkTitlesAndValues:@[@{@"item":@"1月1日",@"count":@10},@{@"item":@"1月2日",@"count":@80},@{@"item":@"1月3日",@"count":@68},@{@"item":@"1月4日",@"count":@100},@{@"item":@"1月5日",@"count":@60},@{@"item":@"1月6日",@"count":@56},@{@"item":@"1月7日",@"count":@11}] titleKey:@"item" valueKey:@"count"]; // X轴刻度标签及相应的值
    
//     LineGraphView.xScaleMarkLEN = 60;
    
    //设置完数据等属性后绘图折线图
    [LineGraphView mapping];
    
    [self.view addSubview:LineGraphView];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
