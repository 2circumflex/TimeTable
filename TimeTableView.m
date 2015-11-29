//
//  TimeTableView.m
//  SmartCampus
//
//  Created by LeeRowoon on 2015. 7. 17..
//  Copyright (c) 2015년 TimeHUB. All rights reserved.
//

// 일주일 내용 View 높이
#define WEEK_CONTENT_VIEW_HEIGHT 40

// 일주일 라인 View 높이
#define WEEK_LINE_VIEW_HEIGHT 2

// 30분 단위 높이
#define HALF_OF_HOUR_HEIGHT 30

// 시간 라인
#define HOUR_LINE_HEIGHT 1

// 30분 라인
#define HALF_OF_HOUR_LINE_HEIGHT 1

// 좌측 시간 너비
#define HOUR_PLACE_WIDTH 25

#import "TimeTableView.h"

@interface TimeTableView() <TimeTableLectureViewDelegate>

// 스크롤
@property (strong, nonatomic) UIScrollView *scrollView;

// 내용뷰
@property (strong, nonatomic) UIView *contentView;

// 요일 Width
@property (nonatomic) CGFloat dayWidth;

// 요일 뷰 Array
@property (nonatomic) NSMutableArray *timeTableDayViews;

// 라인 뷰 Array
@property (nonatomic) NSMutableArray *timeTableLineViews;

@end

@implementation TimeTableView

- (void)drawRect:(CGRect)rect {
    
    [self initData];
    
    // 요일 그리기
    [self drawWeekView];
    
    // 스크롤, 내용뷰 그리기
    [self drawScrollContentView];
    
    // 라인, 시간뷰 그리기
    [self drawLineAndHourView];
    
    // 강의뷰 그리기
    [self drawLectureView];
}

#pragma mark - Private

// reload
- (void)reloadView {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self setNeedsDisplay];
        NSLog(@"로그로그");
    });

}

- (void)initData {
    if (!self.timeTableDayViews) {
        self.timeTableDayViews = [[NSMutableArray alloc] initWithArray:@[]];
    }
    
    if (!self.timeTableLineViews) {
        self.timeTableLineViews = [[NSMutableArray alloc] initWithArray:@[]];
    }
}

// 요일별 Width 구하기
- (CGFloat)calcDayWidthWith:(CGFloat)daysWidth {
    if (self.dataSource) {
        NSInteger dayCount = [self.dataSource numberOfDays];
        return daysWidth / dayCount;
    }
    return 0;
}

// 일주일 그리기
- (void)drawWeekView {

    // 요일 전체 View 추가
    CGRect dayViewframe = CGRectMake(0, 0, self.bounds.size.width, WEEK_CONTENT_VIEW_HEIGHT + WEEK_LINE_VIEW_HEIGHT);
    UIView *dayView = [[UIView alloc] initWithFrame:dayViewframe];
    dayView.backgroundColor = [UIColor whiteColor];
    [self addSubview:dayView];
    
    // 라인 View 추가
    CGRect dayLineViewFrame = CGRectMake(0, WEEK_CONTENT_VIEW_HEIGHT, self.bounds.size.width, WEEK_LINE_VIEW_HEIGHT);
    UIView *dayLineView = [[UIView alloc] initWithFrame:dayLineViewFrame];
    dayLineView.backgroundColor = [UIColor colorWithRed:0.1569 green:0.5098 blue:0.5843 alpha:1.0];
    [dayView addSubview:dayLineView];
    
    // 요일 들어갈 뷰 추가
    CGRect dayContentViewFrame = CGRectMake(HOUR_PLACE_WIDTH, 0, self.bounds.size.width - HOUR_PLACE_WIDTH, WEEK_CONTENT_VIEW_HEIGHT);
    UIView *dayContentView = [[UIView alloc] initWithFrame:dayContentViewFrame];
    [dayView addSubview:dayContentView];
    
    // 요일별 Width 구하기
    self.dayWidth = [self calcDayWidthWith:dayContentView.frame.size.width];
    
    // 요일 추가
    if (self.dataSource) {
        NSInteger dayCount = [self.dataSource numberOfDays];
        
        for (int i=0; i<dayCount; i++) {
            
            CGRect dayFrame = CGRectMake(self.dayWidth*i, 0, self.dayWidth, WEEK_CONTENT_VIEW_HEIGHT);
            TimeTableDayView *dayView = [[TimeTableDayView alloc] initWithFrame:dayFrame];
            
            TimeTableDay *day = [self.dataSource dayAtIndex:i];
            dayView.timeTableDay = day;
            
            [dayContentView addSubview:dayView];
            
            [self.timeTableDayViews addObject:dayView];
        }
    }
}

