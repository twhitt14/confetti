//
//  ViewController.m
//  L360ConfettiExample
//
//  Created by Mohammed Islam on 12/11/14.
//  Copyright (c) 2014 Life360. All rights reserved.
//

#import "ViewController.h"
#import "L360ConfettiObject.h"

@interface ViewController () <UICollisionBehaviorDelegate>

@property (nonatomic, strong) NSMutableArray *confettiViews;
@property (nonatomic, strong) NSMutableArray *confettiObjects;

@property (nonatomic, strong) UIDynamicAnimator *animator;
@property (nonatomic, strong) UIGravityBehavior *gravityBehavior;

@end

@implementation ViewController

- (void)loadView
{
    [super loadView];
    
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    
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
    
    for (NSInteger i = 0; i < 10; i++) {
        UIView *confettiView = [[UIView alloc] initWithFrame:CGRectMake(150.0, 300.0, 10.0, 2.0)];
        confettiView.backgroundColor = [self colors][[self randomIntegerFrom:0 to:[[self colors] count]]];
        
        [self.view addSubview:confettiView];
        
        L360ConfettiObject *confettiObject = [[L360ConfettiObject alloc] initWithView:confettiView];
        confettiObject.gravityMagnitude = self.gravityBehavior.magnitude;
        confettiObject.linearVelocity = CGPointMake([self randomFloatBetween:-200.0 and:200.0],
                                                    [self randomFloatBetween:-100.0 and:-500.0]);
        confettiObject.angularVelocity = [self randomFloatBetween:-5.0 and:5.0];
        confettiObject.density = [self randomFloatBetween:0.2 and:1.5];
        
        [self.confettiViews addObject:confettiView];
        [self.confettiObjects addObject:confettiObject];
        
        // Add the items to the right behaviors
        [self.gravityBehavior addItem:confettiView];
        [collisionBehavior addItem:confettiView];
        [self.animator addBehavior:confettiObject.behavior];
    }
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self.animator addBehavior:self.gravityBehavior];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)collisionBehavior:(UICollisionBehavior *)behavior beganContactForItem:(id<UIDynamicItem>)item
   withBoundaryIdentifier:(id<NSCopying>)identifier atPoint:(CGPoint)p
{
#warning This doesn't always work and there might be leaks
//    // Remove the items that touches the bounds
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

- (NSArray *)colors
{
    return @[[UIColor redColor],
             [UIColor blueColor],
             [UIColor greenColor],
             [UIColor orangeColor],
             [UIColor purpleColor],
             [UIColor magentaColor],
             [UIColor cyanColor]
             ];
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
