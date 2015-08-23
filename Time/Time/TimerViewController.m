//
//  TimerViewController.m
//  Time
//
//  Created by Daniel Distant on 8/22/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

#import "TimerViewController.h"

@interface TimerViewController () {
    
    int afterRemainder;
    int remainder;
    NSTimeInterval countDownInterval;
}

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

- (void) updateCountDown {
    
    afterRemainder --;
    
    int hours = (int)(afterRemainder/(60*60));
    int mins = (int)(((int)afterRemainder/60) - (hours * 60));
    int secs = (int)(((int)afterRemainder - (60 *mins) - (60 * hours * 60)));
    NSString *timeDisplay = [[NSString alloc] initWithFormat:@"%02u : %02u : %02u", hours, mins, secs];
    
    self.countdownLabel.text = timeDisplay;
}

- (IBAction)startButtonTapped:(id)sender {
    
    countDownInterval = (NSTimeInterval)_timerPicker.countDownDuration;
    remainder = countDownInterval;
    afterRemainder = countDownInterval - remainder%60;
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(updateCountDown) userInfo:nil repeats:YES];
    
    
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
