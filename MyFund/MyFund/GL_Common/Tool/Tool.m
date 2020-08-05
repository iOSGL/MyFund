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
    NSDate * myDate = [NSDate dateWithTimeIntervalSince1970:second / 1000];
    NSDateFormatter * formatter=[[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"YYYY-MM-dd"];
    NSString *timeStr=[formatter stringFromDate:myDate];
    return timeStr;
}

+ (NSString *)currentTimeStr {
    NSDate* date = [NSDate date];//获取当前时间0秒后的时间
    NSTimeInterval time=[date timeIntervalSince1970]*1000;// *1000 是精确到毫秒，不乘就是精确到秒
    NSString *timeString = [NSString stringWithFormat:@"%.0f", time];
    return timeString;
}

+ (NSTimeInterval )currentTime {
    NSDate* date = [NSDate date];//获取当前时间0秒后的时间
    NSTimeInterval time=[date timeIntervalSince1970]*1000;// *1000 是精确到毫秒，不乘就是精确到秒
    return time;
}


@end
