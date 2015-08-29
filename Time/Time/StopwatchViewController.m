//
//  StopwatchViewController.m
//  Time
//
//  Created by Daniel Distant on 8/22/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

#import "StopwatchViewController.h"

@interface StopwatchViewController () <UITableViewDelegate, UITableViewDataSource,AVAudioPlayerDelegate>

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
@property (nonatomic) NSTimeInterval timeElapsed;

@property (nonatomic) AVAudioPlayer *audioPlayer;
@property (nonatomic) BOOL songStarted;

@property (strong, nonatomic) IBOutlet UISwipeGestureRecognizer *swipeGestureRecognizer;

@property (nonatomic) NSArray *backgroundsArray;

@end

@implementation StopwatchViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.lapTableview.dataSource = self;
    self.lapTableview.delegate = self;
    self.lapTimes = [[NSMutableArray alloc] init];
    
    self.startButton.layer.borderWidth = 2.0;
    self.startButton.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.startButton.layer.cornerRadius = self.startButton.bounds.size.width/2;
    [self.startButton setClipsToBounds:YES];
    
    self.lapButton.layer.borderWidth = 2.0;
    self.lapButton.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.lapButton.layer.cornerRadius = self.startButton.bounds.size.width/2;
    [self.lapButton setClipsToBounds:YES];
    
    self.lapTableview.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.lapTableview.layer.borderWidth = 2.0;
    self.lapTableview.layer.cornerRadius = 10.0;
    
}


- (IBAction)startButtonTapped:(id)sender {
    
    //make sure button text is "Start"
    
    if ([self.startButton.titleLabel.text isEqualToString:@"Start"]) {
        
        [self startButtonMethods];
        
    } else if (![self.startButton.titleLabel.text isEqualToString:@"Start"]) {
        
        [self stopButtonMethods];
    }
    
}

- (void) startButtonMethods {
    
    //set start time
    
    self.startTime = [NSDate date];
    
    //create timer and add to run loop
    
    self.stopwatchTimer = [NSTimer timerWithTimeInterval:1/60.0 target:self selector:@selector(stopwatchTimerFiring:) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.stopwatchTimer forMode:NSRunLoopCommonModes];
    
    //change button label
    
    [self changeButtonLabel];
    
    //pick song to play with timer
    
    if (!(self.songStarted)) {
        
        [self playSong:@"backwards"];
        
    } else if (self.songStarted) {
        
        [self resumeSong];
    }
}

- (void) playSong: (NSString *) song {
    
    song = [NSString stringWithFormat:@"%@/" "%@" ".mp3", [[NSBundle mainBundle] resourcePath], song];
    NSURL *songUrl = [NSURL fileURLWithPath: song];
    
    self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL: songUrl error:nil];
    
    self.audioPlayer.delegate = self;
    
    [self.audioPlayer setVolume:0.8];
    
    [self.audioPlayer play];
    
    self.audioPlayer.numberOfLoops = -1;
    
    [self setSongStarted:YES];
    
}

- (void) resumeSong {
    
    [self.audioPlayer play];
}

- (void) stopButtonMethods {
    
    //set stop time
    
    NSDate *stopTime = [NSDate date];
    
    //set time elapsed between start and stop times
    
    self.timeElapsed = [stopTime timeIntervalSinceDate:self.startTime];
    self.totalTime = self.totalTime + self.timeElapsed;
    
    NSTimeInterval lapTimeElapsed = [stopTime timeIntervalSinceDate:self.lapStartTime];
    self.totalLapTime = self.totalLapTime + lapTimeElapsed;
    
    //stop timers
    
    [self.lapTimer invalidate];
    [self.stopwatchTimer invalidate];
    
    //pause audio and get time interval for pause
    
    [self.audioPlayer pause];
    [self.audioPlayer setCurrentTime:self.timeElapsed];
    
    //set button text to "start"
    
    [self changeButtonLabel];
}

- (IBAction)lapButtonTapped:(id)sender {
    
    //Check that button doesn not say "Reset"
    
    if (![self.lapButton.titleLabel.text isEqualToString:@"Reset"]) {
        
        //set start time
        
        self.lapStartTime = [NSDate date];
        
        //create timer
        
        if (self.lapTimer) {
            
            [self.lapTimer invalidate];
        }
        self.lapTimer = [NSTimer timerWithTimeInterval:1/60.0 target:self selector:@selector(lapTimerFiring:) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:self.lapTimer forMode:NSRunLoopCommonModes];
        
        //add lap to beginning of array so most recent lap is highest up
        
        [self.lapTimes insertObject:self.lapTimeLabel.text atIndex:0];
        
        [self.lapTableview reloadData];
    }
}

-(void) stopwatchTimerFiring: (NSTimer *)timer {
    
    //get current time
    
    NSDate *now = [NSDate date];
    
    //get total time elapsed in session
    
    self.timeSession = [now timeIntervalSinceDate:self.startTime];
    self.timeElapsed = self.totalTime + self.timeSession;
    
    //update time label
    
    self.stopwatchLabel.text = [NSString stringWithFormat:@"%0.2f",self.timeElapsed];
}

-(void) lapTimerFiring:(NSTimer *)timer {
    
    //get current time when lap started
    
    NSDate *now = [NSDate date];
    
    //get total time elapsed in lap session
    
    NSTimeInterval lapSession = [now timeIntervalSinceDate:self.lapStartTime];
    self.timeElapsed = self.totalLapTime + lapSession;
    
    //update time label
    
    self.lapTimeLabel.text = [NSString stringWithFormat:@"%0.2f", self.timeElapsed];
    
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
        [self.audioPlayer stop];
        [self.audioPlayer setCurrentTime:0];
        
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
    
    cell.textLabel.text = self.lapTimes[indexPath.row];
    
    cell.detailTextLabel.text = [NSString stringWithFormat: @"Lap %ld", [self.lapTimes count] - indexPath.row - 1];
     
    return cell;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        //swipe to delete
        
        [self.lapTimes removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationLeft];
    }
}

- (IBAction)swipeGestureRecognizerSwiped:(id)sender {
    
    
}



@end
