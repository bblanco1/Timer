//
//  UserTimerViewController.m
//  Time
//
//  Created by Brian Blanco on 9/1/15.
//  Copyright © 2015 Mike Kavouras. All rights reserved.
//

#import "UserTimerViewController.h"
#import "PresetTimers.h"
#import "Timer.h"
#import "TimerDetailViewController.h"

@interface UserTimerViewController ()  <UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource>
{
    int afterRemainder;
    int remainder;
    
}

@property (nonatomic) PresetTimers *model;
@property (strong, nonatomic) NSMutableArray *labels;
@property (strong, nonatomic) NSDateFormatter *dateFormatter;
@property (weak, nonatomic) IBOutlet UIButton *startButton;
@property (weak, nonatomic) IBOutlet UIButton *pauseButton;
@property (weak, nonatomic) IBOutlet UITableView *timerPresetTableView;


@end


@implementation UserTimerViewController

{
    BOOL start;
    //NSTimer time;
    NSTimeInterval countDownTimeInterval;
    NSTimer *startCountDownTimer;
    NSDate *pauseStart, *previousFireTime;
    NSString *timeDisplay;
    BOOL startCountDown;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.model = [PresetTimers sharedInstance];
    [self.model initializeTimers];
    self.timerPresetTableView.dataSource = self;
    self.timerPresetTableView.delegate = self;
    
    startCountDown = false;
    self.countDownLabel.hidden = true;
  
    self.startButton.layer.borderWidth = 1.0;
    self.startButton.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.startButton.layer.cornerRadius = self.startButton.bounds.size.width/2;
    [self.startButton setClipsToBounds:YES];
    
    self.pauseButton.layer.borderWidth = 1.0;
    self.pauseButton.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.pauseButton.layer.cornerRadius = self.pauseButton.bounds.size.width/2;
    [self.pauseButton setClipsToBounds:YES];

    
    self.timerUserPicker.layer.borderWidth = 1.0;
    self.timerUserPicker.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.timerUserPicker.layer.cornerRadius = 10.0;
    
}

- (void)viewDidAppear:(BOOL)animated {
    
    [self.timerPresetTableView reloadData];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if([segue.destinationViewController isKindOfClass:[TimerDetailViewController class]]) {
        NSIndexPath *indexPath = [self.timerPresetTableView indexPathForSelectedRow];
        Timer *timer = [self.model.allTimers objectAtIndex:indexPath.row];
        NSString *timerName = timer.timerName;
        
        TimerDetailViewController *destination = segue.destinationViewController;
        destination.timerName = timerName;
        
    }
    
    
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    
    return [self.model.allTimers count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"timerCell" forIndexPath:indexPath];
    
    Timer *timer = [self.model.allTimers objectAtIndex:indexPath.row];
    
    NSString *timerName = [timer timerName];
    
    cell.textLabel.text = timerName;
    
    return cell;
}

- (void) updateCountDown {
    
    afterRemainder --;
    
    int hours = (int)(afterRemainder/(60*60));
    int mins = (int)(((int)afterRemainder/60) - (hours * 60));
    int secs = (int)(((int)afterRemainder - (60 *mins) - (60 * hours * 60)));
    timeDisplay = [[NSString alloc] initWithFormat:@"%02u : %02u : %02u", hours, mins, secs];
    
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
