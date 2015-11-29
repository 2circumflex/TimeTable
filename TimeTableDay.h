//
//  TimeTableDay.h
//  SmartCampus
//
//  Created by LeeRowoon on 2015. 7. 20..
//  Copyright (c) 2015년 TimeHUB. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, TTDay) {
    TTDayMonday,       // 월
    TTDayTuesday,      // 화
    TTDayWednesday,    // 수
    TTDayThursday,     // 목
    TTDayFriday,       // 금
    TTDaySaturday,     // 토
    TTDaySunday        // 일
};

@interface TimeTableDay : NSObject <NSCopying>

// 요일
@property (nonatomic) TTDay day;

// 요일 선택 상태
@property (nonatomic) BOOL isSelected;

// TTDay to String
+ (NSString*)dayToString:(TTDay)day;

// TTDay to 한글 문자열
+ (NSString *)dayToHangulString:(TTDay)day;

@end