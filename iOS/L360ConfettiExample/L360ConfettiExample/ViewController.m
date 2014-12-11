//
//  ViewController.m
//  L360ConfettiExample
//
//  Created by Mohammed Islam on 12/11/14.
//  Copyright (c) 2014 Life360. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UIDynamicAnimator *animator;
@property (nonatomic, strong) UIGravityBehavior *gravityBehavior;

@end

@implementation ViewController

- (void)loadView
{
    [super loadView];
    
    UIView *blockView = [[UIView alloc] initWithFrame:CGRectMake(100.0, 100.0, 10.0, 2.0)];
    blockView.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:blockView];
    
    UIView *blockView2 = [[UIView alloc] initWithFrame:CGRectMake(100.0, 100.0, 10.0, 2.0)];
    blockView2.backgroundColor = [UIColor blueColor];
    
    [self.view addSubview:blockView2];
    
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    self.gravityBehavior = [[UIGravityBehavior alloc] initWithItems:@[blockView, blockView2]];
    self.gravityBehavior.magnitude = 0.5;
    
    // Create a collision behavior and set boundry to the full view frame
    UICollisionBehavior *collisionBehavior = [[UICollisionBehavior alloc] initWithItems:@[blockView, blockView2]];
    collisionBehavior.translatesReferenceBoundsIntoBoundary = YES;
    
    [self.animator addBehavior:collisionBehavior];
    
    /**
     Block One
     */
    // Add a little kick to the top right to start it off
    UIDynamicItemBehavior *itemBehavior = [[UIDynamicItemBehavior alloc] initWithItems:@[blockView, blockView2]];
    [itemBehavior addLinearVelocity:CGPointMake(100.0, -100.0) forItem:blockView]; // Add some velocity up and towards some direction
    [itemBehavior addAngularVelocity:2.0 forItem:blockView]; // Add a little spin of 100 radians a second
    
    [itemBehavior addLinearVelocity:CGPointMake(-100.0, -100.0) forItem:blockView2]; // Add some velocity up and towards some direction
    [itemBehavior addAngularVelocity:2.0 forItem:blockView2]; // Add a little spin of 100 radians a second
    
    [self.animator addBehavior:itemBehavior];
    
    // Create terminal velocity with changing friction as linear velocity changes
    __weak UIDynamicItemBehavior *weakItemBehavior = itemBehavior;
    itemBehavior.action = ^{
        CGPoint linearVelocity = [weakItemBehavior linearVelocityForItem:blockView];
        if (linearVelocity.y > 200.0) {
            weakItemBehavior.resistance = 2.5;
        } else if (linearVelocity.y > 100.0) {
            weakItemBehavior.resistance = 2.0;
        } else if (linearVelocity.y > 0) {
            weakItemBehavior.resistance = 1.0;
        }
    };
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
