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
#import "L360ConfettiAble.h"

@interface L360ConfettiArea () <L360ConfettiObjectDelegate>

// Need to hold reference to the L360ConfettiObjects while they animate
@property (nonatomic, strong) NSMutableSet *confettiObjectsCache;

@property (nonatomic, strong) UIDynamicAnimator *animator;
@property (nonatomic, strong) UIGravityBehavior *gravityBehavior;
@property (nonatomic, strong) NSArray *colors;

@end

@implementation L360ConfettiArea

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (void)commonInit
{
    self.swayLength = 50.0;
    self.blastSpread = 0.1;
    self.confettiObjectsCache = [NSMutableSet set];
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self];
    
    // Create gravity behavior. Don't add till view did appear
    self.gravityBehavior = [[UIGravityBehavior alloc] init];
    self.gravityBehavior.magnitude = 0.5;
    
    [self.animator addBehavior:self.gravityBehavior];
}

- (void)setupDataFromDelegates
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(colorsForConfettiArea:)]) {
        self.colors = [self.delegate colorsForConfettiArea:self];
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

- (void)burstAt:(CGPoint)point confettiWidth:(CGFloat)confettiWidth numberOfConfetti:(NSInteger)numberConfetti
{
    [self setupDataFromDelegates];

    NSArray<L360ConfettiView *> *confettiViews = [self confettiViewsAtPoint:point confettiWidth:confettiWidth numberOfConfetti:numberConfetti];

    CGRect currentBounds = self.bounds;

    __weak L360ConfettiArea *weakSelf = self;
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void) {
        NSMutableArray *confettiObjects = [NSMutableArray array];

        for (L360ConfettiView *confettiView in confettiViews) {
            
            // Each view is associated with an object that handles how the confetti falls
            L360ConfettiObject *confettiObject = [[L360ConfettiObject alloc] initWithConfettiView:confettiView
                                                                                 keepWithinBounds:currentBounds
                                                                                         animator:weakSelf.animator
                                                                                          gravity:weakSelf.gravityBehavior];
            confettiObject.linearVelocity = CGPointMake([weakSelf randomFloatBetween:-200.0 and:200.0],
                                                        [weakSelf randomFloatBetween:-100.0 and:-400.0]);
            confettiObject.density = [weakSelf randomFloatBetween:0.2 and:1.0];
            confettiObject.swayLength = [weakSelf randomFloatBetween:0.0 and:weakSelf.swayLength];
            confettiObject.delegate = weakSelf;
            
            [confettiObjects addObject:confettiObject];
            
            dispatch_async(dispatch_get_main_queue(), ^(void) {
                [weakSelf.confettiObjectsCache addObject:confettiObject];
                [weakSelf addSubview:confettiView];
                
                // Add the confetti object behavior to the animator and the view to gravity behavior
                [weakSelf.animator addBehavior:confettiObject.fallingBehavior];
                [weakSelf.gravityBehavior addItem:confettiView];
            });
        }
    });
}

- (void)blastFrom:(CGPoint)point towards:(CGFloat)angle withForce:(CGFloat)force confettiWidth:(CGFloat)confettiWidth numberOfConfetti:(NSInteger)numberConfetti
{
    [self setupDataFromDelegates];

    NSArray<L360ConfettiView *> *confettiViews = [self confettiViewsAtPoint:point confettiWidth:confettiWidth numberOfConfetti:numberConfetti];

    CGRect currentBounds = self.bounds;

    __weak L360ConfettiArea *weakSelf = self;
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void) {
        NSMutableArray *confettiObjects = [NSMutableArray array];

        for (L360ConfettiView *confettiView in confettiViews) {
            L360ConfettiObject *confettiObject = [[L360ConfettiObject alloc] initWithConfettiView:confettiView
                                                                                 keepWithinBounds:currentBounds
                                                                                         animator:weakSelf.animator
                                                                                          gravity:weakSelf.gravityBehavior];
            
            CGFloat confettiForce = [weakSelf randomFloatBetween:force - (force * 0.3) and:force];
            CGFloat vectorForceXmin = confettiForce * cos(angle - weakSelf.blastSpread);
            CGFloat vectorForceXmax = confettiForce * cos(angle + weakSelf.blastSpread);
            CGFloat vectorForceYmin = -confettiForce * sin(angle - weakSelf.blastSpread);
            CGFloat vectorForceYmax = -confettiForce * sin(angle + weakSelf.blastSpread);
            
            confettiObject.linearVelocity = CGPointMake([weakSelf randomFloatBetween:vectorForceXmin and:vectorForceXmax],
                                                        [weakSelf randomFloatBetween:vectorForceYmin and:vectorForceYmax]);
            confettiObject.density = [weakSelf randomFloatBetween:0.2 and:1.0];
            confettiObject.swayLength = [weakSelf randomFloatBetween:0.0 and:weakSelf.swayLength];
            confettiObject.delegate = weakSelf;
            
            [confettiObjects addObject:confettiObject];
            
            dispatch_async(dispatch_get_main_queue(), ^(void) {
                [weakSelf.confettiObjectsCache addObject:confettiObject];

                [weakSelf addSubview:confettiView];
                // Add the confetti object behavior to the animator and the view to gravity behavior
                [weakSelf.animator addBehavior:confettiObject.fallingBehavior];
                [weakSelf.gravityBehavior addItem:confettiView];
            });
        }
    });
}

