//
//  EventViewController.h
//  Time
//
//  Created by Brian Blanco on 8/29/15.
//  Copyright © 2015 Mike Kavouras. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EventViewController : UIViewController
{
    UIDatePicker *datePicker;
}


@property (weak, nonatomic) IBOutlet UIDatePicker *timerPicker;
@property (weak, nonatomic) IBOutlet UIButton *startButton;
@property (weak, nonatomic) IBOutlet UIButton *pauseButton;
@property (weak, nonatomic) IBOutlet UILabel *countdownLabel;
@property (weak, nonatomic) IBOutlet UITextField *descriptionTextField;
@property (weak, nonatomic) IBOutlet UITextField *dateSelctionTextField;


@end
