//
//  AddRecodViewController.swift
//  MyFund
//
//  Created by ZM on 2020/8/4.
//  Copyright © 2020 ZM. All rights reserved.
//

import UIKit

class AddRecodViewController: UIViewController {
    
    var fundNumberTextFiled: UITextField?
    var fundNameTextFiled: UITextField?
    var fundAmountTextFiled: UITextField?
    var stockTextFiled: UITextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    deinit {
        
    }
    
    @objc func setupUI() {
        self.view.backgroundColor = UIColor.white
        self.navigationItem.title = "添加"
           self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "完成", style: .done, target: self, action: #selector(addComplete))
        
        
        var plView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: 10, height: 44))
        
        self.fundNumberTextFiled = UITextField.init()
        self.fundNumberTextFiled?.placeholder = "请输入基金编号"
        self.fundNumberTextFiled?.layer.borderWidth = 1
        self.fundNumberTextFiled?.layer.borderColor = UIColor("#999999").cgColor
        self.fundNumberTextFiled?.keyboardType = .numberPad
        self.fundNumberTextFiled?.leftView = plView
        self.fundNumberTextFiled?.leftViewMode = .always
        self.fundAmountTextFiled?.tag = 1
        self.view.addSubview(self.fundNumberTextFiled!)
       
        self.fundNumberTextFiled?.snp.makeConstraints({ (make) in
            make.left.equalToSuperview().offset(15)
            make.top.equalToSuperview().offset(70)
            make.height.equalTo(44)
            make.right.equalToSuperview().offset(-100)
        })
        
        let btn = UIButton.init(type: .custom)
        btn.setTitle("搜索", for: .normal)
        btn.layer.borderWidth = 1
        btn.layer.borderColor = UIColor("#0e5848").cgColor
        btn.setTitleColor(UIColor("#0e5848"), for: .normal)
        btn.addTarget(self, action: #selector(selectFund), for: .touchUpInside)
        self.view.addSubview(btn)
        btn.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-15)
            make.centerY.equalTo(self.fundNumberTextFiled!.snp.centerY)
            make.size.equalTo(CGSize.init(width: 50, height: 30))
        }
        
        
        plView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: 10, height: 44))
        self.fundNameTextFiled = UITextField.init()
        self.fundNameTextFiled?.placeholder = "请输入基金名称"
        self.fundNameTextFiled?.layer.borderWidth = 1
        self.fundNameTextFiled?.layer.borderColor = UIColor("#999999").cgColor
        self.fundNameTextFiled?.leftView = plView
        self.fundNameTextFiled?.leftViewMode = .always
        self.fundNameTextFiled?.tag = 2
        self.view.addSubview(self.fundNameTextFiled!)
        self.fundNameTextFiled?.snp.makeConstraints({ (make) in
            make.left.equalTo(self.fundNumberTextFiled!.snp.left)
            make.top.equalTo(self.fundNumberTextFiled!.snp.bottom).offset(20)
            make.size.equalTo(self.fundNumberTextFiled!.snp.size)
        })
        
         plView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: 10, height: 44))
        self.fundAmountTextFiled = UITextField.init()
        self.fundAmountTextFiled?.placeholder = "请输入金额"
        self.fundAmountTextFiled?.layer.borderWidth = 1
        self.fundAmountTextFiled?.layer.borderColor = UIColor("#999999").cgColor
        self.fundAmountTextFiled?.leftView = plView
        self.fundAmountTextFiled?.leftViewMode = .always
        self.fundAmountTextFiled?.tag = 3
        self.view.addSubview(self.fundAmountTextFiled!)
        self.fundAmountTextFiled?.snp.makeConstraints({ (make) in
            make.left.equalTo(self.fundNameTextFiled!.snp.left)
            make.top.equalTo(self.fundNameTextFiled!.snp.bottom).offset(20)
            make.size.equalTo(self.fundNameTextFiled!.snp.size)
        })
        
        plView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: 10, height: 44))
        self.stockTextFiled = UITextField.init()
        self.stockTextFiled?.placeholder = "股票名字"
        self.stockTextFiled?.layer.borderWidth = 1
        self.stockTextFiled?.layer.borderColor = UIColor("#999999").cgColor
        self.stockTextFiled?.leftView = plView
        self.stockTextFiled?.leftViewMode = .always
        self.stockTextFiled?.tag = 4
        self.view.addSubview(self.stockTextFiled!)
        self.stockTextFiled?.snp.makeConstraints({ (make) in
            make.left.equalTo(self.fundAmountTextFiled!.snp.left)
            make.top.equalTo(self.fundAmountTextFiled!.snp.bottom).offset(20)
            make.size.equalTo(self.fundAmountTextFiled!.snp.size)
        })
        
        let buyBtn = UIButton.init(type: .custom)
        buyBtn.setTitle("买入", for: .normal)
        buyBtn.layer.borderWidth = 1
        buyBtn.layer.borderColor = UIColor("#cd4f39").cgColor
        buyBtn.setTitleColor(UIColor("#cd4f39"), for: .normal)
        buyBtn.addTarget(self, action: #selector(buyFund), for: .touchUpInside)
        self.view.addSubview(buyBtn)
        buyBtn.snp.makeConstraints { (make) in
            make.top.equalTo(self.stockTextFiled!.snp.bottom).offset(50)
            make.left.equalToSuperview().offset(15)
            make.right.equalToSuperview().offset(-15)
            make.height.equalTo(44)
        }
        
        let sellBtn = UIButton.init(type: .custom)
        sellBtn.setTitle("卖出", for: .normal)
        sellBtn.layer.borderWidth = 1
        sellBtn.layer.borderColor = UIColor("#006400").cgColor
        sellBtn.setTitleColor(UIColor("#006400"), for: .normal)
        sellBtn.addTarget(self, action: #selector(sellFund), for: .touchUpInside)
        self.view.addSubview(sellBtn)
        sellBtn.snp.makeConstraints { (make) in
            make.top.equalTo(buyBtn.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(15)
            make.right.equalToSuperview().offset(-15)
            make.height.equalTo(44)
        }
       }
    
    @objc func addComplete() {
        self.dismiss(animated: true) {
            
        }
    }
    
    @objc func selectFund() {
        let dic = GLDatabaseManager.share().fundDataBase.selectFund(withFundNumber: self.fundNumberTextFiled?.text ?? "1") as? NSDictionary
        guard dic == nil else {
            return
        }
        self.fundNumberTextFiled?.text = dic?["fund_number"] as? String
        self.fundNameTextFiled?.text = (dic?["fund_name"] as! String)
        self.stockTextFiled?.text = (dic?["stock"] as! String)
       
    }
    
    @objc func sellFund() {
        
    }
    
    @objc func buyFund() {
        if !((self.fundNumberTextFiled?.text!.count)! > 0) {
            self.view.gl_showToast("请输入基金编号")
            return
        }
        
        if !((self.fundNumberTextFiled?.text!.count)  != 6) {
            self.view.gl_showToast("请输入6位数基金编号")
            return
        }
        
        if !((self.fundNameTextFiled?.text!.count)! > 0) {
            self.view.gl_showToast("请输入基金名字")
            return
        }


        if !((self.fundAmountTextFiled?.text!.count)! > 0) {
            self.view.gl_showToast("请输入金额")
            return
        }


        if !((self.stockTextFiled?.text!.count)! > 0) {
            self.view.gl_showToast("请输入股票")
            return
        }
        
        
        let dic: NSDictionary = GLDatabaseManager.share().fundDataBase.selectFund(withFundNumber: self.fundNumberTextFiled?.text ?? "1") as! NSDictionary
        if dic.count > 0 {
            
        } else {
            let dic = ["fund_number": (self.fundNumberTextFiled?.text ?? ""), "fund_name": (self.fundNameTextFiled?.text ?? ""), "total_amount": (self.fundAmountTextFiled?.text ?? ""), "stock": (self.stockTextFiled?.text ?? "")]
            GLDatabaseManager.share().fundDataBase.inserActionRecords(withInfo: dic)
        }
    }
    
}



