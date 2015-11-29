//
//  TimeTableView.h
//  SmartCampus
//
//  Created by LeeRowoon on 2015. 7. 17..
//  Copyright (c) 2015년 TimeHUB. All rights reserved.
//

////////////////////////////////////////////////////////////////////////////
//
// 설명
//
// 그려지는 순서는 요일 >> 스크롤, 내용뷰 >> 1시간라인, 시간레이블, 30분단위 라인 >> 강의
//
// 왼쪽 시간 레이블은 시작시간, 종료시간이 1시간단위라는 가정하에 만들었음
// 예) 7시 ~ 19시 (O)  /   7시 30분 ~ 16시 30분 (X)
// TimeTableDate 클래스 사용
// TimeTableViewDataSource 에 numberOfHours, hourAtIndex 구현
//
// 위에 요일은 TimeTableDay 클래스 사용
// TimeTableViewDataSource 에 numberOfDays, dayAtIndex 구현
//
// 강의는 TimeTableLecture 사용
// 요일, 시작시간, 종료시간은 범위 안에 있어야 됨
// 시작, 종료 Y좌표가 라인을 건드리지 않음
// TimeTableViewDataSource 에 numberOfLectures, lectureAtIndex 구현
//
////////////////////////////////////////////////////////////////////////////

#import <UIKit/UIKit.h>

#import "TimeTableDayView.h"
#import "TimeTableHourView.h"
#import "TimeTableLineView.h"
#import "TimeTableLectureView.h"
#import "UIView+Reload.h"

#pragma mark - TimeTableViewDataSource
@protocol TimeTableViewDataSource

@required

// 요일 개수
- (NSInteger)numberOfDays;

// index에 해당하는 요일 정보
- (TimeTableDay *)dayAtIndex:(NSInteger)index;

// 왼쪽 시간 개수
- (NSInteger)numberOfHours;

// 왼쪽 index에 해당하는 시간 정보
- (TimeTableDate *)hourAtIndex:(NSInteger)index;

// 강의 개수
- (NSInteger)numberOfLectures;

// index에 해당하는 강의 정보
- (TimeTableLecture *)lectureAtIndex:(NSInteger)index;

@end

#pragma mark - TimeTableViewDelegate
@protocol TimeTableViewDelegate

@required

@optional

// 강의 선택했을때
- (void)didSelectLectureAtTimeTable:(TimeTableLecture *)lecture;

@end

#pragma mark - TimeTableView
@interface TimeTableView : UIView

@property (strong, nonatomic) id <TimeTableViewDataSource> dataSource;
@property (strong, nonatomic) id <TimeTableViewDelegate> delegate;

@end
