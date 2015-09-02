//
//  UserTimerViewController.h
//  Time
//
//  Created by Brian Blanco on 9/1/15.
//  Copyright © 2015 Mike Kavouras. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserTimerViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIDatePicker *timerUserPicker;
@property (weak, nonatomic) IBOutlet UILabel *countDownLabel;


@end
