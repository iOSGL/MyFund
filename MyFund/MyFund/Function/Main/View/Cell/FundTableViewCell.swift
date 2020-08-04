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
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(15)
        }
    }

}
