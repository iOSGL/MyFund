//
//  Tool.m
//  MyFund
//
//  Created by ZM on 2020/8/5.
//  Copyright © 2020 ZM. All rights reserved.
//

#import "Tool.h"

@implementation Tool

+ (NSString *)formatHH_MM_SS:(NSInteger)second {
    //format of hour
    NSString *str_hour = [NSString stringWithFormat:@"%02ld", second/3600];
                               //format of minute
   NSString *str_minute = [NSString stringWithFormat:@"%02ld", (second%3600)/60];
   //format of second
   NSString *str_second = [NSString stringWithFormat:@"%02ld", second%60];
   NSString *format_time = [NSString stringWithFormat:@"%@:%@:%@",str_hour,str_minute,str_second];
    return format_time;
}

+ (NSString *)currentTimeStr {
    NSDate* date = [NSDate date];//获取当前时间0秒后的时间
    NSTimeInterval time=[date timeIntervalSince1970]*1000;// *1000 是精确到毫秒，不乘就是精确到秒
    NSString *timeString = [NSString stringWithFormat:@"%.0f", time];
    return timeString;
}

@end
