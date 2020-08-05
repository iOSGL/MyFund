//
//  GLFundDataBase.h
//  MyFund
//
//  Created by ZM on 2020/8/5.
//  Copyright © 2020 ZM. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GLFundDataBase : NSObject

- (void)createReportTable;

/**
 插入一条记录
 */
- (void)inserActionRecordsWithInfo:(NSDictionary *)info;

/**
 查询数据
 */
- (NSMutableArray *)selectDataWithLimit:(NSInteger)limit;

/**
 删除数据索引 根据数据库主键ID
 */
- (void)deleteRecordStart:(NSNumber *)start end:(NSNumber *)end;

@end

NS_ASSUME_NONNULL_END
