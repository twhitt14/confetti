//
//  ViewControllerConfettiPlayground.m
//  L360ConfettiExample
//
//  Created by Mohammed Islam on 12/12/14.
//  Copyright (c) 2014 Life360. All rights reserved.
//

#import "ViewControllerConfettiPlayground.h"
#import "L360ConfettiArea.h"
#import "L360BatConfetti.h"
#import "L360CandyCorn.h"
#import "L360ConfettiSnow.h"

@interface ViewControllerConfettiPlayground ()

@property (nonatomic, strong) L360ConfettiArea *confettiView;
@property (nonatomic, assign) NSInteger numberTaps;

@end

@implementation ViewControllerConfettiPlayground

- (void)loadView
{
    [super loadView];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    // Inset the view a bit to make sure that the point conversion is working properly on taps
    self.confettiView = [[L360ConfettiArea alloc] initWithFrame:CGRectMake(0.0,
                                                                           100.0,
                                                                           self.view.frame.size.width,
                                                                           self.view.frame.size.height - 100.0 - 100.0)];
    // make the boundaries of the area clear
    self.confettiView.layer.borderWidth = 1.0;
    self.confettiView.layer.borderColor = [UIColor blackColor].CGColor;
    self.confettiView.swayLength = 20.0;
    
    [self.view addSubview:self.confettiView];
    
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapFrom:)];
    
    [self.view addGestureRecognizer:tapGestureRecognizer];
    
    UILabel *life360Label = [[UILabel alloc] initWithFrame:CGRectMake(0.0,
                                                                      self.confettiView.frame.origin.y + self.confettiView.frame.size.height,
                                                                      self.view.frame.size.width,
                                                                      self.view.frame.size.height - (self.confettiView.frame.origin.y + self.confettiView.frame.size.height))];
    life360Label.text = @"Life360 RoX!!";
    life360Label.font = [UIFont fontWithName:@"Helvetica" size:22.0];
    life360Label.textAlignment = NSTextAlignmentCenter;
    
    [self.view addSubview:life360Label];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(closeWindow)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    NSLog(@"make sure all the confetti are cleaned up properly here using debugger");
}

- (void)handleTapFrom:(UITapGestureRecognizer *)recognizer
{
    CGPoint tapPoint = [recognizer locationInView:self.view];
    
    // Make sure to convert the point so to account for the subview properly
    
    // Test Bursts

    if (!_numberTaps) {
        _numberTaps = 0;
    }

    NSInteger mod = 3;
    
    Class<L360ConfettiAble> confettiType;

    if ((self.numberTaps % mod) == 0) {
        confettiType = [L360BatConfetti class];
    } else if ((self.numberTaps % mod) == 1) {
        confettiType = [L360ConfettiSnow class];
    } else if ((self.numberTaps % mod) == 2) {
        confettiType = [L360CandyCorn class];
    } else {
        confettiType = [L360CandyCorn class];
    }

    self.numberTaps += 1;
    
    // Test blasts
    self.confettiView.blastSpread = 0.3;
    [self.confettiView blastConfettiType:confettiType
                               fromPoint:[self.view convertPoint:tapPoint toView:self.confettiView]
                                 towards:M_PI_2
                               withForce:400
                        numberOfConfetti:25];
}

- (void)closeWindow
{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

@end
