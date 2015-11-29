//
//  TimeTableLecture.h
//  SmartCampus
//
//  Created by LeeRowoon on 2015. 7. 20..
//  Copyright (c) 2015년 TimeHUB. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TimeTableDay.h"
#import "TimeTableDate.h"

@interface TimeTableLecture : NSObject <NSCopying>

// 강의명
@property (nonatomic, copy) NSString *lectureName;

// 강의실
@property (nonatomic, copy) NSString *lectureRoomName;

// 담당교수
@property (nonatomic, copy) NSString *professorName;

// 요일 정보
@property (nonatomic, copy) TimeTableDay *timeTableDay;

// 강의 시작시간
@property (nonatomic, copy) TimeTableDate *startTimeTableDate;

// 강의 종료시간
@property (nonatomic, copy) TimeTableDate *endTimeTableDate;

// 강의 색상(Hex)
@property (nonatomic, copy) NSString *color;

// 시간표에 표시할 내용
- (NSString *)timeTableDescription;

@end