//
//  EventViewController.m
//  Time
//
//  Created by Brian Blanco on 8/29/15.
//  Copyright © 2015 Mike Kavouras. All rights reserved.
//

#import "EventViewController.h"

@interface EventViewController ()
{
    int afterRemainder;
    int remainder;
}
@end

@implementation EventViewController

{
    BOOL start;
    //NSTimer time;
    NSTimeInterval countDownTimeInterval;
    NSTimer *startCountDownTimer;
    NSDate *pauseStart, *previousFireTime;
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
        
        _countdownLabel.hidden = true;
        _timerPicker.hidden = false;
        [startCountDownTimer invalidate];
        startCountDownTimer = nil;
        self.countdownLabel.text = @"00 : 00 : 00";\
        [self.startButton setTitle:@"Start" forState:UIControlStateNormal];
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
        
    } else{
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
    
    if (startCountDown == true) {
        [sender setTitle:@"Resume" forState:UIControlStateNormal];
        [startCountDownTimer invalidate];
        startCountDown = false;
        
    } else if  (startCountDown == false){
        countDownTimeInterval = (NSTimeInterval)_timerPicker.countDownDuration;
        remainder = countDownTimeInterval;
        afterRemainder = countDownTimeInterval - remainder%60;
        startCountDownTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(updateCountDown) userInfo:nil repeats:YES];
        
        startCountDown = true;
        
        [sender setTitle:@"Pause" forState:UIControlStateNormal];
    }
}


- (IBAction)doneSubmit:(UIBarButtonItem *)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}





@end