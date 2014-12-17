Life360 Confetti
========
Why Confetti? Because here at Life360 we like to celebrate our users and their accomplishments. We believe products should celebrate users and give them a gift when they've accomplished something. 

That's why we've created L360Confetti.

##iOS
Requirement: iOS 7.0 or above because this class relies heavily on [UIDynamics](https://developer.apple.com/library/ios/documentation/UIKit/Reference/UIDynamicAnimator_Class)
###Install with Cocoapods
Add the following line to your podfile:

`pod 'L360Confetti', :git => 'https://github.com/life360/confetti.git'`

And then run `pod install`

###Install manually
Copy the contents of [L360Confetti](https://github.com/life360/confetti/tree/master/iOS/L360Confetti) folder located in iOS/L360Confetti

###Use L360ConfettiArea
L360ConfettiArea is a view that you can stretch over the area of your ViewController that you wish the confetti to display over.

**Note:** The L360ConfettiArea is a UIView that retains the default settings of UIViews where `userInteractionEnabled` is `YES` and `layer.masksToBounds` is `NO` by default.

####Initialization
```smalltalk
#import "L360ConfettiArea.h"

// Wherever youre going to initialize it
L360ConfettiArea *confettiArea = [[L360ConfettiArea alloc] initWithFrame:confettiFrame];
```

####Burst Confetti
L360Confetti is currently designed to burst confetti from a single point on the view. Use the following to accomplish this.

```smalltalk
// Signature
- (void)burstAt:(CGPoint)point confettiWidth:(CGFloat)confettiWidth numberOfConfetti:(NSInteger)numberConfetti

// Use
[confettiArea burstAt:[self.view convertPoint:tapPoint toView:self.confettiView] confettiWidth:10.0 numberOfConfetti:15];
```

**Note for Confetti Width:**
Currently to give the confetti some nice fluttering effect, using layer animations for rotations along different axis, thus the confetti has to be a square.

####Confetti Colors
To control the colors of the confetti, you need to provide the L360ConfettiArea's delegate method an array of colors.

```smalltalk
confettiArea.delegate = self;

...
- (NSArray *)colorsForConfettiArea:(L360ConfettiArea *)confettiArea
{
    return @[[UIColor blueColor], [UIColor redColor], [UIColor purpleColor]];
}
```

