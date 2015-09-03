//
//  EventViewController.m
//  Time
//
//  Created by Brian Blanco on 8/29/15.
//  Copyright © 2015 Mike Kavouras. All rights reserved.
//

#import "NewEventViewController.h" 

@interface NewEventViewController() <UITextFieldDelegate>
{
    int afterRemainder;
    int remainder;
    NSString *timeDisplay;
    
}

@property (strong, nonatomic) NSMutableArray *labels;
@property (strong, nonatomic) NSDateFormatter *dateFormatter;
@property (weak, nonatomic) IBOutlet UITextField *eventDescription;


@end


@implementation NewEventViewController

{
    BOOL start;
    //NSTimer time;
    NSTimeInterval countDownTimeInterval;
    NSTimer *startCountDownTimer;
    NSDate *pauseStart, *previousFireTime;
    BOOL startCountDown;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.eventDescription.layer.borderWidth = 1.0;
    self.eventDescription.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.eventDescription.layer.cornerRadius = 10.0;
    
    self.dateSelctionTextField.layer.borderWidth = 1.0;
    self.dateSelctionTextField.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.dateSelctionTextField.layer.cornerRadius = 10.0;
    
    
    startCountDown = false;
    timerPicker = [[UIDatePicker alloc] init];
    timerPicker.datePickerMode = UIDatePickerModeDateAndTime;
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
    [formatter setDateFormat:@"d 'Days' hh 'Hours' mm 'Minutes'"];
    self.dateSelctionTextField.text=[NSString stringWithFormat:@"%@", [formatter stringFromDate:timerPicker.date]];
    [self.dateSelctionTextField resignFirstResponder];
    
}


- (IBAction)doneSubmit:(UIBarButtonItem *)sender {
    
    Events *event = [[Events alloc] init];
    NSString *eventName = self.eventDescription.text;
    NSString *timeDisplay = self.dateSelctionTextField.text;
    
    [event initializeEventName:eventName eventCountDownDisplay:timeDisplay];
    
    PresetEvents *shared = [PresetEvents sharedInstance];
    [shared.allEvents addObject:event];
    
    NSLog(@"%@", shared.allEvents);
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)cancelButton:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}





@end
