//
//  L360CandyCorn.m
//  L360ConfettiExample
//
//  Created by Joshua Archer on 3/30/17.
//  Copyright © 2017 Life360. All rights reserved.
//

#import "L360CandyCorn.h"

CGFloat const candyHeight = 20;
CGFloat const candyWidth = 20;

@interface L360CandyCorn ()

@property (nonatomic, assign) CGFloat flutterSpeed;
@property (nonatomic, assign) L360ConfettiFlutterType flutterType;
@property (nonatomic, assign) BOOL animationAdded;
@property (nonatomic, strong) UIColor *snowColor;

@end

@implementation L360CandyCorn

- (instancetype _Nonnull)initWithStartingPoint:(CGPoint)point
                                 confettiColor:(UIColor * _Nullable)color
                              withFlutterSpeed:(CGFloat)flutterSpeed
                                   flutterType:(L360ConfettiFlutterType)flutterType
{
    CGRect layerFrame = CGRectMake(point.x, point.y, candyWidth, candyHeight);
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
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    CGContextBeginPath(currentContext);

    UIColor *fillColor2 = [UIColor colorWithRed: 0.976 green: 0.624 blue: 0.22 alpha: 1];
    UIColor *fillColor3 = [UIColor colorWithRed: 0.973 green: 0.973 blue: 0.973 alpha: 1];
    UIColor *fillColor4 = [UIColor colorWithRed: 1 green: 0.812 blue: 0.004 alpha: 1];

    UIBezierPath* pathOne = [UIBezierPath bezierPath];
    [pathOne moveToPoint: CGPointMake(11.52, 8.13)];
    [pathOne addLineToPoint: CGPointMake(4.31, 8.13)];
    [pathOne addLineToPoint: CGPointMake(2.07, 13.82)];
    [pathOne addLineToPoint: CGPointMake(13.86, 13.82)];
    [pathOne addLineToPoint: CGPointMake(11.52, 8.13)];
    [pathOne closePath];
    pathOne.usesEvenOddFillRule = YES;
    [fillColor2 setFill];
    [pathOne fill];

    UIBezierPath* pathTwo = [UIBezierPath bezierPath];
    [pathTwo moveToPoint: CGPointMake(9.15, 2.37)];
    [pathTwo addCurveToPoint: CGPointMake(6.57, 2.39) controlPoint1: CGPointMake(8.67, 1.2) controlPoint2: CGPointMake(7.04, 1.21)];
    [pathTwo addLineToPoint: CGPointMake(4.31, 8.13)];
    [pathTwo addLineToPoint: CGPointMake(11.52, 8.13)];
    [pathTwo addLineToPoint: CGPointMake(9.15, 2.37)];
    [pathTwo addLineToPoint: CGPointMake(9.15, 2.37)];
    [pathTwo closePath];
    pathTwo.usesEvenOddFillRule = YES;
    [fillColor3 setFill];
    [pathTwo fill];

    UIBezierPath* pathThree = [UIBezierPath bezierPath];
    [pathThree moveToPoint: CGPointMake(13.86, 13.82)];
    [pathThree addLineToPoint: CGPointMake(2.07, 13.82)];
    [pathThree addLineToPoint: CGPointMake(0.6, 17.56)];
    [pathThree addCurveToPoint: CGPointMake(1.89, 19.5) controlPoint1: CGPointMake(0.23, 18.49) controlPoint2: CGPointMake(0.91, 19.5)];
    [pathThree addLineToPoint: CGPointMake(14.11, 19.5)];
    [pathThree addCurveToPoint: CGPointMake(15.39, 17.54) controlPoint1: CGPointMake(15.1, 19.5) controlPoint2: CGPointMake(15.77, 18.47)];
    [pathThree addLineToPoint: CGPointMake(13.86, 13.82)];
    [pathThree addLineToPoint: CGPointMake(13.86, 13.82)];
    [pathThree closePath];
    pathThree.usesEvenOddFillRule = YES;
    [fillColor4 setFill];
    [pathThree fill];

    CGContextDrawPath(currentContext, kCGPathStroke);
}

@end
