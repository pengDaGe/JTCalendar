//
//  JTCalendarSettings.m
//  JTCalendar
//
//  Created by Jonathan Tribouharet
//

#import "JTCalendarSettings.h"

@implementation JTCalendarSettings

- (instancetype)init
{
    self = [super init];
    if(!self){
        return nil;
    }
    
    [self commonInit];
    
    return self;
}

- (void)commonInit
{
    _pageViewHideWhenPossible = NO;
    _pageViewNumberOfWeeks = 6;
    _pageViewHaveWeekDaysView = YES;
    _pageViewWeekDaysViewAutomaticHeight = NO;
    _weekDayFormat = JTCalendarWeekDayFormatShort;
    _zeroPaddedDayFormat = YES;
    _weekModeEnabled = NO;
    _pageViewWeekModeNumberOfWeeks = 1;
    _weekViewHeight = 0.0;
    _weekDayTextColor = [UIColor colorWithRed:152./256. green:147./256. blue:157./256. alpha:1.];
    _weekDayTextFont = [UIFont systemFontOfSize:11];
}

@end
