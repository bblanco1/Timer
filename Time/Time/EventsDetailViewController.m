//
//  TimerDetailViewController.m
//  Time
//
//  Created by Brian Blanco on 9/1/15.
//  Copyright © 2015 Mike Kavouras. All rights reserved.
//

#import "EventsDetailViewController.h"


@interface EventsDetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *eventNameLabel;



@end

@implementation EventsDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.eventNameLabel.text = self.eventName;
    
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