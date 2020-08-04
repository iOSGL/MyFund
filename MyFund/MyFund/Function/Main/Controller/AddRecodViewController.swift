//
//  AddRecodViewController.swift
//  MyFund
//
//  Created by ZM on 2020/8/4.
//  Copyright © 2020 ZM. All rights reserved.
//

import UIKit

class AddRecodViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    @objc func setupUI() {
        self.view.backgroundColor = UIColor.white
        self.navigationItem.title = "添加"
           self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "完成", style: .done, target: self, action: #selector(addComplete))
       }
    
    @objc func addComplete() {
        self.dismiss(animated: true) {
            
        }
    }
    

}
