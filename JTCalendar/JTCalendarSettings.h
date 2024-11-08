//
//  JTCalendarSettings.h
//  JTCalendar
//
//  Created by Jonathan Tribouharet
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, JTCalendarWeekDayFormat) {
    JTCalendarWeekDayFormatSingle,
    JTCalendarWeekDayFormatShort,
    JTCalendarWeekDayFormatFull
};

@interface JTCalendarSettings : NSObject


// Content view

@property (nonatomic) BOOL pageViewHideWhenPossible;
@property (nonatomic) BOOL weekModeEnabled;


// Page view

// Must be less or equalt to 6, 0 for automatic
@property (nonatomic) NSUInteger pageViewNumberOfWeeks;
@property (nonatomic) BOOL pageViewHaveWeekDaysView;
@property (nonatomic) NSUInteger pageViewWeekModeNumberOfWeeks;
@property (nonatomic) BOOL pageViewWeekDaysViewAutomaticHeight;
//顶部周View的高度
@property (nonatomic) CGFloat weekViewHeight;
@property (nonatomic) UIColor *weekDayTextColor;
@property (nonatomic) UIFont *weekDayTextFont;

// WeekDay view

@property (nonatomic) JTCalendarWeekDayFormat weekDayFormat;


// Day view

@property (nonatomic) BOOL zeroPaddedDayFormat;


// Use for override
- (void)commonInit;

@end
