//
//  L360ConfettiView.h
//  L360ConfettiExample
//
//  Created by Mohammed Islam on 12/11/14.
//  Copyright (c) 2014 Life360. All rights reserved.
//

#import <UIKit/UIKit.h>

@class L360ConfettiArea;

@protocol L360ConfettiViewDelegate <NSObject>

@optional
- (NSArray *)colorsForConfettiView:(L360ConfettiArea *)confettiView;

@end

@interface L360ConfettiArea : UIView

@property (weak, nonatomic) id <L360ConfettiViewDelegate> delegate;

- (void)burstAt:(CGPoint)point confettiSize:(CGSize)confettiSize numberOfConfetti:(NSInteger)numberConfetti;

@end
