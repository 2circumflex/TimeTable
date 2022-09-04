//
//  TimeTableLectureView.m
//  SmartCampus
//
//  Created by LeeRowoon on 2015. 7. 17..
//  Copyright (c) 2015년 TimeHUB. All rights reserved.
//

#import "TimeTableLectureView.h"
#import "CommUtils.h"

@interface TimeTableLectureView()

@property (strong, nonatomic) UIButton *lectureButton;

@end

@implementation TimeTableLectureView

- (BOOL)isOpaque {
    return NO;
}

- (void)drawRect:(CGRect)rect {
    
    if (!self.lectureButton) {
        self.lectureButton = [[UIButton alloc] initWithFrame:rect];
    }
    
    // 배경색상
    self.lectureButton.backgroundColor = [TimeTableLectureView colorFromHexString:self.timeTableLecture.color];
    
    // Inset
    [self.lectureButton setContentEdgeInsets:UIEdgeInsetsMake(LECTURE_INSET, LECTURE_INSET, LECTURE_INSET, LECTURE_INSET)];
    
    // 좌, 상 정렬
    [self.lectureButton setContentVerticalAlignment:UIControlContentVerticalAlignmentTop];
    [self.lectureButton setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
    
    // BreakMode 끝에서 ...
    [self.lectureButton.titleLabel setLineBreakMode:NSLineBreakByTruncatingTail];
    
    // 폰트
    UIFont *lectureFont = [UIFont fontWithName:LECTURE_FONT_NAME size:LECTURE_FONT_SIZE];
    
    // 폰트 색상
    UIColor *lectureFontColor = [UIColor whiteColor];
    
    // 속성
    NSDictionary *attributes = @{
                                 NSForegroundColorAttributeName : lectureFontColor,
                                 NSFontAttributeName : lectureFont,
                                 };
    
    // Attributed String
    NSString *timeTableDescripton = [self.timeTableLecture timeTableDescription];
    NSAttributedString *lectureAttr = [[NSAttributedString alloc] initWithString:timeTableDescripton attributes:attributes];
    [self.lectureButton setAttributedTitle:lectureAttr forState:UIControlStateNormal];
    
    // 라인 설정
    CGFloat titleHeight = [CommUtils heightOfString:@"글자" withFont:lectureFont];
    CGFloat contentHeight = rect.size.height - (LECTURE_INSET * 2);
    NSInteger numberOfLine = contentHeight / titleHeight;
    [self.lectureButton.titleLabel setNumberOfLines:numberOfLine];
    
    // Selector 설정
    [self.lectureButton addTarget:self action:@selector(selectLecture:) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:self.lectureButton];
}

- (void)selectLecture:(id)sender {
    
    UIButton *lectureButton = (UIButton *)sender;
    
    TimeTableLectureView *lectureView = (TimeTableLectureView *)lectureButton.superview;
    TimeTableLecture *lecture = lectureView.timeTableLecture;
    
    if (self.delegate) {
        [self.delegate didSelectLecture:lecture];
    }
}

+ (UIColor *)colorFromHexString:(NSString *)hexString {
    unsigned rgbValue = 0;
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    [scanner setScanLocation:1]; // bypass '#' character
    [scanner scanHexInt:&rgbValue];
    return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0 green:((rgbValue & 0xFF00) >> 8)/255.0 blue:(rgbValue & 0xFF)/255.0 alpha:1.0];
}

@end
