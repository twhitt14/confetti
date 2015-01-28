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
    UIDynamicItemBehavior *_fallingBehavior;
}

@property (nonatomic, strong) UIView *confettiView;
@property (nonatomic, assign) CGRect confettiAreaBounds;

@property (nonatomic, weak) UIDynamicAnimator *animator;
@property (nonatomic, weak) UIGravityBehavior *gravityBehavior;

@end

@implementation L360ConfettiObject

@synthesize
fallingBehavior = _fallingBehavior;

- (instancetype)initWithConfettiView:(UIView *)confettiView
                    keepWithinBounds:(CGRect)bounds
                            animator:(UIDynamicAnimator *)animator
                             gravity:(UIGravityBehavior *)gravity
{
    self = [super init];
    if (self) {
        self.linearVelocity = CGPointMake(0.0, 0.0);
        self.angularVelocity = 0.0;
        self.density = 1.0;
        self.confettiView = confettiView;
        self.confettiAreaBounds = bounds;
        self.animator = animator;
        self.gravityBehavior = gravity;
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

- (void)setDensity:(CGFloat)density
{
    _density = density;
}

- (UIDynamicItemBehavior *)fallingBehavior
{
    if (!_fallingBehavior) {
        _fallingBehavior = [[UIDynamicItemBehavior alloc] initWithItems:@[self.confettiView]];
        [_fallingBehavior addLinearVelocity:_linearVelocity forItem:self.confettiView];
        [_fallingBehavior addAngularVelocity:_angularVelocity forItem:self.confettiView];
        
        __weak L360ConfettiObject *weakSelf = self;
        __weak UIDynamicItemBehavior *weakBehavior = _fallingBehavior;
        _fallingBehavior.action = ^{
            // Need to simulate paper falling with a terminal velocity
            CGPoint linearVelocity = [weakBehavior linearVelocityForItem:weakSelf.confettiView];
            // Don't kick in the acceleration limiter till the items start to fall
            if (linearVelocity.y > 50.0) {
                // The calculation for terminal velocity is simple:
                // divide the linear velocity by gravity magnitude and density of the object
                // Then divide by a magic number for good measure.
                weakBehavior.resistance = linearVelocity.y / weakSelf.gravityBehavior.magnitude / weakSelf.density / 100.0;
            }
            
            // Garbage collect the confetti once it's fallen outside the confettiAreaBounds
            if (weakSelf.confettiView.center.y > weakSelf.confettiAreaBounds.size.height) {
                [weakSelf cleanupObject];
            }
        };
    }
    
    return _fallingBehavior;
}

- (void)cleanupObject
{
    // Remove the behavior items
    [_fallingBehavior removeItem:self.confettiView];
    _fallingBehavior.action = nil;
    
    // Remove behavior from parent animator and remove view from gravity
    [self.animator removeBehavior:_fallingBehavior];
    [self.gravityBehavior removeItem:self.confettiView];
    
    // Remove confetti from superview
    [self.confettiView removeFromSuperview];
    
    // Nil it all out
    _fallingBehavior = nil;
    self.confettiView = nil;
}

@end
