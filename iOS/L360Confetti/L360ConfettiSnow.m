//
//  L360ConfettiSnow.m
//  L360ConfettiExample
//
//  Created by Joshua Archer on 3/30/17.
//  Copyright © 2017 Life360. All rights reserved.
//

#import "L360ConfettiSnow.h"

CGFloat const snowHeight = 15.39;
CGFloat const snowWidth = 17.93;

@interface L360ConfettiSnow ()

@property (nonatomic, assign) CGFloat flutterSpeed;
@property (nonatomic, assign) L360ConfettiFlutterType flutterType;
@property (nonatomic, assign) BOOL animationAdded;
@property (nonatomic, strong) UIColor *snowColor;

@end

@implementation L360ConfettiSnow

- (instancetype _Nonnull)initWithStartingPoint:(CGPoint)point
                                 confettiColor:(UIColor * _Nullable)color
                              withFlutterSpeed:(CGFloat)flutterSpeed
                                   flutterType:(L360ConfettiFlutterType)flutterType
{
    CGRect layerFrame = CGRectMake(point.x, point.y, snowWidth, snowHeight);
    self = [super initWithFrame:layerFrame];
    if (self) {
        self.flutterSpeed = flutterSpeed;
        self.flutterType = flutterType;
        self.animationAdded = NO;
        self.backgroundColor = [UIColor clearColor];
        self.snowColor = color;
    }
    return self;
}

