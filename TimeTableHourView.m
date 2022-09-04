//
//  TimeTableHourView.m
//  SmartCampus
//
//  Created by LeeRowoon on 2015. 7. 20..
//  Copyright (c) 2015년 TimeHUB. All rights reserved.
//

#import "TimeTableHourView.h"

@interface TimeTableHourView()

@property (strong, nonatomic) UILabel *hourLabel;

@end

@implementation TimeTableHourView

- (BOOL)isOpaque {
    return NO;
}

- (void)drawRect:(CGRect)rect {

    self.backgroundColor = [UIColor clearColor];
    
    if (!self.timeTableDate) {
        return;
    }
    
    if (!self.hourLabel) {
        self.hourLabel = [[UILabel alloc] initWithFrame:rect];
    }
    
    self.hourLabel.backgroundColor = [UIColor clearColor];
    
    NSDictionary *attributes = @{
                                 NSForegroundColorAttributeName : [UIColor blackColor],
                                 NSFontAttributeName : [UIFont fontWithName:HOUR_FONT_NAME size:HOUR_FONT_SIZE]
                                 };
    
    NSString *hourString = [self.timeTableDate stringByHourFormat];
    NSAttributedString *hourAttr = [[NSAttributedString alloc] initWithString:hourString attributes:attributes];
    
    [self.hourLabel setAttributedText:hourAttr];
    [self.hourLabel setTextAlignment:NSTextAlignmentCenter];
    
    [self addSubview:self.hourLabel];
}

@end