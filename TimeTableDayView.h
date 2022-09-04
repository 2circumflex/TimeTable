//
//  TimeTableDayView.h
//  SmartCampus
//
//  Created by LeeRowoon on 2015. 7. 20..
//  Copyright (c) 2015년 TimeHUB. All rights reserved.
//

// 요일 폰트명
#define DAY_FONT_NAME @"NanumBarunGothicBold"

// 요일 폰트 사이즈
#define DAY_FONT_SIZE 12

// 요일 Circle View 너비
#define DAY_CIRCLE_VIEW_WIDTH 30

// 요일 Circle View 높이
#define DAY_CIRCLE_VIEW_HEIGHT 30

#import <UIKit/UIKit.h>
#import "UIView+Reload.h"
#import "TimeTableDay.h"

@interface TimeTableDayView : UIView

// 요일 정보
@property (nonatomic) TimeTableDay *timeTableDay;

@end