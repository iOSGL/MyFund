//
//  FundTableViewCell.swift
//  MyFund
//
//  Created by ZM on 2020/8/4.
//  Copyright © 2020 ZM. All rights reserved.
//

import UIKit

class FundTableViewCell: UITableViewCell {
    
    private lazy var name: UILabel = {
        let lable = UILabel.init()
        lable.font = UIFont.boldSystemFont(ofSize: 15)
         lable.textColor = UIColor("#333333")
        lable.text = "富国军工"
        return lable
    }()
    
    private lazy var numberLab: UILabel = {
           let lable = UILabel.init()
           lable.font = UIFont.systemFont(ofSize: 12)
           lable.textColor = UIColor("#999999")
           lable.text = "000601"
           return lable
       }()
    
    private lazy var dateLab: UILabel = {
              let lable = UILabel.init()
              lable.font = UIFont.systemFont(ofSize: 16)
              lable.textColor = UIColor("#333333")
              lable.text = "2020-08-04"
        lable.textAlignment = .center
              return lable
          }()
    
    private lazy var amountLab: UILabel = {
          let lable = UILabel.init()
          lable.font = UIFont.boldSystemFont(ofSize: 20)
          lable.textColor = UIColor("#cd4f39")
          lable.text = "+500"
    lable.textAlignment = .right
          return lable
      }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func setupUI() {
        self.backgroundColor = UIColor.white
        self.contentView.addSubview(name)
        name.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(15)
            make.top.equalToSuperview().offset(10)
        }
        
         self.contentView.addSubview(numberLab)
                numberLab.snp.makeConstraints { (make) in
                make.left.equalToSuperview().offset(15)
                make.bottom.equalToSuperview().offset(-10)
            }
        
        
        self.contentView.addSubview(dateLab)
            dateLab.snp.makeConstraints { (make) in
                make.centerY.equalToSuperview()
                make.centerX.equalToSuperview()
        }
        
        self.contentView.addSubview(amountLab)
            amountLab.snp.makeConstraints { (make) in
                make.centerY.equalToSuperview()
                make.right.equalToSuperview().offset(-15)
        }
    }

}
