//
//  GLDatabaseManager.m
//  MyFund
//
//  Created by ZM on 2020/8/5.
//  Copyright © 2020 ZM. All rights reserved.
//

#import "GLDatabaseManager.h"

@interface GLDatabaseManager ()

@property (nonatomic, strong, readwrite) GLDataBase *dataBase;

@property (nonatomic, strong, readwrite) GLFundDataBase *fundDataBase;


@end



@implementation GLDatabaseManager

static GLDatabaseManager *_manager = nil;
+ (GLDatabaseManager *)shareManager {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _manager = [[GLDatabaseManager alloc]init];
    });
    return _manager;
}

- (GLDataBase *)dataBase {
    if (_dataBase == nil) {
        _dataBase = [[GLDataBase alloc]init];
    }
    return _dataBase;
}

- (GLFundDataBase *)fundDataBase {
    if (_fundDataBase == nil) {
        _fundDataBase = [[GLFundDataBase alloc]init];
    }
    return _fundDataBase;
}


@end
