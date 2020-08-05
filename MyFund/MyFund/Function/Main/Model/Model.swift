//
//  Model.swift
//  MyFund
//
//  Created by ZM on 2020/8/5.
//  Copyright © 2020 ZM. All rights reserved.
//

import Foundation
import HandyJSON

struct FundSectionModel: HandyJSON {
    var fundName: String?            // 基金名称
    var fundNumber: String?          // 基金编号
    var fundStock: String?           // 基金包含的股票
    var value: Float = 0             // 当前净值
    var totalAmount:String?       // 持有金额
    var profit: Float = 0            // 当前收益
    var date:String?               // 购买时间
    
}

struct TransactionList: HandyJSON {
    var fundName: String?            // 基金名称
    var fundNumber: String?          // 基金编号
    var date:String?               // 购买时间
    var amount: String?           // 操作金额
    var isSell: Bool = false        // 是否是卖出
    var amountColor: String?        // 金额颜色
    
}
