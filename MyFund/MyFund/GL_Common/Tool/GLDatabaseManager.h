//
//  GLDatabaseManager.h
//  MyFund
//
//  Created by ZM on 2020/8/5.
//  Copyright © 2020 ZM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GLDataBase.h"
#import "GLFundDataBase.h"

NS_ASSUME_NONNULL_BEGIN

@interface GLDatabaseManager : NSObject

+ (GLDatabaseManager *)shareManager;

@property (nonatomic, strong, readonly) GLDataBase *dataBase;

@property (nonatomic, strong, readonly) GLFundDataBase *fundDataBase;


@end

NS_ASSUME_NONNULL_END
