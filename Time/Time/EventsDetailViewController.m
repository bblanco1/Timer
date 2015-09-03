//
//  TimerDetailViewController.m
//  Time
//
//  Created by Brian Blanco on 9/1/15.
//  Copyright © 2015 Mike Kavouras. All rights reserved.
//

#import "EventsDetailViewController.h"


@interface EventsDetailViewController ()

@property (weak, nonatomic) IBOutlet UILabel *eventNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *eventTimeCountDown;






@end

@implementation EventsDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.eventNameLabel.text = self.eventName;
    self.eventTimeCountDown.text = self.eventCountDown;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
