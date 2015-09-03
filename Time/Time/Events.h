//
//  Events.h
//  Time
//
//  Created by Brian Blanco on 9/2/15.
//  Copyright © 2015 Mike Kavouras. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Events : NSObject

@property (nonatomic) NSString *eventName;
@property (nonatomic) NSString *timeDisplay;

-(void) initializeEventName: (NSString *) eventName eventCountDownDisplay: (NSString *)timeDisplay;

@end
