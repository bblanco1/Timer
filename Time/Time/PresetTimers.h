//
//  TimerModel.h
//  Time
//
//  Created by Brian Blanco on 9/1/15.
//  Copyright © 2015 Mike Kavouras. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PresetTimers : NSObject


@property NSMutableArray *allTimers;

-(void) initializeTimers;

+ (PresetTimers *)sharedInstance;

@end
