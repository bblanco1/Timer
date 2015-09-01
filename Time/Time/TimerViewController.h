//
//  TimerViewController.h
//  Time
//
//  Created by Daniel Distant on 8/22/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

int count;

#import <UIKit/UIKit.h>
#import "Timer.h"
#import "PresetTimers.h"

@interface TimerViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource, UINavigationControllerDelegate>
{
    UIDatePicker *timerPicker;
}


//@property (weak, nonatomic) IBOutlet UIDatePicker *timerPicker;
@property (weak, nonatomic) IBOutlet UIButton *startButton;
@property (weak, nonatomic) IBOutlet UIButton *pauseButton;
@property (weak, nonatomic) IBOutlet UILabel *countdownLabel;
@property (weak, nonatomic) IBOutlet UITextField *descriptionTextField;
@property (weak, nonatomic) IBOutlet UITextField *dateSelctionTextField;



@end
    