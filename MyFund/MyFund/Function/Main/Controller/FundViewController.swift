//
//  FundViewController.swift
//  MyFund
//
//  Created by ZM on 2020/8/4.
//  Copyright © 2020 ZM. All rights reserved.
//

import UIKit
import UIColor_Hex_Swift
import SnapKit

class FundViewController: UIViewController {
    
    var dataSource: [FundSectionModel]?
    
    private lazy var tableView: UITableView = {
        let table = UITableView.init(frame: CGRect.zero, style: .plain)
        table.delegate = self
        table.dataSource = self
        table.backgroundColor = UIColor("#f7f7f7")
        table.estimatedRowHeight = 0
        table.estimatedSectionHeaderHeight = 0
        table.keyboardDismissMode = .onDrag
        table.register(FundTableViewCell.self, forCellReuseIdentifier: "Cell")
        table.separatorInset = UIEdgeInsets.init(top: 0, left: 15, bottom: 0, right: 0)
        return table
    }()

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
        self.view.addSubview(self.tableView)
        self.tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    func loadData() {
        let array = GLDatabaseManager.share().fundDataBase.selectAllFund()
        self.dataSource =  [FundSectionModel].deserialize(from: array) as? [FundSectionModel]
        self.tableView.reloadData()
    }
    
    
    @objc func addFundHistory() {
        let control = AddRecodViewController.init()
        let nav = UINavigationController.init(rootViewController: control)
        self.present(nav, animated: true, completion: nil)
    }

}


extension FundViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: FundTableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! FundTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = FundSectionHeaderView.init()
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView.init()
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.1
    }
    
}