#pragma Hackathon

- (void)blastConfettiType:(Class<L360ConfettiAble>)confettiClass fromPoint:(CGPoint)point towards:(CGFloat)angle withForce:(CGFloat)force numberOfConfetti:(NSInteger)numberConfetti
{
    [self setupDataFromDelegates];

    NSMutableArray<UIView *> *confettiViews = [NSMutableArray array];

    for (NSInteger i = 0; i < numberConfetti; i++) {
        NSObject *confetti = [[(Class)confettiClass alloc] initWithStartingPoint:point
                                                                   confettiColor:nil
                                                                withFlutterSpeed:[self randomFloatBetween:1.0 and:5.0]
                                                                     flutterType:[self randomIntegerFrom:0 to:L360ConfettiFlutterTypeCount]];

        if (![confetti isKindOfClass:[UIView class]]) {
            return;
        }

        [confettiViews addObject:(UIView *)confetti];
    }

    CGRect currentBounds = self.bounds;

    __weak L360ConfettiArea *weakSelf = self;
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void) {
        NSMutableArray *confettiObjects = [NSMutableArray array];

        for (UIView *confettiView in confettiViews) {

            L360ConfettiObject *confettiObject = [[L360ConfettiObject alloc] initWithConfettiView:confettiView
                                                                                 keepWithinBounds:currentBounds
                                                                                         animator:weakSelf.animator
                                                                                          gravity:weakSelf.gravityBehavior];

            CGFloat confettiForce = [weakSelf randomFloatBetween:force - (force * 0.3) and:force];
            CGFloat vectorForceXmin = confettiForce * cos(angle - weakSelf.blastSpread);
            CGFloat vectorForceXmax = confettiForce * cos(angle + weakSelf.blastSpread);
            CGFloat vectorForceYmin = -confettiForce * sin(angle - weakSelf.blastSpread);
            CGFloat vectorForceYmax = -confettiForce * sin(angle + weakSelf.blastSpread);

            confettiObject.linearVelocity = CGPointMake([weakSelf randomFloatBetween:vectorForceXmin and:vectorForceXmax],
                                                        [weakSelf randomFloatBetween:vectorForceYmin and:vectorForceYmax]);
            confettiObject.density = [weakSelf randomFloatBetween:0.2 and:1.0];
            confettiObject.swayLength = [weakSelf randomFloatBetween:0.0 and:weakSelf.swayLength];
            confettiObject.delegate = weakSelf;

            [confettiObjects addObject:confettiObject];

            dispatch_async(dispatch_get_main_queue(), ^(void) {
                [weakSelf.confettiObjectsCache addObject:confettiObject];

                [weakSelf addSubview:confettiView];
                // Add the confetti object behavior to the animator and the view to gravity behavior
                [weakSelf.animator addBehavior:confettiObject.fallingBehavior];
                [weakSelf.gravityBehavior addItem:confettiView];
            });
        }
    });
}

#pragma mark L360ConfettiObjectDelegate

- (void)needToDeallocateConfettiObject:(L360ConfettiObject *)confettiObject
{
    [self.confettiObjectsCache removeObject:confettiObject];
    confettiObject = nil;
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

- (NSArray<L360ConfettiView *> *)confettiViewsAtPoint:(CGPoint)point confettiWidth:(CGFloat)confettiWidth numberOfConfetti:(NSInteger)numberConfetti
{
    NSMutableArray<L360ConfettiView *> *confettiViews = [NSMutableArray array];

    for (NSInteger i = 0; i < numberConfetti; i++) {
        CGFloat randomWidth = confettiWidth + [self randomFloatBetween:-(confettiWidth / 2.0) and:2.0];
        CGRect confettiFrame = CGRectMake(point.x,
                                          point.y,
                                          randomWidth,
                                          randomWidth);
        L360ConfettiView *confettiView = [[L360ConfettiView alloc] initWithFrame:confettiFrame
                                                                withFlutterSpeed:[self randomFloatBetween:1.0 and:5.0]
                                                                     flutterType:[self randomIntegerFrom:0 to:L360ConfettiFlutterTypeCount]];
        confettiView.backgroundColor = self.colors[[self randomIntegerFrom:0 to:self.colors.count]];

        [confettiViews addObject:confettiView];
    }

    return confettiViews;
}

@end
