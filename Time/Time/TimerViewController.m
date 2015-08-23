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
@property (nonatomic) NSTimer *timer;
@property (nonatomic) NSDate *startTime;
@property (nonatomic) NSString *time;



@end

@implementation TimerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.timerPicker.datePickerMode = UIDatePickerModeCountDownTimer;
    [self.startButton setTitle:@"Start" forState:UIControlStateNormal];
    [self.pauseButton setTitle:@"Pause" forState:UIControlStateNormal];
    
 
}



- (IBAction)startButtonTapped:(id)sender {
    
    // UIDatePicker format
    NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init];
    [outputFormatter setDateFormat:@"HH:mm:ss"];
    
    self.time = [outputFormatter stringFromDate:self.timerPicker.date];
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0
                                             target:self
                                                selector:@selector(timerPicker)
                                           userInfo:nil
                                            repeats:YES];
    
    NSLog(@"%@", self.timer);
}

    
//-(void)updateTime
//{
//    //Get the time left until the specified date
//    NSInteger ti = ((NSInteger)[self.timerPicker.date timeIntervalSinceNow]);
//    NSInteger seconds = ti % 60;
//    NSInteger minutes = (ti / 60) % 60;
//    NSInteger hours = (ti / 3600) % 24;
//    
//    //Update the label with the remaining time
//    self.countdownLabel.text = [NSString stringWithFormat:@"%02i hrs %02i min %02i sec", hours, minutes, seconds];
//}


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
