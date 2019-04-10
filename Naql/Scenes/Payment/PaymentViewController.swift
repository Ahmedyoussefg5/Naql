//
//  RefuseMessageViewController.swift
//  Naql
//
//  Created by Youssef on 4/10/19.
//  Copyright © 2019 Youssef. All rights reserved.
//

import UIKit

class PaymentViewController: UIViewController {
    lazy var mainTableView: UITableView = {
        let tableV = UITableView()
//        tableV.isTransperant()
        tableV.backgroundColor = .clear
        tableV.isOpaque = false
        tableV.backgroundView = nil
        tableV.tableFooterView = UIView()
        tableV.allowsSelection = ya
        tableV.delegate = self
        tableV.dataSource = self
        tableV.viewCornerRadius = 10
        tableV.viewBorderColor = .paleGreyTwo
        tableV.viewBorderWidth = 0.5
//        tableV.register(BankAccountsTableCell.self, forCellReuseIdentifier: "BankAccountsTableCell")
        return tableV
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBarApperance(title: "سداد", showNotifButton: false)
        view.backgroundColor = .white
        view.addSubview(mainTableView)
        mainTableView.fillSuperview(padding: UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20))
    }
}

extension PaymentViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "PaymentViewControllerCell")
        switch indexPath.row {
        case 0:
            cell.imageView?.image = #imageLiteral(resourceName: "visa")
        case 1:
            cell.imageView?.image = #imageLiteral(resourceName: "mastercard")
        default:
            cell.textLabel?.text = "التحويل البنكي"
            cell.textLabel?.font = UIFont.CairoRegular(of: 14)
            cell.textLabel?.textColor = #colorLiteral(red: 0.9062754512, green: 0.7223733068, blue: 0.1214175597, alpha: 1)
        }
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        navigationController?.pushViewController(VisaViewController(), animated: ya)
    }
}
