//
//  GLDateBase.m
//  MyFund
//
//  Created by ZM on 2020/8/5.
//  Copyright © 2020 ZM. All rights reserved.
//

#import "GLDataBase.h"
#import <fmdb/FMDatabaseQueue.h>
#import "Tool.h"

#define DB_NAME @"db.sqlite"

@interface GLDataBase ()

@property (nonatomic, strong, readonly) FMDatabaseQueue *db;


@end


@implementation GLDataBase


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
        NSString *sql = @"CREATE TABLE IF NOT EXISTS db (id integer PRIMARY KEY NOT NULL,fund_name varchar(128),fund_number INTEGER, date integer(128),amount varchar(128),is_sell BOOLEAN);";
        BOOL success = [db executeUpdate:sql];
        if (success) {
            
        } else {
            
        }
    }];
}

- (void)inserActionRecordsWithInfo:(NSDictionary *)info {
    [_db inDatabase:^(FMDatabase * _Nonnull db) {
       BOOL success = [db executeUpdate:@"insert into db(fund_number, fund_name, amount, is_sell, date) values(?, ?, ?, ?, ?)", info[@"fund_number"], info[@"fund_name"], info[@"amount"], info[@"is_sell"], [Tool currentTimeStr]];
           NSLog(@"insert result  ==%d", success);
    }];
}

- (NSMutableArray *)selectDataWithLimit:(NSInteger)limit {
    NSMutableArray *array = [NSMutableArray array];
    [_db inDatabase:^(FMDatabase * _Nonnull db) {
        FMResultSet *set = [db executeQuery:@"select * from Report limit ?", @(limit)];
        while ([set next]) {
            NSDictionary *dic = @{
                @"code": [set stringForColumn:@"code"],
                @"act": [set stringForColumn:@"act"],
                @"id": @([set intForColumn:@"id"]),
            };
            [array addObject:[dic mutableCopy]];
        }
    }];
    return array;
}

- (void)deleteRecordStart:(NSNumber *)start end:(NSNumber *)end {
    [_db inDatabase:^(FMDatabase * _Nonnull db) {
        BOOL success = [db executeUpdate:@"delete from Report where id >= ? and id <= ?", start, end];
        NSLog(@"insert result  ==%d", success);
    }];
}

@end
