//
//  CustomCalendarDayView.h
//  Example
//
//  Created by 鹏sir on 2024/10/31.
//  Copyright © 2024 Jonathan Tribouharet. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <JTCalendar/JTCalendar.h>

NS_ASSUME_NONNULL_BEGIN

@interface CustomCalendarDayView : UIView <JTCalendarDay>

@property (nonatomic, weak) JTCalendarManager *manager;

@property (nonatomic) NSDate *date;

@property (nonatomic, readonly) UIImageView *circleImageView;

@property (nonatomic, readonly) UIImageView *emotionImageView;
@property (nonatomic, readonly) UIView *dotView;
@property (nonatomic, readonly) UIView *textBgView;
@property (nonatomic, readonly) UILabel *textLabel;


@property (nonatomic) BOOL isFromAnotherMonth;

/*!
 * Must be call if override the class
 */
- (void)commonInit;

@end

NS_ASSUME_NONNULL_END
