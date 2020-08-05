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
     BOOL success = [db executeUpdate:@"insert into Report(code, time, act, extension) values(?, ?, ?, ?)", info[@"code"], [Tool currentTimeStr], info[@"act"], info[@"extension"]];
        NSLog(@"insert result  ==%d", success);
    }];
}

- (NSDictionary *)selectFundWithFundNumber:(NSString *)number {
    NSMutableDictionary *tempDic = [NSMutableDictionary dictionary];
    [_db inDatabase:^(FMDatabase * _Nonnull db) {
        FMResultSet *set = [db executeQuery:@"select * from Fund where fund_number=123", number];
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

- (void)deleteRecordStart:(NSNumber *)start end:(NSNumber *)end {
    [_db inDatabase:^(FMDatabase * _Nonnull db) {
        BOOL success = [db executeUpdate:@"delete from Report where id >= ? and id <= ?", start, end];
        NSLog(@"insert result  ==%d", success);
    }];
}

@end