- (void)didMoveToSuperview
{
    // No need to add the animation more than once
    if (self.animationAdded) {
        return;
    }
    [self setNeedsDisplay];

    self.animationAdded = YES;

    CABasicAnimation *rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform"];

    rotationAnimation.duration = 1.0 / self.flutterSpeed;
    rotationAnimation.repeatCount = 500;

    CATransform3D rotationTransform;

    switch (self.flutterType) {
        default:
        case L360ConfettiFlutterTypeDiagonal1:
            rotationTransform = CATransform3DMakeRotation(M_PI, -1.0, 1.0, 0.0);
            break;

        case L360ConfettiFlutterTypeDiagonal2:
            rotationTransform = CATransform3DMakeRotation(M_PI, 1.0, 1.0, 0.0);
            break;

        case L360ConfettiFlutterTypeVertical:
            rotationTransform = CATransform3DMakeRotation(M_PI, 0.0, 1.0, 0.0);
            break;

        case L360ConfettiFlutterTypeHorizontal:
            rotationTransform = CATransform3DMakeRotation(M_PI, 1.0, 0.0, 0.0);
            break;
    }

    // set the animation's "toValue" which MUST be wrapped in an NSValue instance (except special cases such as colors)
    rotationAnimation.toValue = [NSValue valueWithCATransform3D:rotationTransform];

    // finally, apply the animation
    [self.layer addAnimation:rotationAnimation forKey:@"L360ConfettiRotationAnimation"];
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    CGContextBeginPath(currentContext);

    UIColor *fillColor = [UIColor colorWithRed:0.63 green:0.88 blue:0.95 alpha:1.0];

    UIBezierPath* bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint: CGPointMake(17.56, 7.14)];
    [bezierPath addLineToPoint: CGPointMake(16.03, 7.14)];
    [bezierPath addLineToPoint: CGPointMake(16.45, 6.43)];
    [bezierPath addCurveToPoint: CGPointMake(16.32, 5.93) controlPoint1: CGPointMake(16.55, 6.26) controlPoint2: CGPointMake(16.49, 6.03)];
    [bezierPath addCurveToPoint: CGPointMake(15.81, 6.07) controlPoint1: CGPointMake(16.14, 5.83) controlPoint2: CGPointMake(15.91, 5.89)];
    [bezierPath addLineToPoint: CGPointMake(15.18, 7.14)];
    [bezierPath addLineToPoint: CGPointMake(14.14, 7.14)];
    [bezierPath addLineToPoint: CGPointMake(15.38, 5.03)];
    [bezierPath addCurveToPoint: CGPointMake(15.25, 4.53) controlPoint1: CGPointMake(15.49, 4.85) controlPoint2: CGPointMake(15.42, 4.63)];
    [bezierPath addCurveToPoint: CGPointMake(14.74, 4.66) controlPoint1: CGPointMake(15.07, 4.43) controlPoint2: CGPointMake(14.84, 4.49)];
    [bezierPath addLineToPoint: CGPointMake(13.29, 7.14)];
    [bezierPath addLineToPoint: CGPointMake(12.29, 7.14)];
    [bezierPath addCurveToPoint: CGPointMake(10.94, 4.87) controlPoint1: CGPointMake(12.18, 6.21) controlPoint2: CGPointMake(11.68, 5.4)];
    [bezierPath addLineToPoint: CGPointMake(11.45, 4.01)];
    [bezierPath addLineToPoint: CGPointMake(14.36, 4.01)];
    [bezierPath addCurveToPoint: CGPointMake(14.73, 3.64) controlPoint1: CGPointMake(14.57, 4.01) controlPoint2: CGPointMake(14.73, 3.84)];
    [bezierPath addCurveToPoint: CGPointMake(14.36, 3.28) controlPoint1: CGPointMake(14.73, 3.44) controlPoint2: CGPointMake(14.57, 3.28)];
    [bezierPath addLineToPoint: CGPointMake(11.88, 3.28)];
    [bezierPath addLineToPoint: CGPointMake(12.4, 2.39)];
    [bezierPath addLineToPoint: CGPointMake(13.66, 2.4)];
    [bezierPath addLineToPoint: CGPointMake(13.66, 2.4)];
    [bezierPath addCurveToPoint: CGPointMake(14.03, 2.03) controlPoint1: CGPointMake(13.86, 2.4) controlPoint2: CGPointMake(14.03, 2.23)];
    [bezierPath addCurveToPoint: CGPointMake(13.66, 1.67) controlPoint1: CGPointMake(14.03, 1.83) controlPoint2: CGPointMake(13.87, 1.67)];
    [bezierPath addLineToPoint: CGPointMake(12.83, 1.66)];
    [bezierPath addLineToPoint: CGPointMake(13.59, 0.36)];
    [bezierPath addCurveToPoint: CGPointMake(13.45, -0.14) controlPoint1: CGPointMake(13.69, 0.19) controlPoint2: CGPointMake(13.63, -0.04)];
    [bezierPath addCurveToPoint: CGPointMake(12.95, -0) controlPoint1: CGPointMake(13.28, -0.24) controlPoint2: CGPointMake(13.05, -0.18)];
    [bezierPath addLineToPoint: CGPointMake(12.18, 1.3)];
    [bezierPath addLineToPoint: CGPointMake(11.76, 0.59)];
    [bezierPath addCurveToPoint: CGPointMake(11.26, 0.45) controlPoint1: CGPointMake(11.66, 0.41) controlPoint2: CGPointMake(11.43, 0.35)];
    [bezierPath addCurveToPoint: CGPointMake(11.12, 0.95) controlPoint1: CGPointMake(11.08, 0.56) controlPoint2: CGPointMake(11.02, 0.78)];
    [bezierPath addLineToPoint: CGPointMake(11.75, 2.03)];
    [bezierPath addLineToPoint: CGPointMake(11.23, 2.91)];
    [bezierPath addLineToPoint: CGPointMake(9.99, 0.8)];
    [bezierPath addCurveToPoint: CGPointMake(9.49, 0.66) controlPoint1: CGPointMake(9.89, 0.62) controlPoint2: CGPointMake(9.66, 0.56)];
    [bezierPath addCurveToPoint: CGPointMake(9.35, 1.16) controlPoint1: CGPointMake(9.31, 0.76) controlPoint2: CGPointMake(9.25, 0.99)];
    [bezierPath addLineToPoint: CGPointMake(10.81, 3.64)];
    [bezierPath addLineToPoint: CGPointMake(10.3, 4.5)];
    [bezierPath addCurveToPoint: CGPointMake(8.97, 4.22) controlPoint1: CGPointMake(9.9, 4.32) controlPoint2: CGPointMake(9.44, 4.22)];
    [bezierPath addCurveToPoint: CGPointMake(7.63, 4.5) controlPoint1: CGPointMake(8.49, 4.22) controlPoint2: CGPointMake(8.04, 4.32)];
    [bezierPath addLineToPoint: CGPointMake(7.13, 3.64)];
    [bezierPath addLineToPoint: CGPointMake(8.58, 1.16)];
    [bezierPath addCurveToPoint: CGPointMake(8.45, 0.66) controlPoint1: CGPointMake(8.69, 0.99) controlPoint2: CGPointMake(8.63, 0.76)];
    [bezierPath addCurveToPoint: CGPointMake(7.94, 0.8) controlPoint1: CGPointMake(8.27, 0.56) controlPoint2: CGPointMake(8.04, 0.62)];
    [bezierPath addLineToPoint: CGPointMake(6.7, 2.91)];
    [bezierPath addLineToPoint: CGPointMake(6.18, 2.03)];
    [bezierPath addLineToPoint: CGPointMake(6.81, 0.95)];
    [bezierPath addCurveToPoint: CGPointMake(6.68, 0.45) controlPoint1: CGPointMake(6.92, 0.78) controlPoint2: CGPointMake(6.86, 0.55)];
    [bezierPath addCurveToPoint: CGPointMake(6.17, 0.59) controlPoint1: CGPointMake(6.5, 0.35) controlPoint2: CGPointMake(6.27, 0.41)];
    [bezierPath addLineToPoint: CGPointMake(5.76, 1.3)];
    [bezierPath addLineToPoint: CGPointMake(4.99, -0)];
    [bezierPath addCurveToPoint: CGPointMake(4.48, -0.14) controlPoint1: CGPointMake(4.89, -0.18) controlPoint2: CGPointMake(4.66, -0.24)];
    [bezierPath addCurveToPoint: CGPointMake(4.35, 0.36) controlPoint1: CGPointMake(4.31, -0.04) controlPoint2: CGPointMake(4.24, 0.19)];
    [bezierPath addLineToPoint: CGPointMake(5.11, 1.66)];
    [bezierPath addLineToPoint: CGPointMake(4.28, 1.66)];
    [bezierPath addCurveToPoint: CGPointMake(3.91, 2.03) controlPoint1: CGPointMake(4.07, 1.66) controlPoint2: CGPointMake(3.91, 1.83)];
    [bezierPath addCurveToPoint: CGPointMake(4.28, 2.39) controlPoint1: CGPointMake(3.91, 2.23) controlPoint2: CGPointMake(4.07, 2.39)];
    [bezierPath addLineToPoint: CGPointMake(5.54, 2.39)];
    [bezierPath addLineToPoint: CGPointMake(6.06, 3.28)];
    [bezierPath addLineToPoint: CGPointMake(3.57, 3.28)];
    [bezierPath addCurveToPoint: CGPointMake(3.2, 3.64) controlPoint1: CGPointMake(3.37, 3.28) controlPoint2: CGPointMake(3.2, 3.44)];
    [bezierPath addCurveToPoint: CGPointMake(3.57, 4.01) controlPoint1: CGPointMake(3.2, 3.84) controlPoint2: CGPointMake(3.37, 4.01)];
    [bezierPath addLineToPoint: CGPointMake(6.49, 4.01)];
    [bezierPath addLineToPoint: CGPointMake(6.99, 4.87)];
    [bezierPath addCurveToPoint: CGPointMake(5.65, 7.14) controlPoint1: CGPointMake(6.26, 5.4) controlPoint2: CGPointMake(5.75, 6.21)];
    [bezierPath addLineToPoint: CGPointMake(4.65, 7.14)];
    [bezierPath addLineToPoint: CGPointMake(3.19, 4.66)];
    [bezierPath addCurveToPoint: CGPointMake(2.68, 4.53) controlPoint1: CGPointMake(3.09, 4.49) controlPoint2: CGPointMake(2.86, 4.43)];
    [bezierPath addCurveToPoint: CGPointMake(2.55, 5.03) controlPoint1: CGPointMake(2.51, 4.63) controlPoint2: CGPointMake(2.45, 4.85)];
    [bezierPath addLineToPoint: CGPointMake(3.79, 7.14)];
    [bezierPath addLineToPoint: CGPointMake(2.75, 7.14)];
    [bezierPath addLineToPoint: CGPointMake(2.12, 6.07)];
    [bezierPath addCurveToPoint: CGPointMake(1.62, 5.94) controlPoint1: CGPointMake(2.02, 5.89) controlPoint2: CGPointMake(1.79, 5.83)];
    [bezierPath addCurveToPoint: CGPointMake(1.48, 6.43) controlPoint1: CGPointMake(1.44, 6.04) controlPoint2: CGPointMake(1.38, 6.26)];
    [bezierPath addLineToPoint: CGPointMake(1.9, 7.14)];
    [bezierPath addLineToPoint: CGPointMake(0.37, 7.14)];
    [bezierPath addCurveToPoint: CGPointMake(0, 7.51) controlPoint1: CGPointMake(0.17, 7.14) controlPoint2: CGPointMake(0, 7.31)];
    [bezierPath addCurveToPoint: CGPointMake(0.37, 7.87) controlPoint1: CGPointMake(0, 7.71) controlPoint2: CGPointMake(0.17, 7.87)];
    [bezierPath addLineToPoint: CGPointMake(1.9, 7.87)];
    [bezierPath addLineToPoint: CGPointMake(1.48, 8.59)];
    [bezierPath addCurveToPoint: CGPointMake(1.62, 9.08) controlPoint1: CGPointMake(1.38, 8.76) controlPoint2: CGPointMake(1.44, 8.98)];
    [bezierPath addCurveToPoint: CGPointMake(1.8, 9.13) controlPoint1: CGPointMake(1.67, 9.12) controlPoint2: CGPointMake(1.74, 9.13)];
    [bezierPath addCurveToPoint: CGPointMake(2.12, 8.95) controlPoint1: CGPointMake(1.93, 9.13) controlPoint2: CGPointMake(2.05, 9.07)];
    [bezierPath addLineToPoint: CGPointMake(2.75, 7.87)];
    [bezierPath addLineToPoint: CGPointMake(3.79, 7.87)];
    [bezierPath addLineToPoint: CGPointMake(2.55, 9.99)];
    [bezierPath addCurveToPoint: CGPointMake(2.68, 10.49) controlPoint1: CGPointMake(2.45, 10.17) controlPoint2: CGPointMake(2.51, 10.39)];
    [bezierPath addCurveToPoint: CGPointMake(2.87, 10.54) controlPoint1: CGPointMake(2.74, 10.52) controlPoint2: CGPointMake(2.81, 10.54)];
    [bezierPath addCurveToPoint: CGPointMake(3.19, 10.36) controlPoint1: CGPointMake(3, 10.54) controlPoint2: CGPointMake(3.12, 10.47)];
    [bezierPath addLineToPoint: CGPointMake(4.65, 7.87)];
    [bezierPath addLineToPoint: CGPointMake(5.65, 7.87)];
    [bezierPath addCurveToPoint: CGPointMake(6.99, 10.15) controlPoint1: CGPointMake(5.75, 8.81) controlPoint2: CGPointMake(6.26, 9.62)];
    [bezierPath addLineToPoint: CGPointMake(6.49, 11.01)];
    [bezierPath addLineToPoint: CGPointMake(3.57, 11.01)];
    [bezierPath addCurveToPoint: CGPointMake(3.2, 11.38) controlPoint1: CGPointMake(3.37, 11.01) controlPoint2: CGPointMake(3.2, 11.17)];
    [bezierPath addCurveToPoint: CGPointMake(3.57, 11.74) controlPoint1: CGPointMake(3.2, 11.58) controlPoint2: CGPointMake(3.37, 11.74)];
    [bezierPath addLineToPoint: CGPointMake(6.06, 11.74)];
    [bezierPath addLineToPoint: CGPointMake(5.54, 12.63)];
    [bezierPath addLineToPoint: CGPointMake(4.28, 12.63)];
    [bezierPath addCurveToPoint: CGPointMake(3.9, 12.99) controlPoint1: CGPointMake(4.07, 12.63) controlPoint2: CGPointMake(3.9, 12.79)];
    [bezierPath addCurveToPoint: CGPointMake(4.28, 13.36) controlPoint1: CGPointMake(3.9, 13.19) controlPoint2: CGPointMake(4.07, 13.36)];
    [bezierPath addLineToPoint: CGPointMake(5.11, 13.36)];
    [bezierPath addLineToPoint: CGPointMake(4.35, 14.66)];
    [bezierPath addCurveToPoint: CGPointMake(4.48, 15.15) controlPoint1: CGPointMake(4.24, 14.83) controlPoint2: CGPointMake(4.31, 15.05)];
    [bezierPath addCurveToPoint: CGPointMake(4.67, 15.2) controlPoint1: CGPointMake(4.54, 15.19) controlPoint2: CGPointMake(4.6, 15.2)];
    [bezierPath addCurveToPoint: CGPointMake(4.99, 15.02) controlPoint1: CGPointMake(4.8, 15.2) controlPoint2: CGPointMake(4.92, 15.14)];
    [bezierPath addLineToPoint: CGPointMake(5.75, 13.72)];
    [bezierPath addLineToPoint: CGPointMake(6.17, 14.43)];
    [bezierPath addCurveToPoint: CGPointMake(6.49, 14.62) controlPoint1: CGPointMake(6.24, 14.55) controlPoint2: CGPointMake(6.36, 14.62)];
    [bezierPath addCurveToPoint: CGPointMake(6.68, 14.57) controlPoint1: CGPointMake(6.56, 14.62) controlPoint2: CGPointMake(6.62, 14.6)];
    [bezierPath addCurveToPoint: CGPointMake(6.81, 14.07) controlPoint1: CGPointMake(6.86, 14.46) controlPoint2: CGPointMake(6.92, 14.24)];
    [bezierPath addLineToPoint: CGPointMake(6.18, 12.99)];
    [bezierPath addLineToPoint: CGPointMake(6.7, 12.1)];
    [bezierPath addLineToPoint: CGPointMake(7.94, 14.22)];
    [bezierPath addCurveToPoint: CGPointMake(8.26, 14.41) controlPoint1: CGPointMake(8.01, 14.34) controlPoint2: CGPointMake(8.14, 14.41)];
    [bezierPath addCurveToPoint: CGPointMake(8.45, 14.36) controlPoint1: CGPointMake(8.33, 14.41) controlPoint2: CGPointMake(8.39, 14.39)];
    [bezierPath addCurveToPoint: CGPointMake(8.59, 13.86) controlPoint1: CGPointMake(8.63, 14.26) controlPoint2: CGPointMake(8.69, 14.03)];
    [bezierPath addLineToPoint: CGPointMake(7.13, 11.37)];
    [bezierPath addLineToPoint: CGPointMake(7.63, 10.52)];
    [bezierPath addCurveToPoint: CGPointMake(8.97, 10.8) controlPoint1: CGPointMake(8.04, 10.7) controlPoint2: CGPointMake(8.49, 10.8)];
    [bezierPath addCurveToPoint: CGPointMake(10.31, 10.52) controlPoint1: CGPointMake(9.44, 10.8) controlPoint2: CGPointMake(9.89, 10.7)];
    [bezierPath addLineToPoint: CGPointMake(10.81, 11.37)];
    [bezierPath addLineToPoint: CGPointMake(9.35, 13.86)];
    [bezierPath addCurveToPoint: CGPointMake(9.49, 14.36) controlPoint1: CGPointMake(9.25, 14.03) controlPoint2: CGPointMake(9.31, 14.26)];
    [bezierPath addCurveToPoint: CGPointMake(9.67, 14.41) controlPoint1: CGPointMake(9.54, 14.39) controlPoint2: CGPointMake(9.61, 14.41)];
    [bezierPath addCurveToPoint: CGPointMake(9.99, 14.22) controlPoint1: CGPointMake(9.8, 14.41) controlPoint2: CGPointMake(9.92, 14.34)];
    [bezierPath addLineToPoint: CGPointMake(11.23, 12.1)];
    [bezierPath addLineToPoint: CGPointMake(11.76, 12.99)];
    [bezierPath addLineToPoint: CGPointMake(11.12, 14.07)];
    [bezierPath addCurveToPoint: CGPointMake(11.26, 14.56) controlPoint1: CGPointMake(11.02, 14.24) controlPoint2: CGPointMake(11.08, 14.46)];
    [bezierPath addCurveToPoint: CGPointMake(11.44, 14.61) controlPoint1: CGPointMake(11.32, 14.6) controlPoint2: CGPointMake(11.38, 14.61)];
    [bezierPath addCurveToPoint: CGPointMake(11.77, 14.43) controlPoint1: CGPointMake(11.57, 14.61) controlPoint2: CGPointMake(11.7, 14.55)];
    [bezierPath addLineToPoint: CGPointMake(12.18, 13.72)];
    [bezierPath addLineToPoint: CGPointMake(12.95, 15.02)];
    [bezierPath addCurveToPoint: CGPointMake(13.27, 15.21) controlPoint1: CGPointMake(13.02, 15.14) controlPoint2: CGPointMake(13.14, 15.21)];
    [bezierPath addCurveToPoint: CGPointMake(13.45, 15.16) controlPoint1: CGPointMake(13.33, 15.21) controlPoint2: CGPointMake(13.39, 15.19)];
    [bezierPath addCurveToPoint: CGPointMake(13.59, 14.66) controlPoint1: CGPointMake(13.63, 15.05) controlPoint2: CGPointMake(13.69, 14.83)];
    [bezierPath addLineToPoint: CGPointMake(12.82, 13.36)];
    [bezierPath addLineToPoint: CGPointMake(13.66, 13.36)];
    [bezierPath addCurveToPoint: CGPointMake(14.03, 12.99) controlPoint1: CGPointMake(13.86, 13.36) controlPoint2: CGPointMake(14.03, 13.19)];
    [bezierPath addCurveToPoint: CGPointMake(13.66, 12.63) controlPoint1: CGPointMake(14.03, 12.79) controlPoint2: CGPointMake(13.86, 12.63)];
    [bezierPath addLineToPoint: CGPointMake(12.39, 12.63)];
    [bezierPath addLineToPoint: CGPointMake(11.87, 11.74)];
    [bezierPath addLineToPoint: CGPointMake(14.36, 11.74)];
    [bezierPath addCurveToPoint: CGPointMake(14.73, 11.38) controlPoint1: CGPointMake(14.56, 11.74) controlPoint2: CGPointMake(14.73, 11.58)];
    [bezierPath addCurveToPoint: CGPointMake(14.36, 11.01) controlPoint1: CGPointMake(14.73, 11.17) controlPoint2: CGPointMake(14.56, 11.01)];
    [bezierPath addLineToPoint: CGPointMake(11.45, 11.01)];
    [bezierPath addLineToPoint: CGPointMake(10.94, 10.15)];
    [bezierPath addCurveToPoint: CGPointMake(12.28, 7.87) controlPoint1: CGPointMake(11.67, 9.62) controlPoint2: CGPointMake(12.18, 8.81)];
    [bezierPath addLineToPoint: CGPointMake(13.28, 7.87)];
    [bezierPath addLineToPoint: CGPointMake(14.74, 10.36)];
    [bezierPath addCurveToPoint: CGPointMake(15.06, 10.54) controlPoint1: CGPointMake(14.81, 10.47) controlPoint2: CGPointMake(14.93, 10.54)];
    [bezierPath addCurveToPoint: CGPointMake(15.25, 10.49) controlPoint1: CGPointMake(15.12, 10.54) controlPoint2: CGPointMake(15.19, 10.52)];
    [bezierPath addCurveToPoint: CGPointMake(15.38, 9.99) controlPoint1: CGPointMake(15.42, 10.39) controlPoint2: CGPointMake(15.48, 10.17)];
    [bezierPath addLineToPoint: CGPointMake(14.14, 7.87)];
    [bezierPath addLineToPoint: CGPointMake(15.18, 7.87)];
    [bezierPath addLineToPoint: CGPointMake(15.81, 8.95)];
    [bezierPath addCurveToPoint: CGPointMake(16.13, 9.13) controlPoint1: CGPointMake(15.88, 9.07) controlPoint2: CGPointMake(16, 9.13)];
    [bezierPath addCurveToPoint: CGPointMake(16.31, 9.08) controlPoint1: CGPointMake(16.19, 9.13) controlPoint2: CGPointMake(16.26, 9.12)];
    [bezierPath addCurveToPoint: CGPointMake(16.45, 8.59) controlPoint1: CGPointMake(16.49, 8.98) controlPoint2: CGPointMake(16.55, 8.76)];
    [bezierPath addLineToPoint: CGPointMake(16.03, 7.87)];
    [bezierPath addLineToPoint: CGPointMake(17.56, 7.87)];
    [bezierPath addCurveToPoint: CGPointMake(17.93, 7.51) controlPoint1: CGPointMake(17.76, 7.87) controlPoint2: CGPointMake(17.93, 7.71)];
    [bezierPath addCurveToPoint: CGPointMake(17.56, 7.14) controlPoint1: CGPointMake(17.93, 7.31) controlPoint2: CGPointMake(17.76, 7.14)];
    [bezierPath closePath];
    [bezierPath moveToPoint: CGPointMake(11.56, 7.51)];
    [bezierPath addCurveToPoint: CGPointMake(11.52, 7.87) controlPoint1: CGPointMake(11.56, 7.63) controlPoint2: CGPointMake(11.54, 7.75)];
    [bezierPath addCurveToPoint: CGPointMake(10.56, 9.51) controlPoint1: CGPointMake(11.43, 8.54) controlPoint2: CGPointMake(11.07, 9.11)];
    [bezierPath addCurveToPoint: CGPointMake(9.93, 9.88) controlPoint1: CGPointMake(10.37, 9.66) controlPoint2: CGPointMake(10.16, 9.79)];
    [bezierPath addCurveToPoint: CGPointMake(8.96, 10.07) controlPoint1: CGPointMake(9.63, 10) controlPoint2: CGPointMake(9.3, 10.07)];
    [bezierPath addCurveToPoint: CGPointMake(8, 9.88) controlPoint1: CGPointMake(8.62, 10.07) controlPoint2: CGPointMake(8.3, 10)];
    [bezierPath addCurveToPoint: CGPointMake(7.36, 9.51) controlPoint1: CGPointMake(7.77, 9.79) controlPoint2: CGPointMake(7.56, 9.66)];
    [bezierPath addCurveToPoint: CGPointMake(6.4, 7.87) controlPoint1: CGPointMake(6.85, 9.11) controlPoint2: CGPointMake(6.5, 8.54)];
    [bezierPath addCurveToPoint: CGPointMake(6.36, 7.51) controlPoint1: CGPointMake(6.38, 7.75) controlPoint2: CGPointMake(6.36, 7.63)];
    [bezierPath addCurveToPoint: CGPointMake(6.4, 7.14) controlPoint1: CGPointMake(6.36, 7.38) controlPoint2: CGPointMake(6.38, 7.26)];
    [bezierPath addCurveToPoint: CGPointMake(7.36, 5.51) controlPoint1: CGPointMake(6.5, 6.48) controlPoint2: CGPointMake(6.85, 5.91)];
    [bezierPath addCurveToPoint: CGPointMake(8, 5.14) controlPoint1: CGPointMake(7.56, 5.36) controlPoint2: CGPointMake(7.77, 5.23)];
    [bezierPath addCurveToPoint: CGPointMake(8.96, 4.95) controlPoint1: CGPointMake(8.3, 5.02) controlPoint2: CGPointMake(8.62, 4.95)];
    [bezierPath addCurveToPoint: CGPointMake(9.93, 5.14) controlPoint1: CGPointMake(9.3, 4.95) controlPoint2: CGPointMake(9.63, 5.02)];
    [bezierPath addCurveToPoint: CGPointMake(10.56, 5.51) controlPoint1: CGPointMake(10.16, 5.23) controlPoint2: CGPointMake(10.37, 5.36)];
    [bezierPath addCurveToPoint: CGPointMake(11.52, 7.14) controlPoint1: CGPointMake(11.07, 5.91) controlPoint2: CGPointMake(11.43, 6.48)];
    [bezierPath addCurveToPoint: CGPointMake(11.56, 7.51) controlPoint1: CGPointMake(11.54, 7.26) controlPoint2: CGPointMake(11.56, 7.38)];
    [bezierPath closePath];
    [fillColor setFill];
    [bezierPath fill];

    CGContextDrawPath(currentContext, kCGPathStroke);
}

@end
