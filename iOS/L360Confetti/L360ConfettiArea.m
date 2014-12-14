//
//  L360ConfettiView.m
//  L360ConfettiExample
//
//  Created by Mohammed Islam on 12/11/14.
//  Copyright (c) 2014 Life360. All rights reserved.
//

#import "L360ConfettiArea.h"
#import "L360ConfettiObject.h"
#import "L360ConfettiView.h"

@interface L360ConfettiArea () <UICollisionBehaviorDelegate>

@property (nonatomic, strong) NSMutableSet *confettiBursts;

@property (nonatomic, strong) UIDynamicAnimator *animator;
@property (nonatomic, strong) UIGravityBehavior *gravityBehavior;
@property (nonatomic, strong) UICollisionBehavior *collisionBehavior;
@property (nonatomic, strong) NSArray *colors;

@end

@implementation L360ConfettiArea

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupDataFromDelegates];
        
        self.confettiBursts = [NSMutableSet set];
        
        self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self];
        
        // Create gravity behavior. Don't add till view did appear
        self.gravityBehavior = [[UIGravityBehavior alloc] init];
        self.gravityBehavior.magnitude = 0.5;
        
        [self.animator addBehavior:self.gravityBehavior];
        
//        // Create a collision behavior and set boundry to the full view frame
//        self.collisionBehavior = [[UICollisionBehavior alloc] init];
//        self.collisionBehavior.translatesReferenceBoundsIntoBoundary = YES;
//        self.collisionBehavior.collisionDelegate = self;
//        
//        [self.animator addBehavior:self.collisionBehavior];
    }
    return self;
}

- (void)setupDataFromDelegates
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(colorsForConfettiView:)]) {
        self.colors = [self.delegate colorsForConfettiView:self];
    } else {
        // Default to these colors
        self.colors = @[[UIColor redColor],
                        [UIColor blueColor],
                        [UIColor greenColor],
                        [UIColor orangeColor],
                        [UIColor purpleColor],
                        [UIColor magentaColor],
                        [UIColor cyanColor]
                        ];
    }
}

- (void)burstAt:(CGPoint)point confettiSize:(CGSize)confettiSize numberOfConfetti:(NSInteger)numberConfetti
{
    CGRect confettiFrame = CGRectMake(point.x,
                                      point.y,
                                      confettiSize.width,
                                      confettiSize.height);
    
    NSMutableArray *confettiObjects = [NSMutableArray array];
    
    for (NSInteger i = 0; i < numberConfetti; i++) {
        L360ConfettiView *confettiView = [[L360ConfettiView alloc] initWithFrame:confettiFrame
                                                                withFlutterSpeed:[self randomFloatBetween:1.0 and:5.0]];
        confettiView.backgroundColor = self.colors[[self randomIntegerFrom:0 to:self.colors.count]];
        
        [self addSubview:confettiView];
        
        L360ConfettiObject *confettiObject = [[L360ConfettiObject alloc] initWithConfettiView:confettiView];
        confettiObject.gravityMagnitude = self.gravityBehavior.magnitude;
        confettiObject.linearVelocity = CGPointMake([self randomFloatBetween:-200.0 and:200.0],
                                                    [self randomFloatBetween:-100.0 and:-400.0]);
        confettiObject.density = [self randomFloatBetween:0.2 and:1.0];
        
        [confettiObjects addObject:confettiObject];
        
        // Add to the behaviors
        [self.collisionBehavior addItem:confettiView];
        [self.animator addBehavior:confettiObject.behavior];
        [self.gravityBehavior addItem:confettiView];
    }
    
    // Store the burst so that later it can be properly deallocated
    [self.confettiBursts addObject:confettiObjects];
}

- (void)collisionBehavior:(UICollisionBehavior *)behavior beganContactForItem:(id<UIDynamicItem>)item
   withBoundaryIdentifier:(id<NSCopying>)identifier atPoint:(CGPoint)p
{
#warning This doesn't always work and there might be leaks
    // Remove the items that touches the bounds
//    UIView *confettiView = (UIView *)item;
//    NSInteger index = [self.confettiViews indexOfObject:confettiView];
//    if (index != NSNotFound)
//    {
//        L360ConfettiObject *confettiObject = [self.confettiObjects objectAtIndex:index];
//        [self.animator removeBehavior:confettiObject.behavior];
//
//        [confettiView removeFromSuperview];
//        [self.confettiObjects removeObject:confettiObject];
//        [self.confettiViews removeObject:confettiView];
//
//        confettiView = nil;
//        confettiObject = nil;
//    }
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
    if (fromInteger == toInteger) {
        return fromInteger;
    }
    
    return fromInteger + arc4random() % (toInteger - fromInteger);
}

@end
