//
//  RTChartDotView.m
//  LineView
//
//  Created by casa on 13-12-8.
//  Copyright (c) 2013年 casa. All rights reserved.
//

#import "RTChartDotView.h"

@interface RTChartDotView ()
@property (nonatomic, strong, readwrite) NSDictionary *info;
@end

@implementation RTChartDotView

#pragma mark - public method
- (void)configWithData:(NSDictionary *)data
{
    self.info = data;
    [self configDefaultParams];
    [self setNeedsDisplay];
}

#pragma mark - self method
- (void)configDefaultParams
{
    if (self.radius == 0) {
        self.radius = self.frame.size.height / 2.0f;
    }
    
    if (self.lineWidth == 0) {
        self.lineWidth = 2.0f;
    }
    
    if (self.lineColor == nil) {
        self.lineColor = [UIColor brownColor];
    }
    
    if (self.centerColor == nil) {
        self.centerColor = [UIColor whiteColor];
    }
}

- (void)drawRect:(CGRect)rect
{
    CGFloat PI = 3.14159265358979323846f;
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetLineWidth(context, self.lineWidth);
    CGContextSetStrokeColorWithColor(context, self.lineColor.CGColor);
    CGContextAddArc(context, self.frame.size.width/2.0f, self.frame.size.height/2.0f, self.radius-self.lineWidth, 0.0f, 2*PI, 0);
    CGContextStrokePath(context);
    
    CGContextSetFillColorWithColor(context, self.centerColor.CGColor);
    CGContextAddArc(context, self.frame.size.width/2.0f, self.frame.size.height/2.0f, self.radius-self.lineWidth, 0.0f, 2*PI, 0);
    CGContextFillPath(context);
}

@end