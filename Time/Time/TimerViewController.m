//
//  TimerViewController.m
//  Time
//
//  Created by Daniel Distant on 8/22/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

#import "TimerViewController.h"

@interface TimerViewController ()

@property (weak, nonatomic) IBOutlet UIDatePicker *timerPicker;
@property (weak, nonatomic) IBOutlet UIButton *startButton;
@property (weak, nonatomic) IBOutlet UIButton *pauseButton;
@property (weak, nonatomic) IBOutlet UILabel *countdownLabel;

@end

@implementation TimerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.timerPicker.datePickerMode = UIDatePickerModeCountDownTimer;
    [self.startButton setTitle:@"Start" forState:UIControlStateNormal];
    [self.pauseButton setTitle:@"Pause" forState:UIControlStateNormal];
    
 
}



- (IBAction)startButtonTapped:(id)sender {
    

    NSTimer *countDown = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timeLeft) userInfo:nil repeats:YES];
    
}

- (void) startCounting {
    
}

- (void) timeLeft {
    
    NSInteger timeLeft = ((NSInteger) [self.timerPicker.date timeIntervalSinceNow]);
    NSInteger seconds = timeLeft % 60;
    NSInteger minutes = (timeLeft / 60) % 60;
    NSInteger hours = (timeLeft / 3600) % 60;
    
    self.countdownLabel.text = [NSString stringWithFormat:@"%02i:%02i:%02i", hours, minutes, seconds];
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