// 스크롤, 뷰 그리기
- (void)drawScrollContentView {
    
    // 스크롤 뷰
    CGFloat weekViewHeight = WEEK_CONTENT_VIEW_HEIGHT + WEEK_LINE_VIEW_HEIGHT;
    CGRect scrollViewFrame = CGRectMake(0, weekViewHeight, self.bounds.size.width, self.bounds.size.height - weekViewHeight);
    self.scrollView = [[UIScrollView alloc] initWithFrame:scrollViewFrame];
    
    // 스크롤 뷰 추가
    [self addSubview:self.scrollView];
    
    // 시간, 강의 들어갈 뷰
    CGRect contentViewFrame = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height - weekViewHeight + 100);
    self.contentView = [[UIView alloc] initWithFrame:contentViewFrame];
    
    [self.scrollView addSubview:self.contentView];
    self.scrollView.contentSize = self.contentView.frame.size;
}

// 시(hour), 라인 그리기
- (void)drawLineAndHourView {
    
    if (!self.dataSource) {
        return;
    }
    
    // 라인 Width
    CGFloat lineViewWidth = self.bounds.size.width - HOUR_PLACE_WIDTH;
    
    NSInteger count = [self.dataSource numberOfHours];
    for (int i=0; i<count; i++) {
        
        //
        TimeTableDate *hourTimeTableDate = [self.dataSource hourAtIndex:i];
        
        if (i == 0) {
            
            /*
             * 시(hour) 라인
             * 첫번재 라인은 안보여야 되니까 height 0
             */
            
            CGRect hourLineRect = CGRectMake(HOUR_PLACE_WIDTH, 0, lineViewWidth, 0);
            TimeTableLineView *hourLineView = [[TimeTableLineView alloc] initWithFrame:hourLineRect];
            hourLineView.timeTableDate = hourTimeTableDate;
            
            [self.contentView addSubview:hourLineView];
            [self.timeTableLineViews addObject:hourLineView];
            
            
            /*
             * 30분(half of hour) 라인
             */
            
            TimeTableDate *halfOfHourTimeTableDate = [hourTimeTableDate copy];
            [halfOfHourTimeTableDate selfDateByAddingHalfOfHourInterval];
            
            CGRect halfOfHourlineRect = CGRectMake(HOUR_PLACE_WIDTH, HALF_OF_HOUR_HEIGHT, lineViewWidth, HALF_OF_HOUR_LINE_HEIGHT);
            TimeTableLineView *halfOfHourLineView = [[TimeTableLineView alloc] initWithFrame:halfOfHourlineRect];
            halfOfHourLineView.timeTableDate = halfOfHourTimeTableDate;
            halfOfHourLineView.isHalfOfHourLine = YES;
            
            [self.contentView addSubview:halfOfHourLineView];
            [self.timeTableLineViews addObject:halfOfHourLineView];
            
            [halfOfHourLineView reloadView];
            
        } else if (i == count - 1) {
            
            /*
             * 마지막은 시(hour) 라인만 그리기
             * 안보여야 되니까 height 0
             */
            TimeTableLineView *lastLineView = [self.timeTableLineViews lastObject];
            CGFloat hourLineY = lastLineView.frame.origin.y + HALF_OF_HOUR_LINE_HEIGHT + HALF_OF_HOUR_HEIGHT;
            
            CGRect hourLineRect = CGRectMake(HOUR_PLACE_WIDTH, hourLineY, lineViewWidth, 0);
            TimeTableLineView *hourLineView = [[TimeTableLineView alloc] initWithFrame:hourLineRect];
            hourLineView.timeTableDate = hourTimeTableDate;
            
            [self.contentView addSubview:hourLineView];
            [self.timeTableLineViews addObject:hourLineView];
            
            
            /*
             * self.contentView, self.scrollView 사이즈(height) 조절
             */
            self.contentView.frame = CGRectMake(self.contentView.frame.origin.x, self.contentView.frame.origin.y, self.contentView.frame.size.width, hourLineY);
            self.scrollView.contentSize = CGSizeMake(self.contentView.frame.size.width, self.contentView.frame.size.height);
            
            break;
            
        } else {
            
            /*
             * 시(hour) 라인
             */
            
            TimeTableLineView *lastLineView = [self.timeTableLineViews lastObject];
            CGFloat hourLineY = lastLineView.frame.origin.y + HALF_OF_HOUR_LINE_HEIGHT + HALF_OF_HOUR_HEIGHT;
            
            CGRect hourLineRect = CGRectMake(HOUR_PLACE_WIDTH, hourLineY, lineViewWidth, HOUR_LINE_HEIGHT);
            TimeTableLineView *hourLineView = [[TimeTableLineView alloc] initWithFrame:hourLineRect];
            hourLineView.timeTableDate = hourTimeTableDate;
            
            [self.contentView addSubview:hourLineView];
            [self.timeTableLineViews addObject:hourLineView];
            
            [hourLineView reloadView];
            
            
            /*
             * 왼쪽에 시(hour) 레이블
             */
            
            CGRect hourRect = CGRectMake(0, 0, HOUR_FONT_SIZE * 2, HOUR_FONT_SIZE + 2);
            TimeTableHourView *hourView = [[TimeTableHourView alloc] initWithFrame:hourRect];
            hourView.timeTableDate = [hourTimeTableDate copy];
            
            [self.contentView addSubview:hourView];
            
            // 가이드에 있는 위치랑 비슷하게 보이기 위해서
            CGPoint hourPoint = CGPointMake(hourLineView.frame.origin.x - 10, hourLineView.frame.origin.y + 1);
            hourView.center = hourPoint;
            
            
            /*
             * 30분(half of hour) 라인
             */
            
            TimeTableDate *halfOfHourTimeTableDate = [hourTimeTableDate copy];
            [halfOfHourTimeTableDate selfDateByAddingHalfOfHourInterval];
            
            CGFloat halfOfHourLineY = hourLineY + HALF_OF_HOUR_HEIGHT;
            CGRect halfOfHourlineRect = CGRectMake(HOUR_PLACE_WIDTH, halfOfHourLineY, lineViewWidth, HALF_OF_HOUR_LINE_HEIGHT);
            TimeTableLineView *halfOfHourLineView = [[TimeTableLineView alloc] initWithFrame:halfOfHourlineRect];
            halfOfHourLineView.timeTableDate = halfOfHourTimeTableDate;
            halfOfHourLineView.isHalfOfHourLine = YES;
            
            [self.contentView addSubview:halfOfHourLineView];
            [self.timeTableLineViews addObject:halfOfHourLineView];
            
            [halfOfHourLineView reloadView];
        }
    }
}

