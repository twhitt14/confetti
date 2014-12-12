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
    
    self.confettiView = [[L360ConfettiView alloc] initWithFrame:self.view.bounds];
    
    [self.view addSubview:self.confettiView];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self.confettiView explosionAt:CGPointMake(100.0, 100.0)
                      confettiSize:CGSizeMake(10.0, 15.0)
                  numberOfConfetti:15];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
