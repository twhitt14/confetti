//
//  L360CandyCorn.h
//  L360ConfettiExample
//
//  Created by Joshua Archer on 3/30/17.
//  Copyright © 2017 Life360. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "L360ConfettiAbleView.h"

@interface L360CandyCorn : L360ConfettiAbleView

/**
 *  Initialization method
 *
 *  @param point starting position of snowflake

 *  @param flutterSpeed Rotations/sec speed of "flutter" of confetti
 *  @param flutterType They type of flutter for confetti
 */

- (instancetype _Nonnull)initWithStartingPoint:(CGPoint)point
                                 confettiColor:(UIColor * _Nullable)color
                              withFlutterSpeed:(CGFloat)flutterSpeed
                                   flutterType:(L360ConfettiFlutterType)flutterType;

@end
