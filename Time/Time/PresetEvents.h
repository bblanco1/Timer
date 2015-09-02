//
//  PresetEvents.h
//  Time
//
//  Created by Brian Blanco on 9/2/15.
//  Copyright © 2015 Mike Kavouras. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PresetEvents : NSObject

@property NSMutableArray *allEvents;

-(void) initializeEvents;

+ (PresetEvents *)sharedInstance;

@end
