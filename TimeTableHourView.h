//
//  TimeTableHourView.h
//  SmartCampus
//
//  Created by LeeRowoon on 2015. 7. 20..
//  Copyright (c) 2015년 TimeHUB. All rights reserved.
//

// HOUR 폰트명
#define HOUR_FONT_NAME @"NanumBarunGothic"

// HOUR 폰트 사이즈
#define HOUR_FONT_SIZE 10

#import <UIKit/UIKit.h>
#import "UIView+Reload.h"
#import "TimeTableDate.h"

@interface TimeTableHourView : UIView

// 시간
@property (nonatomic, copy) TimeTableDate *timeTableDate;

@end