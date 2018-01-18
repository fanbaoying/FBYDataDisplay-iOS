//
//  FBYLineGraphColorView.h
//  FBYDataDisplay-iOS
//
//  Created by fby on 2018/1/18.
//  Copyright © 2018年 FBYDataDisplay-iOS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FBYLineGraphColorView : UIView

/**
 *  颜色设置
 */
@property (nonatomic, assign) CGFloat borderWidth;
@property (nonatomic, assign) UIColor *borderColor;

- (instancetype)initWithCenter:(CGPoint)center radius:(CGFloat)radius;

@end
