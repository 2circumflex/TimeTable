//
//  TimeTableLineView.h
//  SmartCampus
//
//  Created by LeeRowoon on 2015. 7. 20..
//  Copyright (c) 2015년 TimeHUB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+Reload.h"
#import "TimeTableDate.h"

@interface TimeTableLineView : UIView

// 시간
@property (nonatomic, copy) TimeTableDate *timeTableDate;

// 라인 구별
@property (nonatomic) BOOL isHalfOfHourLine;

@end