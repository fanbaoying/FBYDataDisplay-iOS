//
//  FBYLineGraphColorView.m
//  FBYDataDisplay-iOS
//
//  Created by fby on 2018/1/18.
//  Copyright © 2018年 FBYDataDisplay-iOS. All rights reserved.
//

#import "FBYLineGraphColorView.h"

@implementation FBYLineGraphColorView

- (instancetype)initWithCenter:(CGPoint)center radius:(CGFloat)radius {
    
    self = [super init];
    
    if (self) {
        self.frame = CGRectMake(center.x - radius, center.y - radius, radius * 2.0, radius * 2.0);
        self.backgroundColor = [UIColor whiteColor];
        self.layer.cornerRadius = radius;
        self.layer.masksToBounds = YES;
    }
    return self;
}

- (void)setBorderWidth:(CGFloat)borderWidth {
    _borderWidth = borderWidth;
    self.layer.borderWidth = borderWidth;
}

- (void)setBorderColor:(UIColor *)borderColor {
    _borderColor = borderColor;
    self.layer.borderColor = borderColor.CGColor;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
