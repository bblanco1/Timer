//
//  StopwatchViewController.m
//  Time
//
//  Created by Daniel Distant on 8/22/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

#import "StopwatchViewController.h"

@interface StopwatchViewController () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UILabel *stopwatchLabel;
@property (weak, nonatomic) IBOutlet UIButton *startButton;
@property (weak, nonatomic) IBOutlet UIButton *lapButton;
@property (weak, nonatomic) IBOutlet UITableView *lapTableView;

@property (nonatomic) NSTimer *stopwatchTimer;
@property (nonatomic) NSDate *startTime;
@property (nonatomic) NSTimeInterval totalTime;
@property (nonatomic) NSTimeInterval timeSession;

@property (nonatomic) NSTimeInterval lapTime;
@property (nonatomic) NSMutableArray *lapTimes;


@end

@implementation StopwatchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //[self.startButton setTitle:@"Start" forState:UIControlStateNormal];
    
    self.lapTimes = [[NSMutableArray alloc] init];
}


- (IBAction)startButtonTapped:(id)sender {
    
    //make sure button text is "Start"
    
    if ([self.startButton.titleLabel.text isEqualToString:@"Start"]) {
        
        //set start time
        
        self.startTime = [NSDate date];
        
        //create timer and add to run loop
        
        self.stopwatchTimer = [NSTimer timerWithTimeInterval:1/60.0 target:self selector:@selector(stopwatchTimerFiring:) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:self.stopwatchTimer forMode:NSRunLoopCommonModes];
        
        //change button label
        
        [self changeButtonLabel];
    }
    
}

- (IBAction)stopButtonTapped:(id)sender {
    
    //make sure button text is not "Start"
    
    if (![self.startButton.titleLabel.text isEqualToString:@"Start"]) {
        
        //set stop time
        
        NSDate *stopTime = [NSDate date];
        
        //set time elapsed between start and stop times
        
        NSTimeInterval timeElapsed = [stopTime timeIntervalSinceDate:self.startTime];
        self.totalTime = self.totalTime + timeElapsed;
        
        //stop timer
        
        [self.stopwatchTimer invalidate];
        
        //set button text to "start"
        
        [self changeButtonLabel];
    }
    
}

-(void) stopwatchTimerFiring: (NSTimer *)timer {
    
    //get current time
    
    NSDate *now = [NSDate date];
    
    //get total time elapsed in session
    
    self.timeSession = [now timeIntervalSinceDate:self.startTime];
    NSTimeInterval timeElapsed = self.totalTime + self.timeSession;
    
    //update time label
    
    self.stopwatchLabel.text = [NSString stringWithFormat:@"%0.2f",timeElapsed];
}

-(void) changeButtonLabel {
    
    //whatever the button label is, change it to the opposite
    
    if ([self.startButton.titleLabel.text isEqualToString:@"Start"]) {
        
        [self.startButton setTitle:@"Stop" forState:UIControlStateNormal];
        [self.lapButton setTitle:@"Lap" forState:UIControlStateNormal];
        
    } else {
        
        [self.startButton setTitle:@"Start" forState: UIControlStateNormal];
        [self.lapButton setTitle:@"Reset" forState:UIControlStateNormal];
    }
    
}

- (IBAction)lapButtonTapped:(id)sender {
    
    if ([self.lapButton.titleLabel.text isEqualToString:@"Reset"]) {
        
        NSLog(@"Reset bruh");
        
        [self.stopwatchTimer invalidate];
        
        self.stopwatchLabel.text = @"0.00";
        
        self.totalTime = 0;
        
    } else {
    
    //get current time
    
    NSDate *lap = [NSDate date];
    
    //get total time elapsed in lap
    
    NSTimeInterval lapCurrentTime = [lap timeIntervalSinceDate:self.startTime];
    NSLog(@"%f", lapCurrentTime);
        
    }
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView  {
    
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.lapTimes.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"stopwatchCell" forIndexPath:indexPath];
    
    return cell;
}



@end
