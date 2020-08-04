//
//  FundViewController.swift
//  MyFund
//
//  Created by ZM on 2020/8/4.
//  Copyright © 2020 ZM. All rights reserved.
//

import UIKit

class FundViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadData()
    }
    
    @objc func setupUI() {
        self.navigationItem.title = "交易明细"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "+", style: .done, target: self, action: #selector(addFundHistory))
    }
    
    func loadData() {
        
    }
    
    
    @objc func addFundHistory() {
        let control = AddRecodViewController.init()
        let nav = UINavigationController.init(rootViewController: control)
        self.present(nav, animated: true, completion: nil)
    }

    

}
