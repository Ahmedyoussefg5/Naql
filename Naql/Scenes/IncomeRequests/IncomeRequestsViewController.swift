//
//  RefuseMessageViewController.swift
//  Naql
//
//  Created by Youssef on 4/10/19.
//  Copyright © 2019 Youssef. All rights reserved.
//

import UIKit

class IncomeRequestsViewController: UIViewController {
    lazy var mainTableView: UITableView = {
        let tableV = UITableView()
        tableV.isTransperant()
        tableV.separatorColor = .clear
        tableV.delegate = self
        tableV.dataSource = self
        tableV.register(MyRequestsCell.self, forCellReuseIdentifier: "IncomeRequests")
        return tableV
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBarApperance(title: "طلبات العمل", showNotifButton: false)
        view.backgroundColor = .white
        view.addSubview(mainTableView)
        mainTableView.fillSuperview()
    }
}
extension IncomeRequestsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "IncomeRequests", for: indexPath) as! MyRequestsCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 170
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigationController?.pushViewController(RequestDetailsViewController(), animated: true)
    }
}
