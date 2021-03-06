//
//  EventViewController.h
//  Time
//
//  Created by Brian Blanco on 8/29/15.
//  Copyright © 2015 Mike Kavouras. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Events.h"
#import "PresetEvents.h"

@interface NewEventViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource, UINavigationControllerDelegate>
{
    UIDatePicker *timerPicker;
}



@property (weak, nonatomic) IBOutlet UIButton *startButton;
@property (weak, nonatomic) IBOutlet UIButton *pauseButton;
@property (weak, nonatomic) IBOutlet UILabel *countdownLabel;
@property (weak, nonatomic) IBOutlet UITextField *descriptionTextField;
@property (weak, nonatomic) IBOutlet UITextField *dateSelctionTextField;


@end
