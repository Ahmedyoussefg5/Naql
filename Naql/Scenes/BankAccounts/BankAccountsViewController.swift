//
//  RefuseMessageViewController.swift
//  Naql
//
//  Created by Youssef on 4/10/19.
//  Copyright © 2019 Youssef. All rights reserved.
//

import UIKit

class BankAccountsViewController: UIViewController {
    lazy var mainTableView: UITableView = {
        let tableV = UITableView()
//        tableV.isTransperant()
        tableV.allowsSelection = no
//        tableV.separatorColor = .clear
        tableV.delegate = self
        tableV.dataSource = self
        tableV.viewCornerRadius = 10
        tableV.viewBorderColor = .paleGreyTwo
        tableV.viewBorderWidth = 0.5
        tableV.applySketchShadow()
        tableV.register(BankAccountsTableCell.self, forCellReuseIdentifier: "BankAccountsTableCell")
        return tableV
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBarApperance(title: "الحسابات البنكية", showNotifButton: false)
        view.backgroundColor = .white
        view.addSubview(mainTableView)
        mainTableView.fillSuperview(padding: UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20))
    }
}

extension BankAccountsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BankAccountsTableCell", for: indexPath) as! BankAccountsTableCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

class BankAccountsTableCell: UITableViewCell {
    private lazy var userImage: UIImageView = {
        let img = UIImageView()
        img.clipsToBounds = true
        img.contentMode = .scaleToFill
        img.layer.applySketchShadow(color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.19), alpha: 1, x: 0, y: 3, blur: 2, spread: 0)
        img.image = #imageLiteral(resourceName: "visa")
        img.viewCornerRadius = 35
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    private lazy var accountOwnerLable = getLable()
    private lazy var accountNumberLable = getLable()
    private lazy var baynNumberLable = getLable()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        accountOwnerLable.text = "اسم صاحب الحساب: محمد محمد"
        accountNumberLable.text = "رقم الحساب: 1232131231231"
        baynNumberLable.text = "رقم البيان: dsf23n23n25n6n7"
        setupView()
    }; required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    func getLable() -> UILabel {
        let lable = UILabel()
        lable.font = .CairoRegular(of: 13)
        lable.textColor = #colorLiteral(red: 0.26613006, green: 0.3053130507, blue: 0.3319741189, alpha: 1)
        lable.textAlignment = .right
        return lable
    }
    
    private func setupView() {
        contentView.addSubview(userImage)
        ActivateConstraint([
            userImage.centerYInSuperview(),
            userImage.widthAnchorConstant(constant: 70),
            userImage.heightAnchorConstant(constant: 70),
            userImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10)
            ])
        
        let lablesStack = UIStackView(arrangedSubviews: [accountOwnerLable, accountNumberLable, baynNumberLable])
        lablesStack.axis = v
//        radioStack.distribution = .fillEqually
        contentView.addSubview(lablesStack)
        ActivateConstraint([
            lablesStack.trailingAnchor.constraint(equalTo: userImage.leadingAnchor, constant: -10),
            lablesStack.centerYInSuperview(),
            lablesStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10)
            ])
    }
}
