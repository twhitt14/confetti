//
//  L360ConfettiObject.m
//  L360ConfettiExample
//
//  Created by Mohammed Islam on 12/11/14.
//  Copyright (c) 2014 Life360. All rights reserved.
//

#import "L360ConfettiObject.h"

@interface L360ConfettiObject ()

@property (nonatomic, strong) UIView *view;

@end

@implementation L360ConfettiObject

- (instancetype)initWithView:(UIView *)view
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
    UIDynamicItemBehavior *behavior = [[UIDynamicItemBehavior alloc] initWithItems:@[self.view]];
    [behavior addLinearVelocity:_linearVelocity forItem:self.view];
    [behavior addAngularVelocity:_angularVelocity forItem:self.view];
    
    __weak L360ConfettiObject *weakSelf = self;
    __weak UIDynamicItemBehavior *weakBehavior = behavior;
    behavior.action = ^{
        CGPoint linearVelocity = [weakBehavior linearVelocityForItem:weakSelf.view];
        if (linearVelocity.y > 200.0) {
            weakBehavior.resistance = 2.5;
        } else if (linearVelocity.y > 100.0) {
            weakBehavior.resistance = 2.0;
        } else if (linearVelocity.y > 0) {
            weakBehavior.resistance = 1.0;
        }
    };
    
    return behavior;
}

@end
