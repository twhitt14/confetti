//
//  L360ConfettiView.m
//  L360ConfettiExample
//
//  Created by Mohammed Islam on 12/11/14.
//  Copyright (c) 2014 Life360. All rights reserved.
//

#import "L360ConfettiView.h"

@interface L360ConfettiView () <UICollisionBehaviorDelegate>

@property (nonatomic, strong) NSMutableArray *confettiViews;
@property (nonatomic, strong) NSMutableArray *confettiObjects;

@property (nonatomic, strong) UIDynamicAnimator *animator;
@property (nonatomic, strong) UIGravityBehavior *gravityBehavior;
@property (nonatomic, strong) NSArray *colors;

@end

@implementation L360ConfettiView

- (instancetype)initWithSize:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        
        self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self];
        
        // Create gravity behavior. Don't add till view did appear
        self.gravityBehavior = [[UIGravityBehavior alloc] init];
        self.gravityBehavior.magnitude = 0.5;
        
        // Create a collision behavior and set boundry to the full view frame
        UICollisionBehavior *collisionBehavior = [[UICollisionBehavior alloc] init];
        collisionBehavior.translatesReferenceBoundsIntoBoundary = YES;
        collisionBehavior.collisionDelegate = self;
        
        [self.animator addBehavior:collisionBehavior];
        
        self.confettiViews = [NSMutableArray array];
        self.confettiObjects = [NSMutableArray array];
        
        for (NSInteger i = 0; i < 15; i++) {
            UIView *confettiView = [[UIView alloc] initWithFrame:CGRectMake(150.0, 300.0, 10.0, 2.0)];
            confettiView.backgroundColor = [self colors][[self randomIntegerFrom:0 to:[[self colors] count]]];
            
            [self addSubview:confettiView];
            
            L360ConfettiObject *confettiObject = [[L360ConfettiObject alloc] initWithView:confettiView];
            confettiObject.gravityMagnitude = self.gravityBehavior.magnitude;
            confettiObject.linearVelocity = CGPointMake([self randomFloatBetween:-200.0 and:200.0],
                                                        [self randomFloatBetween:-100.0 and:-400.0]);
            confettiObject.angularVelocity = [self randomFloatBetween:-5.0 and:5.0];
            confettiObject.density = [self randomFloatBetween:0.2 and:1.0];
            
            [self.confettiViews addObject:confettiView];
            [self.confettiObjects addObject:confettiObject];
            
            // Add the items to the right behaviors
            [self.gravityBehavior addItem:confettiView];
            [collisionBehavior addItem:confettiView];
        }
    }
    return self;
}

- (void)setupDataFromDelegates
{
    1. Need to complete delegate call back for colors, if delegate doesen't implement, default to red and blue
    2. Need to continue abstracting out the view.
    3. Implement explosionAt:(cgpoint)withNumberOfConfetti:(CGFloat)numberConfetti
        
        if (self.delegate && [self.delegate respondsToSelector:@selector(internationalPhoneView:textDidChange:)])
            [self.delegate internationalPhoneView:self textDidChange:self.textField.text];
}

#pragma mark helpers

- (CGFloat)randomFloatBetween:(CGFloat)smallNumber and:(CGFloat)bigNumber
{
    CGFloat diff = bigNumber - smallNumber;
    return (((CGFloat) (arc4random() % ((unsigned)RAND_MAX + 1)) / RAND_MAX) * diff) + smallNumber;
}

/**
 *  [fromInteger, toInteger)
 *  So it's useful for arrays
 */
- (NSInteger)randomIntegerFrom:(NSInteger)fromInteger to:(NSInteger)toInteger
{
    return fromInteger + arc4random() % (toInteger - fromInteger);
}

@end
