//
//  ViewController.m
//  PMFlatProgressView
//
//  Created by Taku Inoue on 2013/11/28.
//  Copyright (c) 2013年 Peromasamune. All rights reserved.
//

#import "ViewController.h"
#import "PMFlatProgressView.h"

@interface ViewController ()

@property PMFlatProgressView *progressView;

-(void)startButtonDidPush:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.progressView = [[PMFlatProgressView alloc] initWithFrame:CGRectMake(0, 0, 300, 120)];
    self.progressView.center = self.view.center;
    self.progressView.borderWidth = 0;
    self.progressView.cornerRadius = 20;
    self.progressView.colorArray = [NSArray arrayWithObjects:(id)[UIColor greenColor].CGColor, (id)[UIColor yellowColor].CGColor, nil];
    self.progressView.progressBackgroundColor = [UIColor colorWithWhite:0.000 alpha:0.5];
    [self.view addSubview:self.progressView];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(0, 0,  200, 40);
    button.center = CGPointMake(self.view.frame.size.width/2, 40);
    [button setTitle:@"start" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(startButtonDidPush:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -- Button Actions --
-(void)startButtonDidPush:(id)sender{
    [self.progressView setProgress:0.8 duration:3.0 block:^(BOOL completed) {
        NSLog(@"Animation Completed");
    }];
}

@end
