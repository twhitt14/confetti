//
//  L360ConfettiObject.m
//  L360ConfettiExample
//
//  Created by Mohammed Islam on 12/11/14.
//  Copyright (c) 2014 Life360. All rights reserved.
//

#import "L360ConfettiObject.h"

@interface L360ConfettiObject ()
{
    UIDynamicItemBehavior *_behavior;
}

@property (nonatomic, strong) UIView *view;

@end

@implementation L360ConfettiObject

@synthesize
behavior = _behavior;

- (instancetype)initWithConfettiView:(UIView *)view
{
    self = [super init];
    if (self) {
        self.linearVelocity = CGPointMake(0.0, 0.0);
        self.angularVelocity = 0.0;
        self.gravityMagnitude = 1.0;
        self.density = 1.0;
        self.view = view;
    }
    
    return self;
}

- (void)setLinearVelocity:(CGPoint)linearVelocity
{
    _linearVelocity = linearVelocity;
}

- (void)setAngularVelocity:(CGFloat)angularVelocity
{
    _angularVelocity = angularVelocity;
}

- (void)setGravityMagnitude:(CGFloat)gravityMagnitude
{
    _gravityMagnitude = gravityMagnitude;
}

- (void)setDensity:(CGFloat)density
{
    _density = density;
}

- (UIDynamicItemBehavior *)behavior
{
    if (!_behavior) {
        _behavior = [[UIDynamicItemBehavior alloc] initWithItems:@[self.view]];
        [_behavior addLinearVelocity:_linearVelocity forItem:self.view];
        [_behavior addAngularVelocity:_angularVelocity forItem:self.view];
        
        __weak L360ConfettiObject *weakSelf = self;
        __weak UIDynamicItemBehavior *weakBehavior = _behavior;
        _behavior.action = ^{
            // Need to simulate paper falling with a terminal velocity
            CGPoint linearVelocity = [weakBehavior linearVelocityForItem:weakSelf.view];
            // Don't kick in the acceleration limiter till the items start to fall
            if (linearVelocity.y > 50.0) {
                // The calculation for terminal velocity is simple:
                // divide the linear velocity by gravity magnitude and density of the object
                // Then divide by a magic number for good measure.
                weakBehavior.resistance = linearVelocity.y / weakSelf.gravityMagnitude / weakSelf.density / 100.0;
            }
        };
    }
    
    return _behavior;
}

@end
