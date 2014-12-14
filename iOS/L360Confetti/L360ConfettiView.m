//
//  L360ConfettiView.m
//  L360ConfettiExample
//
//  Created by Mohammed Islam on 12/12/14.
//  Copyright (c) 2014 Life360. All rights reserved.
//

#import "L360ConfettiView.h"

@implementation L360ConfettiView

- (instancetype)initWithFrame:(CGRect)frame
             withFlutterSpeed:(CGFloat)flutterSpeed
                  flutterType:(L360ConfettiFlutterType)flutterType
{
    self = [super initWithFrame:frame];
    if (self) {
        CABasicAnimation *rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform"];
        
        rotationAnimation.duration = 1.0 / flutterSpeed;
        rotationAnimation.repeatCount = 500;
        
        // set the animation's "toValue" which MUST be wrapped in an NSValue instance (except special cases such as colors)
        switch (flutterType) {
            default:
            case L360ConfettiFlutterTypeDiagonal1:
                rotationAnimation.toValue = [NSValue valueWithCATransform3D:CATransform3DConcat(self.layer.transform, CATransform3DRotate(CATransform3DIdentity, M_PI, -1.0, 1.0, 0))];
                break;
                
            case L360ConfettiFlutterTypeDiagonal2:
                rotationAnimation.toValue = [NSValue valueWithCATransform3D:CATransform3DConcat(self.layer.transform, CATransform3DRotate(CATransform3DIdentity, M_PI, 1.0, 1.0, 0))];
                break;
                
            case L360ConfettiFlutterTypeVertical:
                rotationAnimation.toValue = [NSValue valueWithCATransform3D:CATransform3DConcat(self.layer.transform, CATransform3DRotate(CATransform3DIdentity, M_PI, 0.0, 1.0, 0))];
                break;
                
            case L360ConfettiFlutterTypeHorizontal:
                rotationAnimation.toValue = [NSValue valueWithCATransform3D:CATransform3DConcat(self.layer.transform, CATransform3DRotate(CATransform3DIdentity, M_PI, 1.0, 0.0, 0))];
                break;
        }
        
        // finally, apply the animation
        [self.layer addAnimation:rotationAnimation forKey:@"L360ConfettiRotationAnimation"];
    }
    return self;
}

@end
