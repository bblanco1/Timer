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

@end

@implementation StopwatchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.startButton setTitle:@"Start" forState:UIControlStateNormal];
    self.timerRunning = NO;
    
}
- (IBAction)startButtonTapped:(id)sender {
    
    if (self.timerRunning) {
        // stop the timer
        //update button to say start
    } else {
        
        //start timer
        //update button to say start
    }
    
    [self.startButton setTitle:@"Stop" forState:UIControlStateNormal];
    self.timerRunning = !self.timerRunning;
    
    NSTimer *stopwatchTimer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(startButtonTapped:) userInfo:nil repeats:YES];
    
    NSInteger currentNumber = [self.stopwatchLabel.text integerValue];
    NSInteger nextNumber = currentNumber + 1;
    
    self.stopwatchLabel.text = [NSString stringWithFormat:@"%lu", nextNumber];
    
    [[NSRunLoop currentRunLoop] addTimer:stopwatchTimer forMode: NSDefaultRunLoopMode];
    
    NSLog(@"%@", self.startButton.currentTitle);
    
    if (self.timerRunning) {
        
        [self.startButton setTitle:@"Start" forState:UIControlStateNormal];
        [stopwatchTimer invalidate];
        
    }
}

- (IBAction)lapButtonTapped:(id)sender {
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
