//
//  TimerViewController.h
//  Time
//
//  Created by Daniel Distant on 8/22/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TimerViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIDatePicker *timerPicker;
@property (weak, nonatomic) IBOutlet UIButton *startButton;
@property (weak, nonatomic) IBOutlet UIButton *pauseButton;

@end
