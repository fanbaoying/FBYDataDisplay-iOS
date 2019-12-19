//
//  ViewController.m
//  FBYDataDisplay-iOS
//
//  Created by fby on 2018/1/18.
//  Copyright © 2018年 FBYDataDisplay-iOS. All rights reserved.
//

#import "ViewController.h"

#import "FBYLineGraphView.h"
#import "FBYBarChartView.h"
#import "FBYRingChartView.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self lineGraphView];
    [self barChartView];
    [self ringChartView];
}

- (void)lineGraphView {
    // 初始化折线图
    FBYLineGraphView *LineGraphView = [[FBYLineGraphView alloc] initWithFrame:CGRectMake(10, 60, SCREEN_WIDTH - 20, 220)];
    
    // 设置折线图属性
    
    LineGraphView.title = @"折线统计图"; // 折线图名称
    LineGraphView.maxValue = 100;   // 最大值
    LineGraphView.yMarkTitles = @[@"0",@"20",@"40",@"60",@"80",@"100"]; // Y轴刻度标签
    
    [LineGraphView setXMarkTitlesAndValues:@[@{@"item":@"1月1日",@"count":@10},@{@"item":@"1月2日",@"count":@80},@{@"item":@"1月3日",@"count":@68},@{@"item":@"1月4日",@"count":@100},@{@"item":@"1月5日",@"count":@60},@{@"item":@"1月6日",@"count":@56},@{@"item":@"1月7日",@"count":@11}] titleKey:@"item" valueKey:@"count"]; // X轴刻度标签及相应的值
    
    //LineGraphView.xScaleMarkLEN = 60;
    
    //设置完数据等属性后绘图折线图
    [LineGraphView mapping];
    
    [self.view addSubview:LineGraphView];
}
// 柱状统计图
- (void)barChartView {
    
    UILabel *titleLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 295, CGRectGetWidth(self.view.frame), 20)];
    titleLab.text = @"柱状统计图";
    titleLab.font = [UIFont systemFontOfSize:15];
    titleLab.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:titleLab];
    
    ///渐变色
    NSArray *color1 = @[[self colorWithHexString:@"#07B2F6" alpha:1],[self colorWithHexString:@"#06A0DD" alpha:1]];
    NSArray *color2 = @[[self colorWithHexString:@"#2CCDCE" alpha:1],[self colorWithHexString:@"#27B8B9" alpha:1]];
    NSArray *color3 = @[[self colorWithHexString:@"#FCC627" alpha:1],[self colorWithHexString:@"#E2B123" alpha:1]];
    NSArray *color4 = @[[self colorWithHexString:@"#FF8E1F" alpha:1],[self colorWithHexString:@"#E6801B" alpha:1]];
    NSArray *color5 = @[[self colorWithHexString:@"#606AED" alpha:1],[self colorWithHexString:@"#565FD5" alpha:1]];
    NSArray *color6 = @[[self colorWithHexString:@"#FC5592" alpha:1],[self colorWithHexString:@"#E34C83" alpha:1]];
    
    
    FBYBarChartView *bar = [[FBYBarChartView alloc] initWithFrame:CGRectMake(10, 315, SCREEN_WIDTH - 20, 200) withMarkLabelCount:6 withOrientationType:OrientationVertical];
    [self.view addSubview:bar];
    bar.titleArray = @[@"一月",@"二月",@"三月",@"四月",@"五月",@"六月",@"七月",@"八月",@"九月",@"十月",@"十一月",@"十二月"];
    bar.valueArray = @[@"15",@"27",@"13",@"42",@"34",@"2",@"24",@"41",@"12",@"56",@"69",@"33"];
    bar.colorArray = @[color1,color2,color3,color4,color5,color6,color1,color2,color3,color4,color5,color6];
//            bar.singleColorArray = @[[UIColor redColor],[UIColor redColor],[UIColor redColor],[UIColor redColor],[UIColor redColor],[UIColor redColor],[UIColor redColor],[UIColor redColor],[UIColor redColor],[UIColor redColor],[UIColor redColor],[UIColor redColor]];
    bar.locations = @[@0.15,@0.85];
    bar.markTextColor = [UIColor blackColor];
    bar.markTextFont = [UIFont systemFontOfSize:14];
    bar.xlineColor = [self colorWithHexString:@"#4b4e52" alpha:1];
    ///不需要滑动可不设置
    bar.contentValue = 12 * 45;
    bar.barWidth = 25;
    bar.margin = 20;
    
    [bar drawChart];
}

// 环形统计图
- (void)ringChartView {
    
    UILabel *titleLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 530, CGRectGetWidth(self.view.frame), 20)];
    titleLab.text = @"环形统计图";
    titleLab.font = [UIFont systemFontOfSize:15];
    titleLab.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:titleLab];
    
    NSArray *colorArray = @[[self colorWithHexString:@"#007aff" alpha:1],
                            [self colorWithHexString:@"#3ed74d" alpha:1],
                            [self colorWithHexString:@"#ff9304" alpha:1],
                            [self colorWithHexString:@"#c22efb" alpha:1],
                            [self colorWithHexString:@"#93a8ff" alpha:1],
                            [self colorWithHexString:@"#fcd640" alpha:1]];
    
    NSArray *valueArray = @[@13,@30,@52,@73,@91,@34];
    NSArray *titleArray = @[@"一月",@"二月",@"三月",@"四月",@"五月",@"六月"];
    
    FBYRingChartView *ring = [[FBYRingChartView alloc] initWithFrame:CGRectMake(60, 560, SCREEN_WIDTH - 60, 200) markViewDirection:MarkViewDirectionRight];
    [self.view addSubview:ring];
    ring.colorArray = colorArray;
    ring.valueArray = valueArray;
    ring.titleArray = titleArray;
    ring.ringWidth = 20.0;
    ring.title = @"总计";
    [ring drawChart];
}

#pragma mark 设置16进制颜色
- (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha{
    //删除字符串中的空格
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    // String should be 6 or 8 characters
    if ([cString length] < 6)
    {
        return [UIColor clearColor];
    }
    // strip 0X if it appears
    //如果是0x开头的，那么截取字符串，字符串从索引为2的位置开始，一直到末尾
    if ([cString hasPrefix:@"0X"])
    {
        cString = [cString substringFromIndex:2];
    }
    //如果是#开头的，那么截取字符串，字符串从索引为1的位置开始，一直到末尾
    if ([cString hasPrefix:@"#"])
    {
        cString = [cString substringFromIndex:1];
    }
    if ([cString length] != 6)
    {
        return [UIColor clearColor];
    }
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    //r
    NSString *rString = [cString substringWithRange:range];
    //g
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    //b
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    return [UIColor colorWithRed:((float)r / 255.0f) green:((float)g / 255.0f) blue:((float)b / 255.0f) alpha:alpha];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
