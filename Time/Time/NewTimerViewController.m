//
//  TimerViewController.m
//  Time
//
//  Created by Daniel Distant on 8/22/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

#import "NewTimerViewController.h"

@interface NewTimerViewController ()  <UITextFieldDelegate>
{
    int afterRemainder;
    int remainder;
    NSString *timeDisplay;
    
}

@property (strong, nonatomic) NSMutableArray *labels;
@property (strong, nonatomic) NSDateFormatter *dateFormatter;
@property (weak, nonatomic) IBOutlet UITextField *timerDescription;


@end


@implementation NewTimerViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    timerPicker = [[UIDatePicker alloc] init];
    timerPicker.datePickerMode = UIDatePickerModeCountDownTimer;
    [self.dateSelctionTextField setInputView:timerPicker];
    
    UIToolbar *toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    [toolBar setTintColor:[UIColor grayColor]];
    UIBarButtonItem *doneBtn = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleBordered target:self action:@selector(ShowSelectedDate)];
    UIBarButtonItem *space = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    [toolBar setItems:[NSArray arrayWithObjects:space, doneBtn, nil]];
    self.dateSelctionTextField.inputAccessoryView = toolBar;
    
                              
}

- (void)ShowSelectedDate {
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"HH 'Hours' mm 'Minutes'"];
    self.dateSelctionTextField.text=[NSString stringWithFormat:@"%@", [formatter stringFromDate:timerPicker.date]];
    [self.dateSelctionTextField resignFirstResponder];
    
}

- (IBAction)doneSubmit:(UIBarButtonItem *)sender {
    
    Timer *timer = [[Timer alloc] init];
    NSString *timerName = self.timerDescription.text;
    NSString *timeDisplay = self.dateSelctionTextField.text;
    
    [timer initializeTimerName:timerName timerCountDownDisplay:timeDisplay];
    
    PresetTimers *shared = [PresetTimers sharedInstance];
    [shared.allTimers addObject:timer];
    
    NSLog(@"%@", shared.allTimers);
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)cancelButton:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}



@end
