//
//  TimeTableLectureView.h
//  SmartCampus
//
//  Created by LeeRowoon on 2015. 7. 17..
//  Copyright (c) 2015년 TimeHUB. All rights reserved.
//

// LECTURE 폰트명
#define LECTURE_FONT_NAME @"NanumBarunGothic"

// LECTURE 폰트 사이즈
#define LECTURE_FONT_SIZE 11

// LECTURE inset
#define LECTURE_INSET 10

#import <UIKit/UIKit.h>
#import "UIView+Reload.h"
#import "TimeTableLecture.h"

#pragma mark - TimeTableLectureViewDelegate
@protocol TimeTableLectureViewDelegate

@required
- (void)didSelectLecture:(TimeTableLecture *)lecture;

@end

#pragma mark - TimeTableLectureView
@interface TimeTableLectureView : UIView

@property (strong, nonatomic) id <TimeTableLectureViewDelegate> delegate;

@property (nonatomic, copy) TimeTableLecture *timeTableLecture;

// Hex string to UIColor
+ (UIColor *)colorFromHexString:(NSString *)hexString;

@end