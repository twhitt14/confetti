//
//  L360ConfettiView.h
//  L360ConfettiExample
//
//  Created by Mohammed Islam on 12/12/14.
//  Copyright (c) 2014 Life360. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface L360ConfettiView : UIView

/**
 *  Initialization method
 *
 *  @param frame
 *  @param flutterSpeed Rotations/sec speed of "flutter" of confetti
 */
- (instancetype)initWithFrame:(CGRect)frame withFlutterSpeed:(CGFloat)flutterSpeed;

@end
