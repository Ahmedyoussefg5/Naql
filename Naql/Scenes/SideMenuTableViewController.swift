//
//  SideMenuTableViewController.swift
//  Tanta Services
//
//  Created by Youssef on 11/22/18.
//  Copyright © 2018 Tantaservices. All rights reserved.
//

import UIKit

class SideMenuTableViewController: UITableViewController {
    
    func tableConfiger() {
        tableView.backgroundColor = #colorLiteral(red: 0.9998950362, green: 1, blue: 0.9998714328, alpha: 1)
        tableView.isOpaque = false
        tableView.backgroundView = nil
        tableView.tableFooterView = UIView()
        tableView.isScrollEnabled = false
        tableView.separatorInset = .zero
        tableView.contentInset = .zero
        tableView.separatorColor = .clear
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "sideMenuCell")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableConfiger()
        navigationController?.setNavigationBarHidden(true, animated: true)
        if userType == .driver {
            tableViewItems = ["الرئسية", "طلباتي", "طلبات العمل", "كشف الحساب", "اثبات الدفع", "ادارة الحساب", "الحسابات البنكية", "سداد", "بريد"]
        } else if userType == .commercial {
            tableViewItems = ["الرئسية", "طلباتي", "عروض السائقين", "كشف الحساب", "اثبات الدفع", "ادارة الحساب", "الحسابات البنكية", "سداد", "بريد"]
        }
        tableView.reloadData()
    }
    
    var tableViewItems = [String]()
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45.0
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewItems.count
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 130.0
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return SideMenuTableHeader(userName: "name", UserImage: "image")
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "sideMenuCell", for: indexPath)
        cell.backgroundColor = .clear
        cell.textLabel?.text = tableViewItems[indexPath.row]
        cell.textLabel?.textColor = #colorLiteral(red: 0.8310064673, green: 0.1186366901, blue: 0.1156063303, alpha: 1)
        cell.textLabel?.font = .CairoSemiBold(of: 14)
        cell.textLabel?.textAlignment = .right
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print(indexPath.row)
        switch indexPath.row {
        case 0:
            dismissMePlease()
        case 1:
            navigationController?.pushViewController(MyRequestsViewController(), animated: true)
        case 2:
            let vc = IncomeRequestsViewController()
            vc.setupNavBarApperance(title: tableViewItems[indexPath.row], showNotifButton: false)
            navigationController?.pushViewController(vc, animated: true)
        case 3:
            navigationController?.pushViewController(AccountStatementViewController(), animated: true)
        case 4:
            navigationController?.pushViewController(PaymentProveViewController(), animated: true)
        case 6:
            navigationController?.pushViewController(BankAccountsViewController(), animated: true)
        case 7:
            navigationController?.pushViewController(PaymentViewController(), animated: true)
        default:
            return
        }
    }
}

class SideMenuTableHeader: UIView {
    private lazy var userImage: UIImageView = {
        let img = UIImageView()
        img.clipsToBounds = true
        img.contentMode = .scaleToFill
        img.image = #imageLiteral(resourceName: "checkbox")
        img.viewCornerRadius = 40
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    private lazy var userName: UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0.8310064673, green: 0.1186366901, blue: 0.1156063303, alpha: 1)
        label.textAlignment = .center
        label.font = .CairoSemiBold(of: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private lazy var curvedView: CurvedView = {
        let view = CurvedView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    init(userName: String, UserImage: String) {
        super.init(frame: .zero)
        setupView()
        self.userName.text = userName
    }; required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    private func setupView() {
        addSubview(curvedView)
        curvedView.fillSuperview()
        addSubview(userImage)
        ActivateConstraint([
            userImage.heightAnchor.constraint(equalToConstant: 80),
            userImage.widthAnchor.constraint(equalToConstant: 80),
            userImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            userImage.topAnchor.constraint(equalTo: topAnchor, constant: 40)
            ])
        addSubview(userName)
        ActivateConstraint([
            userName.centerXAnchor.constraint(equalTo: centerXAnchor),
            userName.topAnchor.constraint(equalTo: userImage.bottomAnchor, constant: 7)
            ])
    }
}

