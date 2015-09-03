//
//  TimerDetailViewController.m
//  Time
//
//  Created by Brian Blanco on 9/2/15.
//  Copyright © 2015 Mike Kavouras. All rights reserved.
//

#import "TimerDetailViewController.h"

@interface TimerDetailViewController ()
{
    int afterRemainder;
    int remainder;
}

@property (weak, nonatomic) IBOutlet UILabel *timerNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *timerCountDownLabel;


@end

@implementation TimerDetailViewController

{
    BOOL startCountDown;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.timerNameLabel.text = self.timerName;
    self.timerCountDownLabel.text = self.timerCountDown;
    
}

- (void) updateCountDown {
        
        afterRemainder --;
        
        int hours = (int)(afterRemainder/(60*60));
        int mins = (int)(((int)afterRemainder/60) - (hours * 60));
        int secs = (int)(((int)afterRemainder - (60 *mins) - (60 * hours * 60)));
    
        
        if (afterRemainder == 0) {
            
           
            [startCountDownTimer invalidate];
            startCountDownTimer = nil;
            self.countDownLabel.text = @"00 : 00 : 00";
            [self.startButton setTitle:@"Start" forState:UIControlStateNormal];
            afterRemainder = 0;
        }
    }

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