// 강의 그리기
- (void)drawLectureView {
    
    if (!self.dataSource) {
        return;
    }
    
    NSInteger count = [self.dataSource numberOfLectures];
    for (int i=0; i<count; i++) {
        
        // [강의정보]
        TimeTableLecture *timeTableLecture = [self.dataSource lectureAtIndex:i];
        
        
        /*
         * 시작 Y좌표 구하기
         */
        
        NSInteger startIndex = 0;
        NSInteger betweenIndexAndStart = 0;
        
        for (int j=0; j<self.timeTableLineViews.count; j++) {
            
            TimeTableLineView *lineView = [self.timeTableLineViews objectAtIndex:j];
            TimeTableDate *lineDate = lineView.timeTableDate;
            
            // 라인의 시간과 강의(시작)시간의 차이
            NSInteger between = timeTableLecture.startTimeTableDate.date.timeIntervalSinceReferenceDate - lineDate.date.timeIntervalSinceReferenceDate;
            
            // 비교할 대상이 없으므로 넣고 continue
            if (j==0) {
                startIndex = 0;
                betweenIndexAndStart = between;
                continue;
            }
            
            //
            if (between < 0) {
                break;
            }
            
            startIndex = j;
            betweenIndexAndStart = between;
            
            // 라인에 딱 맞는 위치를 찾았으므로 그만찾기
            if (between == 0) {
                break;
            }
        }
        
        TimeTableLineView *startLineView = [self.timeTableLineViews objectAtIndex:startIndex];
        CGFloat startY = startLineView.frame.origin.y + (betweenIndexAndStart / 60);

        // 시작 Y좌표 조절
        if (startIndex != 0) {
            if (startLineView.isHalfOfHourLine) {
                startY += HALF_OF_HOUR_LINE_HEIGHT;
            } else {
                startY += HOUR_LINE_HEIGHT;
            }
        }
        
        NSLog(@"시작 Y : %f", startY);
        
        
        /*
         * 종료 Y좌표 구하기
         */
        
        NSInteger endIndex = 0;
        NSInteger betweenIndexAndEnd = 0;
        
        for (int k=0; k<self.timeTableLineViews.count; k++) {
            
            TimeTableLineView *lineView = [self.timeTableLineViews objectAtIndex:k];
            TimeTableDate *lineDate = lineView.timeTableDate;
            
            // 라인의 시간과 강의(종료)시간의 차이 - (차이가 0이거나 마이너스이면 찾은거)
            NSInteger between = timeTableLecture.endTimeTableDate.date.timeIntervalSinceReferenceDate - lineDate.date.timeIntervalSinceReferenceDate;
            
            // 비교할 대상이 없으므로 넣고 continue
            if (k==0) {
                startIndex = 0;
                betweenIndexAndEnd = between;
                continue;
            }
            
            if (between > 0) {
                continue;
            }
            
            endIndex = k;
            betweenIndexAndEnd = between;
            
            // 라인에 딱 맞거나 넘으면 그만찾기
            if (between <= 0) {
                break;
            }
        }
        
        TimeTableLineView *endLineView = [self.timeTableLineViews objectAtIndex:endIndex];
        CGFloat endY = endLineView.frame.origin.y + (betweenIndexAndEnd / 60);
        
        NSLog(@"종료 Y : %f", endY);
     
        
        /*
         * 시작 X좌표 구하기
         */
        
        CGFloat startX = -1;
        
        for (TimeTableDayView *dayView in self.timeTableDayViews) {
            
            if ([dayView.timeTableDay isEqual:timeTableLecture.timeTableDay]) {
                startX = dayView.frame.origin.x + HOUR_PLACE_WIDTH;
                break;
            }
        }
        
        CGRect lectureRect = CGRectMake(startX, startY, self.dayWidth, endY - startY);
        TimeTableLectureView *lectureView = [[TimeTableLectureView alloc] initWithFrame:lectureRect];
        lectureView.timeTableLecture = timeTableLecture;
        lectureView.delegate = self;
        
        [self.contentView addSubview:lectureView];
    }
}

#pragma mark - TimeTableLectureViewDelegate
- (void)didSelectLecture:(TimeTableLecture *)lecture {
    if (self.delegate) {
        [self.delegate didSelectLectureAtTimeTable:lecture];
    }
}

@end
