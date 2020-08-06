//
//  GLFundDataBase.m
//  MyFund
//
//  Created by ZM on 2020/8/5.
//  Copyright © 2020 ZM. All rights reserved.
//

#import "GLFundDataBase.h"
#import <fmdb/FMDatabaseQueue.h>
#import "Tool.h"
#import "GLDatabaseManager.h"

#define DB_NAME @"fund.sqlite"

@interface GLFundDataBase ()

@property (nonatomic, strong, readonly) FMDatabaseQueue *db;


@end


@implementation GLFundDataBase

- (instancetype)init {
    self = [super init];
    if (self) {
        _db = [FMDatabaseQueue databaseQueueWithPath:[self dbPath]];
    }
    return self;
}

- (NSString *)dbPath {
    NSArray *filePaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path = [filePaths objectAtIndex:0];
    path = [path stringByAppendingPathComponent:DB_NAME];
    NSLog(@"DBPath ======> %@", path);
    return path;
}

- (void)createReportTable {
    [_db inDatabase:^(FMDatabase * _Nonnull db) {
        NSString *sql = @"CREATE TABLE IF NOT EXISTS Fund (fund_number integer PRIMARY KEY NOT NULL,fund_name char(128),total_amount double(128),date integer(128),stock varchar(128));";
        BOOL success = [db executeUpdate:sql];
        if (success) {
            
        } else {
            
        }
    }];
}

- (void)inserActionRecordsWithInfo:(NSDictionary *)info {
    [_db inDatabase:^(FMDatabase * _Nonnull db) {
     BOOL success = [db executeUpdate:@"insert into Fund(fund_number, fund_name, total_amount, stock, date) values(?, ?, ?, ?, ?)", info[@"fund_number"], info[@"fund_name"], info[@"amount"], info[@"stock"], [Tool currentTimeStr]];
        NSLog(@"insert result  ==%d", success);
    }];
}

- (NSDictionary *)selectFundWithFundNumber:(NSString *)number {
    NSMutableDictionary *tempDic = [NSMutableDictionary dictionary];
    [_db inDatabase:^(FMDatabase * _Nonnull db) {
        FMResultSet *set = [db executeQuery:@"select * from Fund where fund_number=?", number];
        while ([set next]) {
            [tempDic setObject:[NSString stringWithFormat:@"%i", [set intForColumn:@"fund_number"]] forKey:@"fund_number"];
            [tempDic setObject:[set stringForColumn:@"fund_name"] forKey:@"fund_name"];
            NSInteger time =[set intForColumn:@"date"];
            [tempDic setObject:[Tool formatHH_MM_SS:time] forKey:@"date"];
            NSString *amount = [NSString stringWithFormat:@"%.2f", [set doubleForColumn:@"total_amount"]];
            [tempDic setObject:amount forKey:@"total_amount"];
            [tempDic setObject:[set stringForColumn:@"stock"] forKey:@"stock"];
        }
    }];
   return [tempDic copy];
}


- (NSMutableArray *)selectAllFund {
     NSMutableArray *array = [NSMutableArray array];
     [_db inDatabase:^(FMDatabase * _Nonnull db) {
         FMResultSet *set = [db executeQuery:@"select * from Fund"];
         while ([set next]) {
             NSString *time =[set stringForColumn:@"date"];
              NSString *amount = [NSString stringWithFormat:@"%.2f", [set doubleForColumn:@"total_amount"]];
             
             NSString *fundNumber = [set stringForColumn:@"fund_number"];
             NSArray *listArray = [[GLDatabaseManager shareManager].dataBase selectDataWithFundNo:fundNumber];
             NSDictionary *dic = @{
                 @"fundNumber": fundNumber,
                 @"fundName": [set stringForColumn:@"fund_name"],
                 @"fundStock": [set stringForColumn:@"stock"],
                 @"totalAmount": amount,
                 @"date": [Tool formatHH_MM_SS:[time integerValue]],
                 @"transactionList": listArray
             };
             
             [array addObject:[dic mutableCopy]];
         }
     }];
     return array;
}

- (void)updateFundWithFundNumber:(NSDictionary *)info {
    [_db inDatabase:^(FMDatabase * _Nonnull db) {
     BOOL success = [db executeUpdate:@"update Fund set total_amount=? where fund_number=?", info[@"amount"], info[@"fund_bumber"]];
        NSLog(@"insert result  ==%d", success);
    }];
}

- (void)deleteRecordStart:(NSNumber *)start end:(NSNumber *)end {
    [_db inDatabase:^(FMDatabase * _Nonnull db) {
        BOOL success = [db executeUpdate:@"delete from Report where id >= ? and id <= ?", start, end];
        NSLog(@"insert result  ==%d", success);
    }];
}

@end
