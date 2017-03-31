//
//  L360ConfettiAbleView.m
//  L360ConfettiExample
//
//  Created by Joshua Archer on 3/31/17.
//  Copyright © 2017 Life360. All rights reserved.
//

#import "L360ConfettiAbleView.h"

@implementation L360ConfettiAbleView

- (instancetype _Nonnull)initWithStartingPoint:(CGPoint)point
                                 confettiColor:(UIColor * _Nullable)color
                              withFlutterSpeed:(CGFloat)flutterSpeed
                                   flutterType:(L360ConfettiFlutterType)flutterType
{
    CGRect layerFrame = CGRectMake(point.x, point.y, 0, 0);
    self = [super initWithFrame:layerFrame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

@end
