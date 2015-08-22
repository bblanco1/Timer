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
@property (nonatomic) BOOL timerRunning;
@property (nonatomic) NSTimer *stopwatchTimer;
@property (nonatomic) NSDate *startTime;
@property (nonatomic) NSDate *lapTime;
@property (nonatomic) NSMutableArray *lapTimes;


@end

@implementation StopwatchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.startButton setTitle:@"Start" forState:UIControlStateNormal];
    !self.timerRunning;
    
    self.lapTimes = [[NSMutableArray alloc] init];
}

-(void) createTimer {
   
    NSTimer *stopwatchTimer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(updateTimer) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:stopwatchTimer forMode: NSDefaultRunLoopMode];
    self.stopwatchTimer = stopwatchTimer;
    
}

-(void) updateTimer {
    NSDate *currentTime = [NSDate date];
    NSTimeInterval timeInterval = [currentTime timeIntervalSinceDate:self.startTime];
    NSDate *timerDate = [NSDate dateWithTimeIntervalSince1970:timeInterval];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    [dateFormatter setDateFormat:@"mm:ss:SS"];
//    [dateFormatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0.0]]; *** we may not need this ***
    NSString *timeString = [dateFormatter stringFromDate: timerDate];
    
    self.stopwatchLabel.text = timeString;

}

- (IBAction)startButtonTapped:(id)sender {
    if (!self.timerRunning) {
    
        [self createTimer];
        self.startTime = [NSDate date];
        [self updateTimer];
        
        [self.startButton setTitle:@"Stop" forState:UIControlStateNormal];
        self.timerRunning;
    }
}

- (IBAction)stopButtonTapped:(id)sender {
    if (self.timerRunning) {
        
        [self.stopwatchTimer isValid];
        [self.startButton setTitle:@"Start" forState:UIControlStateNormal];
        !self.timerRunning;
        [self.stopwatchTimer invalidate];
        
        
    }
}

- (IBAction)lapButtonTapped:(id)sender {
    self.lapTime = [NSDate date];
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
