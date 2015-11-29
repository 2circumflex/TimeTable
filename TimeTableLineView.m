//
//  TimeTableLineView.m
//  SmartCampus
//
//  Created by LeeRowoon on 2015. 7. 20..
//  Copyright (c) 2015년 TimeHUB. All rights reserved.
//

#import "TimeTableLineView.h"

@implementation TimeTableLineView

- (BOOL)isOpaque {
    return NO;
}

- (void)drawRect:(CGRect)rect {
    
    if (self.isHalfOfHourLine) {
        self.backgroundColor = [UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:1.0];
    } else {
        self.backgroundColor = [UIColor colorWithRed:0.6667 green:0.6667 blue:0.6667 alpha:1.0];
    }
}

@end
