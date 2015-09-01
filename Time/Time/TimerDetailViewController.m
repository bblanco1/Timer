//
//  TimerDetailViewController.m
//  Time
//
//  Created by Brian Blanco on 9/1/15.
//  Copyright © 2015 Mike Kavouras. All rights reserved.
//

#import "TimerDetailViewController.h"


@interface TimerDetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *timeNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeCountDownLabel;


@end

@implementation TimerDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.timeNameLabel.text = self.timerName;
    
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
