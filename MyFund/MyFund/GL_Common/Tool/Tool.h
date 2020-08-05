//
//  Tool.h
//  MyFund
//
//  Created by ZM on 2020/8/5.
//  Copyright © 2020 ZM. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Tool : NSObject


+ (NSString *)formatHH_MM_SS:(NSInteger)second;

+ (NSString *)currentTimeStr;


@end

NS_ASSUME_NONNULL_END
