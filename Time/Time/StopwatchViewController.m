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

@property (nonatomic) NSTimer *stopwatchTimer;
@property (nonatomic) NSDate *startTime;
@property (nonatomic) NSTimeInterval totalTime;
@property (nonatomic) NSTimeInterval timeSession;

@property (nonatomic) NSTimeInterval lapTime;
@property (nonatomic) NSMutableArray *lapTimes;
@property (nonatomic) NSTimer *lapTimer;
@property (weak, nonatomic) IBOutlet UILabel *lapTimeLabel;
@property (weak, nonatomic) IBOutlet UITableView *lapTableview;
@property (nonatomic) NSDate *lapStartTime;
@property (nonatomic) NSTimeInterval totalLapTime;


@end

@implementation StopwatchViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.lapTableview.dataSource = self;
    self.lapTableview.delegate = self;
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
        
        NSTimeInterval lapTimeElapsed = [stopTime timeIntervalSinceDate:self.lapStartTime];
        self.totalLapTime = self.totalLapTime + lapTimeElapsed;
        
        //stop timers
        
        [self.stopwatchTimer invalidate];
        [self.lapTimer invalidate];
        
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
        
        //color stuff
        
//        StopwatchViewController *viewcontroller = [[StopwatchViewController alloc] init];
//        [viewcontroller.view.layer setBackgroundColor: [UIColor colorWithRed:0.521569 green:0.768627 blue:0.254902 alpha:1].CGColor];
        
    } else {
        
        [self.startButton setTitle:@"Start" forState: UIControlStateNormal];
        [self.lapButton setTitle:@"Reset" forState:UIControlStateNormal];
    
    }
    
}

- (IBAction)lapButtonTapped:(id)sender {
    
    //Check that button doesn not say "Reset"
    
    if (![self.lapButton.titleLabel.text isEqualToString:@"Reset"]) {
        
        //set start time
        
        self.lapStartTime = [NSDate date];
        
        //create timer
        
        self.lapTimer = [NSTimer timerWithTimeInterval:1/60.0 target:self selector:@selector(lapTimerFiring:) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:self.lapTimer forMode:NSRunLoopCommonModes];
        
        //add lap to beginning of array so most recent lap is highest up
        
        [self.lapTimes insertObject:self.lapTimeLabel.text atIndex:0];
        
        [self.lapTableview reloadData];
    }
}

- (IBAction)resetButtonTapped:(id)sender {
    
    //make sure button says "Reset" before resetting
    
    if ([self.lapButton.titleLabel.text isEqualToString:@"Reset"]) {
        
        //reset timer
        
        self.stopwatchLabel.text = @"00:00:00";
        self.lapTimeLabel.text = @"00:00";
        self.totalLapTime = 0;
        self.totalTime = 0;
        [self.stopwatchTimer invalidate];
        [self.lapTimer invalidate];
        [self.lapTimes removeAllObjects];
        [self.lapTableview reloadData];
        
    }
}


-(void) lapTimerFiring:(NSTimer *)timer {
   
    //get current time when lap started
    
    NSDate *now = [NSDate date];
    
    //get total time elapsed in lap session
    
    NSTimeInterval lapSession = [now timeIntervalSinceDate:self.lapStartTime];
    NSTimeInterval timeElapsed = self.totalLapTime + lapSession;
    
    //update time label
    
    self.lapTimeLabel.text = [NSString stringWithFormat:@"%0.2f", timeElapsed];
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView  {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.lapTimes.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"stopwatchCell" forIndexPath:indexPath];
    
    cell.textLabel.text = self.lapTimes[indexPath.row];
    
//    cell.detailTextLabel.text = [NSString stringWithFormat: @"Lap %ld", [self.lapTimes count] - indexPath.row - 1];
    
    cell.detailTextLabel.text = [NSString stringWithFormat: @"Lap %ld", [self.lapTimes count] - indexPath.row - 1];
     
    return cell;
}



@end
