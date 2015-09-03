//
//  TimerDetailViewController.m
//  Time
//
//  Created by Brian Blanco on 9/2/15.
//  Copyright © 2015 Mike Kavouras. All rights reserved.
//

#import "TimerDetailViewController.h"

@interface TimerDetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *timerNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *timerCountDownLabel;


@end

@implementation TimerDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.timerNameLabel.text = self.timerName;
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
