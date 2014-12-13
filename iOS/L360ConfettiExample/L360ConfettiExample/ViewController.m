//
//  ViewController.m
//  L360ConfettiExample
//
//  Created by Mohammed Islam on 12/11/14.
//  Copyright (c) 2014 Life360. All rights reserved.
//

#import "ViewController.h"
#import "L360ConfettiView.h"

@interface ViewController ()

@property (nonatomic, strong) L360ConfettiView *confettiView;

@end

@implementation ViewController

- (void)loadView
{
    [super loadView];
    
    self.confettiView = [[L360ConfettiView alloc] initWithFrame:CGRectMake(100.0,
                                                                           100.0,
                                                                           self.view.frame.size.width - 100.0,
                                                                           self.view.frame.size.height - 100.0)];
    
    [self.view addSubview:self.confettiView];
    
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapFrom:)];
    
    [self.view addGestureRecognizer:tapGestureRecognizer];
}

- (void)handleTapFrom:(UITapGestureRecognizer *)recognizer
{
    CGPoint tapPoint = [recognizer locationInView:self.view];
    
    // Make sure to convert the point so to account for the subview properly
    [self.confettiView burstAt:[self.view convertPoint:tapPoint toView:self.confettiView]
                  confettiSize:CGSizeMake(10.0, 15.0)
              numberOfConfetti:15];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
