//
//  CustomCalendarDayView.m
//  Example
//
//  Created by 鹏sir on 2024/10/31.
//  Copyright © 2024 Jonathan Tribouharet. All rights reserved.
//

#import "CustomCalendarDayView.h"

@implementation CustomCalendarDayView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(!self){
        return nil;
    }
    [self commonInit];
    
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if(!self){
        return nil;
    }
    
    [self commonInit];
    
    return self;
}

- (void)commonInit
{
    self.clipsToBounds = YES;
    
    {
        _circleImageView = [UIImageView new];
        _circleImageView.image = [UIImage imageNamed:@"icon_calender_state_bg_img"];
        [self addSubview:_circleImageView];
        
    }
    
    {
        _emotionImageView = [UIImageView new];
        _emotionImageView.hidden = YES;
        [self addSubview:_emotionImageView];
        
    }
    
    {
        _dotView = [UIView new];
        _dotView.layer.cornerRadius = 2;
        _dotView.layer.masksToBounds = YES;
        [self addSubview:_dotView];
        
        _dotView.backgroundColor = [UIColor colorWithRed:217.0/255.0 green:217.0/255.0 blue:217.0/255.0 alpha:1];
        _dotView.hidden = YES;
        
    }
    
    {
        _textBgView = [UILabel new];
        _textBgView.backgroundColor = [UIColor colorWithRed:103.0/255.0 green:199.0/255.0 blue:153.0/255.0 alpha:1];
        _textBgView.layer.cornerRadius = 10;
        _textBgView.layer.masksToBounds = YES;
        [self addSubview:_textBgView];
        
    }
    
    {
        _textLabel = [UILabel new];
        [self addSubview:_textLabel];
        
        _textLabel.textColor = [[UIColor blackColor] colorWithAlphaComponent:0.2];
        _textLabel.textAlignment = NSTextAlignmentCenter;
        _textLabel.font = [UIFont boldSystemFontOfSize:14];
    }
    
    {
        UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTouch)];
        
        self.userInteractionEnabled = YES;
        [self addGestureRecognizer:gesture];
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // 设置为期望的大小
    CGRect frame = self.frame;
    CGFloat itemWidth = [UIScreen mainScreen].bounds.size.width / 7;     // 每个 item 的宽度
    CGFloat itemHeight = 65;    // 每个 item 的高度
    CGFloat verticalSpacing = 10;   // 垂直间距
    
    // 通过调整 frame 大小来控制间距
    frame.size = CGSizeMake(itemWidth, itemHeight + verticalSpacing);
    self.frame = frame;
    
    _textBgView.frame = CGRectMake((itemWidth - 20)/2, 2.5, 20, 20);
    _textLabel.frame = CGRectMake(0, 5, itemWidth, 14);
    _circleImageView.frame = CGRectMake((itemWidth - 40)/2, 25, 40, 40);
    _emotionImageView.frame = CGRectMake((itemWidth - 40)/2, 25, 40, 40);
    _dotView.frame = CGRectMake((itemWidth - 4)/2, 68, 4, 4);
}

- (void)setDate:(NSDate *)date
{
    NSAssert(date != nil, @"date cannot be nil");
    NSAssert(_manager != nil, @"manager cannot be nil");
    
    self->_date = date;
    [self reload];
}

- (void)reload
{
    static NSDateFormatter *dateFormatter = nil;
    if(!dateFormatter){
        dateFormatter = [_manager.dateHelper createDateFormatter];
    }
    [dateFormatter setDateFormat:self.dayFormat];
    
    _textLabel.text = [ dateFormatter stringFromDate:_date];
    [_manager.delegateManager prepareDayView:self];
}

- (void)didTouch
{
    [_manager.delegateManager didTouchDayView:self];
}

- (NSString *)dayFormat
{
    return @"d";
//    return self.manager.settings.zeroPaddedDayFormat ? @"dd" : @"d";
}


@end
