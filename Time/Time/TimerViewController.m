//
//  TimerViewController.m
//  Time
//
//  Created by Daniel Distant on 8/22/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

#import "TimerViewController.h"

@interface TimerViewController ()  <UITextFieldDelegate>
{
    int afterRemainder;
    int remainder;
    
}

@property (strong, nonatomic) NSMutableArray *labels;
@property (strong, nonatomic) NSDateFormatter *dateFormatter;
@property (weak, nonatomic) IBOutlet UITextField *timerDescription;


@end


@implementation TimerViewController

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
    timerPicker = [[UIDatePicker alloc] init];
    timerPicker.datePickerMode = UIDatePickerModeCountDownTimer;
    [self.dateSelctionTextField setInputView:timerPicker];
    
    UIToolbar *toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    [toolBar setTintColor:[UIColor grayColor]];
    UIBarButtonItem *doneBtn = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleBordered target:self action:@selector(ShowSelectedDate)];
    UIBarButtonItem *space = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    [toolBar setItems:[NSArray arrayWithObjects:space, doneBtn, nil]];
    self.dateSelctionTextField.inputAccessoryView = toolBar;
    
                              
}

- (void)ShowSelectedDate {
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"HH 'Hours' mm 'Minutes'"];
    self.dateSelctionTextField.text=[NSString stringWithFormat:@"%@", [formatter stringFromDate:timerPicker.date]];
    [self.dateSelctionTextField resignFirstResponder];
    
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
        timerPicker.hidden = false;
        [startCountDownTimer invalidate];
        startCountDownTimer = nil;
        self.countdownLabel.text = @"00 : 00 : 00";
        [self.startButton setTitle:@"Start" forState:UIControlStateNormal];
        afterRemainder = 0;
    }
}

- (IBAction)startButtonTapped:(id)sender {
    
    if (startCountDown == false) {
    
        _countdownLabel.hidden = false;
    
    countDownTimeInterval = (NSTimeInterval)timerPicker.countDownDuration;
    remainder = countDownTimeInterval;
    afterRemainder = countDownTimeInterval - remainder%60;
    startCountDownTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(updateCountDown) userInfo:nil repeats:YES];
        
    startCountDown = true;
    
        [sender setTitle:@"Stop" forState:UIControlStateNormal];
   
    } else{
        _countdownLabel.hidden = true;
       
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
    countDownTimeInterval = (NSTimeInterval)timerPicker.countDownDuration;
    remainder = countDownTimeInterval;
    afterRemainder = countDownTimeInterval - remainder%60;
    startCountDownTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(updateCountDown) userInfo:nil repeats:YES];
    
    startCountDown = true;
    
    [sender setTitle:@"Pause" forState:UIControlStateNormal];
    }
    }


- (IBAction)doneSubmit:(UIBarButtonItem *)sender {
    
    Timer *timer = [[Timer alloc] init];
    NSString *timerName = self.timerDescription.text;
    
    [timer initializeTimerName:timerName];
    
    PresetTimers *shared = [PresetTimers sharedInstance];
    [shared.allTimers addObject:timer];
    
    NSLog(@"%@", shared.allTimers);
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)cancelButton:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}



@end
