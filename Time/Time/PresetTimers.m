//
//  TimerModel.m
//  Time
//
//  Created by Brian Blanco on 9/1/15.
//  Copyright © 2015 Mike Kavouras. All rights reserved.
//

#import "PresetTimers.h"
#import "Timer.h"

@implementation PresetTimers

+ (PresetTimers *)sharedInstance
{
    static dispatch_once_t once;
    static id sharedInstance;
    dispatch_once(&once, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

-(void) initializeTimers {
    
    self.allTimers = [[NSMutableArray alloc] init];
    
    Timer *popCorn = [[Timer alloc] init];
    
    [popCorn initializeTimerName:@"Popcorn Countdown!"];
    
    [self.allTimers addObject:popCorn];
    
    Timer *laundryWash = [[Timer alloc] init];
    
    [laundryWash initializeTimerName:@"Laundry Wash Cycle"];
    
    [self.allTimers addObject:laundryWash];
    
    Timer *laundryDry = [[Timer alloc] init];
    
    [laundryDry initializeTimerName:@"Laundry Drying"];
    [self.allTimers addObject:laundryDry];
    
}

@end
