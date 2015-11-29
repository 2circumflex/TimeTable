//
//  TimeTableDayView.m
//  SmartCampus
//
//  Created by LeeRowoon on 2015. 7. 20..
//  Copyright (c) 2015년 TimeHUB. All rights reserved.
//

#import "TimeTableDayView.h"

@interface TimeTableDayView()

@property (strong, nonatomic) UIButton *dayButton;

@end

@implementation TimeTableDayView

- (BOOL)isOpaque {
    return NO;
}

- (void)drawRect:(CGRect)rect {
    
    self.backgroundColor = [UIColor whiteColor];
    
    if (!self.timeTableDay) {
        return;
    }
    
    if (!self.dayButton) {
        // 요일 버튼
        self.dayButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, DAY_CIRCLE_VIEW_WIDTH, DAY_CIRCLE_VIEW_HEIGHT)];
    }
    
    // 요일 버튼 가운데 배치
    self.dayButton.center = CGPointMake(rect.size.width / 2, rect.size.height / 2);
    
    // 폰트
    UIFont *dayFont = [UIFont fontWithName:DAY_FONT_NAME size:DAY_FONT_SIZE];
    
    // 폰트 색상
    UIColor *dayFontColor;
    
    // 속성
    NSDictionary *attributes;
    
    if (self.timeTableDay.isSelected) {
        dayFontColor = [UIColor whiteColor];
        attributes = @{
                       NSForegroundColorAttributeName : dayFontColor,
                       NSFontAttributeName : dayFont
                       };
        
        // 요일 배경 변경 (Circle 모양)
        self.dayButton.backgroundColor = [UIColor colorWithRed:0.153 green:0.509 blue:0.5857 alpha:1.0];
        self.dayButton.layer.cornerRadius = self.dayButton.frame.size.width / 2;
        
    } else {
        dayFontColor = [UIColor colorWithRed:0.1569 green:0.5098 blue:0.5843 alpha:1.0];
        attributes = @{
                       NSForegroundColorAttributeName : dayFontColor,
                       NSFontAttributeName : dayFont
                       };
    }
    
    NSString *dayTitle = [TimeTableDay dayToString:self.timeTableDay.day];
    NSAttributedString *dayTitleAttr = [[NSAttributedString alloc] initWithString:dayTitle attributes:attributes];
    [self.dayButton setAttributedTitle:dayTitleAttr forState:UIControlStateNormal];
    
    [self addSubview:self.dayButton];
}

@end