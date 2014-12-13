//
//  L360ConfettiObject.h
//  L360ConfettiExample
//
//  Created by Mohammed Islam on 12/11/14.
//  Copyright (c) 2014 Life360. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface L360ConfettiObject : NSObject

/**
 *  Initializer
 *
 *  @param view to add behaviors to.
 */
- (instancetype)initWithConfettiView:(UIView *)view;

/**
 *  The initial trajectory of the object before gravity and resistence takes over
 *  It's in pixels/sec, so (10, -20) is 10 px/s towards the right and 20 px/s up
 *  DEFAULT: (0, 0)
 */
@property (nonatomic, assign) CGPoint linearVelocity;

/**
 *  The velocity (radials/sec) of initial spin before resistence takes over
 *  DEFAULT: 0.0
 */
@property (nonatomic, assign) CGFloat angularVelocity;

/**
 *  The magnitude of gravity setup for the gravity behavior
 *  DEFAULT: 1.0
 */
@property (nonatomic, assign) CGFloat gravityMagnitude;

/**
 *  This determines how softly this object will float down
 *  DEFAULT: 1.0
 */
@property (nonatomic, assign) CGFloat density;

/**
 *  The way this item will behave based on the values given above
 */
@property (nonatomic, readonly) UIDynamicItemBehavior *behavior;

@end
