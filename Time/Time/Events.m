//
//  Events.m
//  Time
//
//  Created by Brian Blanco on 9/2/15.
//  Copyright © 2015 Mike Kavouras. All rights reserved.
//

#import "Events.h"

@implementation Events

-(void) initializeEventName: (NSString *) eventName eventCountDownDisplay: (NSString *)timeDisplay {
    
    self.eventName = eventName;
    self.timeDisplay = timeDisplay;
}


@end
