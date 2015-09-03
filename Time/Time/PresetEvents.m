//
//  PresetEvents.m
//  Time
//
//  Created by Brian Blanco on 9/2/15.
//  Copyright © 2015 Mike Kavouras. All rights reserved.
//

#import "PresetEvents.h"
#import "Events.h"

@implementation PresetEvents

+ (PresetEvents *)sharedInstance
{
    static dispatch_once_t once;
    static id sharedInstance;
    dispatch_once(&once, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

-(void) initializeEvents {

    
    self.allEvents = [[NSMutableArray alloc] init];
    
    Events *c4qGraduation = [[Events alloc] init];
    
    [c4qGraduation initializeEventName:@"C4Q Graduation" eventCountDownDisplay:@""];
    
    [self.allEvents addObject:c4qGraduation];
    
                             
                             
}

@end
