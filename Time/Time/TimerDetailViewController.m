//
//  TimerDetailViewController.m
//  Time
//
//  Created by Brian Blanco on 9/2/15.
//  Copyright © 2015 Mike Kavouras. All rights reserved.
//

#import "TimerDetailViewController.h"

@interface TimerDetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *timerNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *timerCountDownLabel;


@end

@implementation TimerDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.timerNameLabel.text = self.timerName;
    self.timerCountDownLabel.text = self.timerCountDown;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
