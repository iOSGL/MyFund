//
//  GLDateBase.h
//  MyFund
//
//  Created by ZM on 2020/8/5.
//  Copyright © 2020 ZM. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GLDataBase : NSObject

- (void)createReportTable;

/**
 插入一条记录
 */
- (void)inserActionRecordsWithInfo:(NSDictionary *)info;

/**
 查询数据
 */
- (NSMutableArray *)selectDataWithFundNo:(NSString *)fundID;

/**
 删除数据索引 根据数据库主键ID
 */
- (void)deleteRecordStart:(NSNumber *)start end:(NSNumber *)end;


@end

NS_ASSUME_NONNULL_END
