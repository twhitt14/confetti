//
//  ViewController.m
//  L360ConfettiExample
//
//  Created by Mohammed Islam on 12/11/14.
//  Copyright (c) 2014 Life360. All rights reserved.
//

#import "ViewController.h"
#import "ViewControllerConfettiPlayground.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)loadView
{
    [super loadView];

}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)ConfettiPlaygroundSelected:(id)sender
{
    ViewControllerConfettiPlayground *confettiPlayground = [[ViewControllerConfettiPlayground alloc] init];
    
    [self presentViewController:[[UINavigationController alloc] initWithRootViewController:confettiPlayground] animated:YES completion:^{
        
    }];
}

@end
