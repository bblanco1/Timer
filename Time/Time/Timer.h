//
//  Time.h
//  Time
//
//  Created by Brian Blanco on 9/1/15.
//  Copyright © 2015 Mike Kavouras. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Timer : NSObject

@property (nonatomic) NSString *timerName;
@property (nonatomic) NSTimer *startCountDownTimer;
@property (nonatomic) NSDate *countDownFrom;

-(void) initializeTimerName: (NSString *) timerName;

@end
