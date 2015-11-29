//
//  TimeTableDate.h
//  SmartCampus
//
//  Created by LeeRowoon on 2015. 7. 20..
//  Copyright (c) 2015년 TimeHUB. All rights reserved.
//

// 2015년 12월 14일로 고정
#define FIXED_YEAR 2015
#define FIXED_MONTH 12
#define FIXED_DAY 14

// 30분을 초로 환산
#define HALF_OF_HOUR_SECOND 30 * 60

// 1시간을 초로 환산
#define HOUR_SECOND 60 * 60

// HH 형식
#define HOUR_DATE_FORMAT @"HH"

// HH:mm 형식
#define HOUR_MINUTE_DATE_FORMAT @"HH:mm"

#import <Foundation/Foundation.h>

@interface TimeTableDate : NSObject <NSCopying>

// 시간
@property (nonatomic, copy) NSDate *date;

// 2015/12/14(년/월/일) 고정된 NSDate 리턴
+ (NSDate *)fixedYearMonthDay;

// NSDate yyyy-MM-dd HH:mm 포맷으로 로그
+ (void)printDate:(NSDate *)date;

// HH(시) 형식의 문자열로부터 NSDate 리턴
+ (NSDate *)dateFromHourString:(NSString *)string;

// HH:mm(시:분) 형식의 문자열로부터 NSDate 리턴
+ (NSDate *)dateFromHourMinuteString:(NSString *)string;

// 시 설정
- (void)setHour:(NSInteger)hour;

// 분 설정
- (void)setMinute:(NSInteger)minute;

// 시,분 설정
- (void)setHour:(NSInteger)hour withMinute:(NSInteger)minute;

// self.date를 30분 추가
- (void)selfDateByAddingHalfOfHourInterval;

// self.date에 30분 추가된 새로운 NSDate를 리턴
- (NSDate *)dateByAddingHalfOfHourInterval;

// self.date를 1시간 추가
- (void)selfDateByAddingHourInterval;

// self.date에 1시간 추가된 새로운 NSDate를 리턴
- (NSDate *)dateByAddingHourInterval;

// HH(시) 형식으로 문자열 리턴
- (NSString *)stringByHourFormat;

// HH:mm(시:분) 형식으로 문자열 리턴
- (NSString *)stringByHourMinuteFormat;

@end