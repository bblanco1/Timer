//
//  TimerViewController.m
//  Time
//
//  Created by Daniel Distant on 8/22/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

#import "TimerViewController.h"

@interface TimerViewController ()

@end

@implementation TimerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.timerPicker.datePickerMode = UIDatePickerModeCountDownTimer;
    [startButton setTitle:@"Start" forState:UIControlStateSelected];
    [startButton setTitle:@"Stop" forState:UIControlStateNormal];
    
 
}
- (IBAction)startButtonTapped:(id)sender {
    
    NSDateFormatter *outputFormat = [[NSDateFormatter alloc] init];
    [outputFormat setDateFormat:@"HH:mm:ss"];
    
    NSLog(@"%@",[outputFormat stringFromDate:self.timerPicker.date]);
    self.countdownLabel.text = [outputFormat stringFromDate:self.timerPicker.date];
    
    

    
}
- (IBAction)pauseButtonTapped:(id)sender {
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
