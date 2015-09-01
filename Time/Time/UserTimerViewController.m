//
//  UserTimerViewController.m
//  Time
//
//  Created by Brian Blanco on 9/1/15.
//  Copyright © 2015 Mike Kavouras. All rights reserved.
//

#import "UserTimerViewController.h"

@interface UserTimerViewController ()  <UITextFieldDelegate>
{
    int afterRemainder;
    int remainder;
    
}

@property (strong, nonatomic) NSMutableArray *labels;
@property (strong, nonatomic) NSDateFormatter *dateFormatter;


@end


@implementation UserTimerViewController

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

- (void)ShowSelectedDate {
    
    
}


- (void) updateCountDown {
    
    afterRemainder --;
    
    int hours = (int)(afterRemainder/(60*60));
    int mins = (int)(((int)afterRemainder/60) - (hours * 60));
    int secs = (int)(((int)afterRemainder - (60 *mins) - (60 * hours * 60)));
    NSString *timeDisplay = [[NSString alloc] initWithFormat:@"%02u : %02u : %02u", hours, mins, secs];
    
    self.countDownLabel.text = timeDisplay;
    
    if (afterRemainder == 0) {
        
        _countDownLabel.hidden = true;
        _timerUserPicker.hidden = false;
        [startCountDownTimer invalidate];
        startCountDownTimer = nil;
        self.countDownLabel.text = @"00 : 00 : 00";
        [self.startButton setTitle:@"Start" forState:UIControlStateNormal];
        afterRemainder = 0;
    }
}

- (IBAction)startButtonTapped:(id)sender {
    
    if (startCountDown == false) {
        
        
        _countDownLabel.hidden = false;
        _timerUserPicker.hidden = true;
        countDownTimeInterval = (NSTimeInterval)_timerUserPicker.countDownDuration;
        remainder = countDownTimeInterval;
        afterRemainder = countDownTimeInterval - remainder%60;
        startCountDownTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(updateCountDown) userInfo:nil repeats:YES];
        
        startCountDown = true;
        
        [sender setTitle:@"Stop" forState:UIControlStateNormal];
        
    } else{
        
        _countDownLabel.hidden = true;
        _timerUserPicker.hidden = false;
        startCountDown = false;
        [startCountDownTimer invalidate];
        startCountDown = nil;
        self.countDownLabel.text =@"00 : 00 : 00";
        [sender setTitle:@"Start" forState:UIControlStateNormal];
        
    }
}



- (IBAction)pauseButtonTapped:(id)sender {
    
    if (startCountDown == true) {
        [sender setTitle:@"Resume" forState:UIControlStateNormal];
        [startCountDownTimer invalidate];
        startCountDown = false;
        
    } else if  (startCountDown == false){
        countDownTimeInterval = (NSTimeInterval)_timerUserPicker.countDownDuration;
        remainder = countDownTimeInterval;
        afterRemainder = countDownTimeInterval - remainder%60;
        startCountDownTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(updateCountDown) userInfo:nil repeats:YES];
        
        startCountDown = true;
        
        [sender setTitle:@"Pause" forState:UIControlStateNormal];
    }
}





@end
