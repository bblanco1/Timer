//
//  TimerViewController.m
//  Time
//
//  Created by Daniel Distant on 8/22/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

#import "TimerViewController.h"

@interface TimerViewController ()
{
int afterRemainder;
int remainder;
}
@end

@implementation TimerViewController

{
    BOOL start;
    //NSTimer time;
    NSTimeInterval countDownTimeInterval;
    NSTimer *startCountDownTimer;
    BOOL startCountDown;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    startCountDown = false;
}

- (void) updateCountDown {
    
    afterRemainder --;
    
    int hours = (int)(afterRemainder/(60*60));
    int mins = (int)(((int)afterRemainder/60) - (hours * 60));
    int secs = (int)(((int)afterRemainder - (60 *mins) - (60 * hours * 60)));
    NSString *timeDisplay = [[NSString alloc] initWithFormat:@"%02u : %02u : %02u", hours, mins, secs];
    
    self.countdownLabel.text = timeDisplay;
    
    if (afterRemainder == 0) {
        [startCountDownTimer invalidate];
        startCountDownTimer = nil;
        self.countdownLabel.text = @"00 : 00 : 00";
        afterRemainder = 0;
    }
}

- (IBAction)startButtonTapped:(id)sender {
    
    if (startCountDown == false) {
    
        _countdownLabel.hidden = false;
        _timerPicker.hidden = true;
    countDownTimeInterval = (NSTimeInterval)_timerPicker.countDownDuration;
    remainder = countDownTimeInterval;
    afterRemainder = countDownTimeInterval - remainder%60;
    startCountDownTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(updateCountDown) userInfo:nil repeats:YES];
        
    startCountDown = true;
    
        [sender setTitle:@"Stop" forState:UIControlStateNormal];
   
    } else {
        _countdownLabel.hidden = true;
        _timerPicker.hidden = false;
        startCountDown = false;
        [startCountDownTimer invalidate];
        startCountDown = nil;
        self.countdownLabel.text =@"00 : 00 : 00";
        [sender setTitle:@"Start" forState:UIControlStateNormal];
    }
}



- (IBAction)pauseButtonTapped:(id)sender {
    
}




@end
