//
//  DatePickerTableViewCell.m
//  Time
//
//  Created by Brian Blanco on 8/29/15.
//  Copyright © 2015 Mike Kavouras. All rights reserved.
//

#import "DatePickerTableViewCell.h"

@implementation DatePickerTableViewCell

- (UIDatePicker *)datePicker {
    
    if (_datePicker)
        return _datePicker;
        
        _datePicker = [[UIDatePicker alloc] init];
        
        return _datePicker;
    
}

- (UIView *) inputView {
    
    return self.datePicker;
    
}

- (BOOL) canBecomeFirstResponder {
    
    return YES;
    
}

- (void) setSelected:(BOOL)selected animated:(BOOL)animated {
    
    [super setSelected:selected animated:animated];
    
    if (selected) {
        [self becomeFirstResponder];
    } else
        [self resignFirstResponder]
        ;}

@end
