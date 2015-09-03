//
//  Time.m
//  Time
//
//  Created by Brian Blanco on 9/1/15.
//  Copyright © 2015 Mike Kavouras. All rights reserved.
//

#import "Timer.h"

@implementation Timer

-(void) initializeTimerName: (NSString *) timerName timerCountDownDisplay: (NSString *)timeDisplay{
    
    self.timerName = timerName;
    self.timeDisplay = timeDisplay;
}

@end
