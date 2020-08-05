//
//  FundSectionHeaderView.swift
//  MyFund
//
//  Created by ZM on 2020/8/5.
//  Copyright © 2020 ZM. All rights reserved.
//

import UIKit

class FundSectionHeaderView: UIView {
    
    private lazy var fundName: UILabel = {
           let lable = UILabel.init()
           lable.font = UIFont.systemFont(ofSize: 16)
            lable.textColor = UIColor("#466719")
           lable.text = "基金名称"
        lable.textAlignment = .left
           return lable
       }()
    
    private lazy var fundNameValue: UILabel = {
              let lable = UILabel.init()
              lable.font = UIFont.systemFont(ofSize: 12)
               lable.textColor = UIColor("#666666")
              lable.text = "富国军工"
           lable.textAlignment = .left
              return lable
          }()
    
    private lazy var fundNumber: UILabel = {
              let lable = UILabel.init()
              lable.font = UIFont.systemFont(ofSize: 12)
               lable.textColor = UIColor("#7c003b")
              lable.text = "000601"
        lable.textAlignment = .center
              return lable
        }()
    
    private lazy var buyDate: UILabel = {
                 let lable = UILabel.init()
                 lable.font = UIFont.systemFont(ofSize: 14)
                  lable.textColor = UIColor("#466719")
                 lable.text = "入场日期"
           lable.textAlignment = .center
                 return lable
           }()
    
    private lazy var buyDateValue: UILabel = {
          let lable = UILabel.init()
          lable.font = UIFont.systemFont(ofSize: 12)
           lable.textColor = UIColor("#666666")
          lable.text = "2020-08-04"
    lable.textAlignment = .center
          return lable
    }()
    
    private lazy var totalAmount: UILabel = {
                 let lable = UILabel.init()
                 lable.font = UIFont.systemFont(ofSize: 14)
                  lable.textColor = UIColor("#466719")
                 lable.text = "持有金额"
        lable.textAlignment = .right
                 return lable
           }()
    
    private lazy var totalAmountValue: UILabel = {
                    let lable = UILabel.init()
                    lable.font = UIFont.systemFont(ofSize: 14)
                     lable.textColor = UIColor("#cd4f39")
                    lable.text = "5000"
           lable.textAlignment = .right
                    return lable
              }()
    
    private lazy var stock: UILabel = {
             let lable = UILabel.init()
             lable.font = UIFont.systemFont(ofSize: 11)
              lable.textColor = UIColor("#d75d56")
             lable.text = "宁德时代，宁德时代，宁德时代，宁德时代，宁德时代，宁德时代，宁德时代，宁德时代，宁德时代，"
        lable.numberOfLines = 0
             return lable
       }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        self.backgroundColor = UIColor.white
        self.addSubview(self.fundName)
        self.addSubview(self.fundNumber)
        self.addSubview(self.totalAmount)
        self.addSubview(self.buyDate)
        self.addSubview(self.fundNameValue)
        self.addSubview(self.buyDateValue)
        self.addSubview(self.totalAmountValue)
        self.addSubview(self.stock)
        
        
        self.fundName.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(10)
            make.left.equalToSuperview().offset(15)
        }
        
        self.fundNameValue.snp.makeConstraints { (make) in
            make.top.equalTo(self.fundName.snp.bottom).offset(5)
            make.left.equalTo(self.fundName.snp.left)
        }
        
        self.fundNumber.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.fundNameValue.snp.centerY)
            make.left.equalTo(self.fundNameValue.snp.right).offset(5)
        }
        
        
        self.buyDate.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(10)
            make.centerX.equalToSuperview()
        }
        
        self.buyDateValue.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(self.buyDate.snp.bottom).offset(5)
        }
        
        self.totalAmount.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-15)
        }
        
        self.totalAmountValue.snp.makeConstraints { (make) in
            make.top.equalTo(self.totalAmount.snp.bottom).offset(5)
            make.right.equalTo(self.totalAmount.snp.right)
        }
        
        
        self.stock.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(15)
            make.right.equalToSuperview().offset(-15)
            make.bottom.equalToSuperview()
            make.height.equalTo(40)
        }
        
        let lineView = UIView.init()
        lineView.backgroundColor = UIColor("#dcd8d9")
        self.addSubview(lineView)
        lineView.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
            make.height.equalTo(1/UIScreen.main.scale)
        }
    }
    
    func loadData(_ model: FundSectionModel) {
        
    }
    
}
