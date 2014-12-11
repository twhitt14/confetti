//
//  ViewController.m
//  L360ConfettiExample
//
//  Created by Mohammed Islam on 12/11/14.
//  Copyright (c) 2014 Life360. All rights reserved.
//

#import "ViewController.h"
#import "L360ConfettiObject.h"

@interface ViewController ()

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
    
    [self.animator addBehavior:collisionBehavior];
    
    NSMutableArray *confettiViews = [NSMutableArray array];
    NSMutableArray *confettiObjects = [NSMutableArray array];
    
    for (NSInteger i = 0; i < 10; i++) {
        UIView *confettiView = [[UIView alloc] initWithFrame:CGRectMake(100.0, 100.0, 10.0, 2.0)];
        confettiView.backgroundColor = [UIColor redColor];
        
        [self.view addSubview:confettiView];
        
        L360ConfettiObject *confettiObject = [[L360ConfettiObject alloc] initWithView:confettiView];
        confettiObject.gravityMagnitude = self.gravityBehavior.magnitude;
        
        // TODO: Need to vary these per confetti
        confettiObject.linearVelocity = CGPointMake(100.0, -100.0);
        confettiObject.angularVelocity = 2.0;
        confettiObject.density = 1.0;
        
        [confettiViews addObject:confettiView];
        [confettiObjects addObject:confettiObject];
        
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

@end
