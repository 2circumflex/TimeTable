//
//  TimeTableLecture.m
//  SmartCampus
//
//  Created by LeeRowoon on 2015. 7. 20..
//  Copyright (c) 2015년 TimeHUB. All rights reserved.
//

#import "TimeTableLecture.h"

@implementation TimeTableLecture

- (BOOL)isEqual:(id)object {
    
    if ([object isKindOfClass:[TimeTableLecture class]]) {
        
        TimeTableLecture *otherLecture = (TimeTableLecture *)object;
        
        if (![self.lectureName isEqualToString:otherLecture.lectureName]) {
            return NO;
        }
        
        if (![self.lectureRoomName isEqualToString:otherLecture.lectureRoomName]) {
            return NO;
        }
        
        if (![self.professorName isEqualToString:otherLecture.professorName]) {
            return NO;
        }
        
        if (![self.timeTableDay isEqual:otherLecture.timeTableDay]) {
            return NO;
        }
        
        if (![self.startTimeTableDate isEqual:otherLecture.startTimeTableDate]) {
            return NO;
        }
        
        if (![self.endTimeTableDate isEqual:otherLecture.endTimeTableDate]) {
            return NO;
        }
        
        if (![self.color isEqualToString:otherLecture.color]) {
            return NO;
        }
        
        if (![self.color isEqualToString:otherLecture.color]) {
            return NO;
        }
        
        if (![self.color isEqualToString:otherLecture.color]) {
            return NO;
        }
        
        return YES;
    }
    
    return NO;
}

- (id)copyWithZone:(NSZone *)zone {
    
    TimeTableLecture *another = [[TimeTableLecture alloc] init];
    
    another.lectureName = [self.lectureName copy];
    another.lectureRoomName = [self.lectureRoomName copy];
    another.professorName = [self.professorName copy];
    another.timeTableDay = [self.timeTableDay copy];
    another.startTimeTableDate = [self.startTimeTableDate copy];
    another.endTimeTableDate = [self.endTimeTableDate copy];
    another.color = [self.color copy];
    
    return another;
}

- (NSString *)timeTableDescription {
    NSString *timeTableDescription = [NSString stringWithFormat:@"%@\n%@", self.lectureName, self.lectureRoomName];
    return timeTableDescription;
}

@end
