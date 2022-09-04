//
//  TimeTableDate.m
//  SmartCampus
//
//  Created by LeeRowoon on 2015. 7. 20..
//  Copyright (c) 2015년 TimeHUB. All rights reserved.
//

#import "TimeTableDate.h"

@implementation TimeTableDate

- (instancetype)init {
    
    self = [super init];
    
    if (self) {
        
        self.date = [TimeTableDate fixedYearMonthDay];
        
        [TimeTableDate printDate:self.date];
    }
    
    return self;
}

- (BOOL)isEqual:(id)object {
    
    if ([object isKindOfClass:[TimeTableDate class]]) {
        
        TimeTableDate *otherDate = (TimeTableDate *)object;
        
        if ([self.date isEqual:otherDate.date]) {
            return YES;
        } else {
            return NO;
        }
    }
    
    return NO;
}

- (id)copyWithZone:(NSZone *)zone {
    TimeTableDate *another = [[TimeTableDate alloc] init];
    another.date = [self.date copyWithZone:zone];
    return another;
}

+ (NSDate *)fixedYearMonthDay {
    
    NSDate *date = [NSDate date];
    unsigned unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth |  NSCalendarUnitDay;
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *comps = [calendar components:unitFlags fromDate:date];
    comps.year = FIXED_YEAR;
    comps.month = FIXED_MONTH;
    comps.day = FIXED_DAY;
    NSDate *fixedYearMonthDay = [calendar dateFromComponents:comps];
    
    [TimeTableDate printDate:fixedYearMonthDay];
    
    return fixedYearMonthDay;
}

+ (void)printDate:(NSDate *)date {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    
    NSString *hourString = [dateFormatter stringFromDate:date];
    NSLog(@"Date : %@", hourString);
}

+ (NSDate *)dateFromHourString:(NSString *)string {
    NSInteger hour = [string integerValue];
    
    NSDate *date = [TimeTableDate fixedYearMonthDay];
    unsigned unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth |  NSCalendarUnitDay | NSCalendarUnitHour;
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *comps = [calendar components:unitFlags fromDate:date];
    comps.hour = hour;
    NSDate *newDate = [calendar dateFromComponents:comps];
    
    [TimeTableDate printDate:newDate];
    
    return newDate;
}

+ (NSDate *)dateFromHourMinuteString:(NSString *)string {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:HOUR_MINUTE_DATE_FORMAT];
    NSDate *date = [dateFormatter dateFromString:string];
    
    if (date) {
        unsigned unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth |  NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute;
        NSCalendar *calendar = [NSCalendar currentCalendar];
        NSDateComponents *comps = [calendar components:unitFlags fromDate:date];
        comps.year = FIXED_YEAR;
        comps.month = FIXED_MONTH;
        comps.day = FIXED_DAY;
        NSDate *fixedYearMonthDay = [calendar dateFromComponents:comps];
        
        [TimeTableDate printDate:fixedYearMonthDay];
        
        return fixedYearMonthDay;
        
    } else {
        return nil;
    }
}

- (void)setHour:(NSInteger)hour {
    
    unsigned unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour;
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *comps = [calendar components:unitFlags fromDate:self.date];
    comps.hour = hour;
    
    self.date = [calendar dateFromComponents:comps];
    
    [TimeTableDate printDate:self.date];
}

- (void)setMinute:(NSInteger)minute {
    
    unsigned unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute;
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *comps = [calendar components:unitFlags fromDate:self.date];
    comps.minute = minute;
    
    self.date = [calendar dateFromComponents:comps];
    
    [TimeTableDate printDate:self.date];
}

- (void)setHour:(NSInteger)hour withMinute:(NSInteger)minute {
    [self setHour:hour];
    [self setMinute:minute];
}

- (void)selfDateByAddingHalfOfHourInterval {
    self.date = [self.date dateByAddingTimeInterval:HALF_OF_HOUR_SECOND];
    [TimeTableDate printDate:self.date];
}

- (NSDate *)dateByAddingHalfOfHourInterval {
    NSDate *date = [self.date dateByAddingTimeInterval:HALF_OF_HOUR_SECOND];
    return date;
}

- (void)selfDateByAddingHourInterval {
    self.date = [self.date dateByAddingTimeInterval:HOUR_SECOND];
    [TimeTableDate printDate:self.date];
}

- (NSDate *)dateByAddingHourInterval {
    NSDate *date = [self.date dateByAddingTimeInterval:HOUR_SECOND];
    return date;
}

- (NSString *)stringByHourFormat {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:HOUR_DATE_FORMAT];
    
    NSString *hhString = [dateFormatter stringFromDate:self.date];
    return hhString;
}

- (NSString *)stringByHourMinuteFormat {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:HOUR_MINUTE_DATE_FORMAT];
    
    NSString *hhmmString = [dateFormatter stringFromDate:self.date];
    return hhmmString;
}

@end