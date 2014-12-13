//
//  ViewControllerConfettiPlayground.m
//  L360ConfettiExample
//
//  Created by Mohammed Islam on 12/12/14.
//  Copyright (c) 2014 Life360. All rights reserved.
//

#import "ViewControllerConfettiPlayground.h"
#import "L360ConfettiArea.h"

@interface ViewControllerConfettiPlayground ()

@property (nonatomic, strong) L360ConfettiArea *confettiView;

@end

@implementation ViewControllerConfettiPlayground

- (void)loadView
{
    [super loadView];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    // Inset the view a bit to make sure that the point conversion is working properly on taps
    self.confettiView = [[L360ConfettiArea alloc] initWithFrame:CGRectMake(100.0,
                                                                           100.0,
                                                                           self.view.frame.size.width - 100.0,
                                                                           self.view.frame.size.height - 100.0)];
    
    [self.view addSubview:self.confettiView];
    
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapFrom:)];
    
    [self.view addGestureRecognizer:tapGestureRecognizer];
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
    [self.confettiView burstAt:[self.view convertPoint:tapPoint toView:self.confettiView]
                  confettiSize:CGSizeMake(10.0, 15.0)
              numberOfConfetti:15];
}

- (void)closeWindow
{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
