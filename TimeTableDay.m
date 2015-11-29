//
//  TimeTableDay.m
//  SmartCampus
//
//  Created by LeeRowoon on 2015. 7. 20..
//  Copyright (c) 2015년 TimeHUB. All rights reserved.
//

#import "TimeTableDay.h"

@implementation TimeTableDay

-(BOOL)isEqual:(id)object {
    
    if ([object isKindOfClass:[TimeTableDay class]]) {
        
        TimeTableDay *otherDay = (TimeTableDay *)object;
        
        if (self.day == otherDay.day) {
            return YES;
        } else {
            return NO;
        }
    }
    
    return NO;
}

- (id)copyWithZone:(NSZone *)zone {
    TimeTableDay *another = [[TimeTableDay alloc] init];
    another.day = self.day;
    another.isSelected = self.isSelected;
    return another;
}


+ (NSString *)dayToString:(TTDay)day {
    
    switch(day) {
            
        // 월요일
        case TTDayMonday:
            return @"MON";
            break;
            
        // 화요일
        case TTDayTuesday:
            return @"TUE";
            break;
            
        // 수요일
        case TTDayWednesday:
            return @"WED";
            break;
            
        // 목요일
        case TTDayThursday:
            return @"THU";
            break;
            
        // 금요일
        case TTDayFriday:
            return @"FRI";
            break;
            
        // 토요일
        case TTDaySaturday:
            return @"SAT";
            break;
            
        // 일요일
        case TTDaySunday:
            return @"SUN";
            break;
            
        default:
            return @"";
            break;
    }
}

+ (NSString *)dayToHangulString:(TTDay)day {
    
    switch(day) {
            
        // 월요일
        case TTDayMonday:
            return @"월요일";
            break;
            
        // 화요일
        case TTDayTuesday:
            return @"화요일";
            break;
            
        // 수요일
        case TTDayWednesday:
            return @"수요일";
            break;
            
        // 목요일
        case TTDayThursday:
            return @"목요일";
            break;
            
        // 금요일
        case TTDayFriday:
            return @"금요일";
            break;
            
        // 토요일
        case TTDaySaturday:
            return @"토요일";
            break;
            
        // 일요일
        case TTDaySunday:
            return @"일요일";
            break;
            
        default:
            return @"";
            break;
    }
}

@end