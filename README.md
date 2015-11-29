#스마트캠퍼스 iOS 소스 설명

전체 소스를 올릴수 없어서 소스 일부분만 올렸습니다.

시간표 조회에 대한 소스입니다.

**[동영상 링크](https://drive.google.com/file/d/0Bxk2cyRX7WmxMUJmT0RWMnRNZ1k/view)** 43초에 나옵니다.

* Model
	* TimeTableDay
	* TimeTableDate
	* TimeTableLecture


* View
	* TimeTableView
	* TimeTableDayView
	* TimeTableHourView
	* TimeTableLineView
	* TimeTableLectureView

Controller 구현부분

```ObjectiveC
@interface TimeTableViewController () <TimeTableViewDataSource, TimeTableViewDelegate>

#pragma mark - TimeTableViewDataSource

- (NSInteger)numberOfDays {
    return self.days.count;
}

- (TimeTableDay *)dayAtIndex:(NSInteger)index {
    return self.days[index];
}

- (NSInteger)numberOfHours {
    return self.hours.count;
}

- (TimeTableDate *)hourAtIndex:(NSInteger)index {
    TimeTableDate *timeTableDate = [[TimeTableDate alloc] init];
    NSInteger hour = [[self.hours objectAtIndex:index] integerValue];
    [timeTableDate setHour:hour];
    return timeTableDate;
}

- (NSInteger)numberOfLectures {
    return self.lectures.count;
}

- (TimeTableLecture *)lectureAtIndex:(NSInteger)index {
    return self.lectures[index];
}

#pragma mark - TimeTableViewDelegate

- (void)didSelectLectureAtTimeTable:(TimeTableLecture *)lecture {
    // popup
}
```
