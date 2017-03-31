//
//  L360BatConfetti.m
//  L360ConfettiExample
//
//  Created by Joshua Archer on 3/30/17.
//  Copyright © 2017 Life360. All rights reserved.
//

#import "L360BatConfetti.h"
#import "L360ConfettiAbleView.h"

CGFloat const batHeight = 20;
CGFloat const batWidth = 20;

@interface L360BatConfetti ()

@property (nonatomic, assign) CGFloat flutterSpeed;
@property (nonatomic, assign) L360ConfettiFlutterType flutterType;
@property (nonatomic, assign) BOOL animationAdded;

@end

@implementation L360BatConfetti

- (instancetype)initWithStartingPoint:(CGPoint)point
                        confettiColor:(UIColor *)color
                     withFlutterSpeed:(CGFloat)flutterSpeed
                          flutterType:(L360ConfettiFlutterType)flutterType
{
    CGRect layerFrame = CGRectMake(point.x, point.y, batWidth, batHeight);
    self = [super initWithFrame:layerFrame];
    if (self) {
        self.flutterSpeed = flutterSpeed;
        self.flutterType = flutterType;
        self.animationAdded = NO;
        self.backgroundColor = [UIColor clearColor];
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
    //// General Declarations
    CGContextRef context = UIGraphicsGetCurrentContext();

    //// Color Declarations
    UIColor* gradientColor = [UIColor colorWithRed: 0.475 green: 0.455 blue: 0.455 alpha: 1];

    //// Gradient Declarations
    CGFloat linearGradientLocations[] = {0, 1};
    CGGradientRef linearGradient = CGGradientCreateWithColors(NULL, (__bridge CFArrayRef)@[(id)gradientColor.CGColor, (id)gradientColor.CGColor], linearGradientLocations);

    //// Page-1
    {
        //// bat
        {
            //// XMLID_1569_ Drawing
            UIBezierPath* xMLID_1569_Path = [UIBezierPath bezierPath];
            [xMLID_1569_Path moveToPoint: CGPointMake(18.02, 12.22)];
            [xMLID_1569_Path addCurveToPoint: CGPointMake(17.8, 12.1) controlPoint1: CGPointMake(17.96, 12.16) controlPoint2: CGPointMake(17.88, 12.12)];
            [xMLID_1569_Path addCurveToPoint: CGPointMake(17.17, 12.19) controlPoint1: CGPointMake(17.62, 12.07) controlPoint2: CGPointMake(17.45, 12.11)];
            [xMLID_1569_Path addCurveToPoint: CGPointMake(12.01, 11.05) controlPoint1: CGPointMake(16.32, 12.44) controlPoint2: CGPointMake(14.33, 13)];
            [xMLID_1569_Path addLineToPoint: CGPointMake(13.3, 9.76)];
            [xMLID_1569_Path addCurveToPoint: CGPointMake(13.39, 9.27) controlPoint1: CGPointMake(13.43, 9.63) controlPoint2: CGPointMake(13.46, 9.44)];
            [xMLID_1569_Path addCurveToPoint: CGPointMake(12.97, 8.99) controlPoint1: CGPointMake(13.32, 9.1) controlPoint2: CGPointMake(13.16, 8.99)];
            [xMLID_1569_Path addLineToPoint: CGPointMake(11.92, 8.99)];
            [xMLID_1569_Path addCurveToPoint: CGPointMake(11.01, 8.07) controlPoint1: CGPointMake(11.42, 8.99) controlPoint2: CGPointMake(11.01, 8.58)];
            [xMLID_1569_Path addLineToPoint: CGPointMake(11.01, 7.02)];
            [xMLID_1569_Path addCurveToPoint: CGPointMake(10.73, 6.6) controlPoint1: CGPointMake(11.01, 6.84) controlPoint2: CGPointMake(10.9, 6.67)];
            [xMLID_1569_Path addCurveToPoint: CGPointMake(10.23, 6.7) controlPoint1: CGPointMake(10.56, 6.53) controlPoint2: CGPointMake(10.36, 6.57)];
            [xMLID_1569_Path addLineToPoint: CGPointMake(8.94, 7.99)];
            [xMLID_1569_Path addCurveToPoint: CGPointMake(7.8, 2.82) controlPoint1: CGPointMake(6.99, 5.67) controlPoint2: CGPointMake(7.56, 3.69)];
            [xMLID_1569_Path addCurveToPoint: CGPointMake(7.89, 2.2) controlPoint1: CGPointMake(7.88, 2.54) controlPoint2: CGPointMake(7.93, 2.37)];
            [xMLID_1569_Path addCurveToPoint: CGPointMake(7.77, 1.98) controlPoint1: CGPointMake(7.87, 2.12) controlPoint2: CGPointMake(7.83, 2.04)];
            [xMLID_1569_Path addCurveToPoint: CGPointMake(0.27, 0.57) controlPoint1: CGPointMake(5.82, 0.02) controlPoint2: CGPointMake(2.81, -0.55)];
            [xMLID_1569_Path addCurveToPoint: CGPointMake(0.01, 0.89) controlPoint1: CGPointMake(0.14, 0.63) controlPoint2: CGPointMake(0.04, 0.75)];
            [xMLID_1569_Path addCurveToPoint: CGPointMake(0.12, 1.29) controlPoint1: CGPointMake(-0.02, 1.03) controlPoint2: CGPointMake(0.02, 1.18)];
            [xMLID_1569_Path addCurveToPoint: CGPointMake(1.78, 8.29) controlPoint1: CGPointMake(1.83, 3.19) controlPoint2: CGPointMake(2.45, 5.81)];
            [xMLID_1569_Path addCurveToPoint: CGPointMake(1.93, 8.75) controlPoint1: CGPointMake(1.74, 8.46) controlPoint2: CGPointMake(1.79, 8.64)];
            [xMLID_1569_Path addCurveToPoint: CGPointMake(2.27, 9.06) controlPoint1: CGPointMake(2.04, 8.85) controlPoint2: CGPointMake(2.16, 8.95)];
            [xMLID_1569_Path addCurveToPoint: CGPointMake(3.96, 12.85) controlPoint1: CGPointMake(3.28, 10.07) controlPoint2: CGPointMake(3.88, 11.41)];
            [xMLID_1569_Path addCurveToPoint: CGPointMake(3.96, 13.45) controlPoint1: CGPointMake(3.97, 13.05) controlPoint2: CGPointMake(3.97, 13.25)];
            [xMLID_1569_Path addCurveToPoint: CGPointMake(2.75, 16.54) controlPoint1: CGPointMake(3.91, 14.49) controlPoint2: CGPointMake(3.49, 15.56)];
            [xMLID_1569_Path addLineToPoint: CGPointMake(2.53, 16.83)];
            [xMLID_1569_Path addCurveToPoint: CGPointMake(2.57, 17.42) controlPoint1: CGPointMake(2.39, 17.01) controlPoint2: CGPointMake(2.41, 17.26)];
            [xMLID_1569_Path addCurveToPoint: CGPointMake(3.16, 17.47) controlPoint1: CGPointMake(2.73, 17.59) controlPoint2: CGPointMake(2.98, 17.6)];
            [xMLID_1569_Path addLineToPoint: CGPointMake(3.45, 17.25)];
            [xMLID_1569_Path addCurveToPoint: CGPointMake(6.54, 16.03) controlPoint1: CGPointMake(4.43, 16.5) controlPoint2: CGPointMake(5.5, 16.08)];
            [xMLID_1569_Path addCurveToPoint: CGPointMake(7.14, 16.04) controlPoint1: CGPointMake(6.74, 16.02) controlPoint2: CGPointMake(6.94, 16.03)];
            [xMLID_1569_Path addCurveToPoint: CGPointMake(10.94, 17.73) controlPoint1: CGPointMake(8.58, 16.12) controlPoint2: CGPointMake(9.93, 16.72)];
            [xMLID_1569_Path addCurveToPoint: CGPointMake(11.24, 18.06) controlPoint1: CGPointMake(11.04, 17.83) controlPoint2: CGPointMake(11.14, 17.95)];
            [xMLID_1569_Path addCurveToPoint: CGPointMake(11.71, 18.21) controlPoint1: CGPointMake(11.35, 18.2) controlPoint2: CGPointMake(11.53, 18.25)];
            [xMLID_1569_Path addCurveToPoint: CGPointMake(18.7, 19.88) controlPoint1: CGPointMake(14.18, 17.54) controlPoint2: CGPointMake(16.8, 18.16)];
            [xMLID_1569_Path addCurveToPoint: CGPointMake(19.01, 19.99) controlPoint1: CGPointMake(18.79, 19.95) controlPoint2: CGPointMake(18.9, 19.99)];
            [xMLID_1569_Path addCurveToPoint: CGPointMake(19.1, 19.98) controlPoint1: CGPointMake(19.04, 19.99) controlPoint2: CGPointMake(19.07, 19.99)];
            [xMLID_1569_Path addCurveToPoint: CGPointMake(19.42, 19.72) controlPoint1: CGPointMake(19.24, 19.95) controlPoint2: CGPointMake(19.36, 19.85)];
            [xMLID_1569_Path addCurveToPoint: CGPointMake(18.02, 12.22) controlPoint1: CGPointMake(20.55, 17.19) controlPoint2: CGPointMake(19.98, 14.17)];
            [xMLID_1569_Path addLineToPoint: CGPointMake(18.02, 12.22)];
            [xMLID_1569_Path closePath];
            xMLID_1569_Path.usesEvenOddFillRule = YES;
            CGContextSaveGState(context);
            [xMLID_1569_Path addClip];
            CGContextDrawLinearGradient(context, linearGradient,
                                        CGPointMake(-2.37, 5.98),
                                        CGPointMake(20.79, 16.78),
                                        kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
            CGContextRestoreGState(context);
        }
    }
    
    
    //// Cleanup
    CGGradientRelease(linearGradient);
}

@end
