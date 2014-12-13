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
{
    self = [super initWithFrame:frame];
    if (self) {
        NSNumber *rotationAtStart = [self.layer valueForKeyPath:@"transform.rotation"];
        CATransform3D myRotationTransform = CATransform3DRotate(self.layer.transform, 1.1, 0.0, 0.0, 1.0);
        self.layer.transform = myRotationTransform;
        CABasicAnimation *myAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
        myAnimation.duration = 1.0;
        myAnimation.fromValue = rotationAtStart;
        myAnimation.toValue = [NSNumber numberWithFloat:([rotationAtStart floatValue] + 1.1)];
        [self.layer addAnimation:myAnimation forKey:@"transform.rotation"];
    }
    return self;
}

@end
