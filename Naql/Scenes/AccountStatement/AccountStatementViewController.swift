//
//  RefuseMessageViewController.swift
//  Naql
//
//  Created by Youssef on 4/10/19.
//  Copyright © 2019 Youssef. All rights reserved.
//

import UIKit

class AccountStatementViewController: UIViewController {
    lazy var mainTableView: UITableView = {
        let tableV = UITableView()
        tableV.isTransperant()
        tableV.separatorColor = .clear
        tableV.delegate = self
        tableV.dataSource = self
        tableV.allowsSelection = no
        tableV.register(AccountStatementCell.self, forCellReuseIdentifier: "AccountStatementCell")
        return tableV
    }()
    lazy var acceptButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("تحميل الفواتير", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = .CairoSemiBold(of: 15)
        btn.layer.cornerRadius = 20
        btn.backgroundColor = #colorLiteral(red: 0.9209308028, green: 0.722579658, blue: 0.1201269105, alpha: 1)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    lazy var refuseButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("طباعة الفواتير", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = .CairoSemiBold(of: 15)
        btn.layer.cornerRadius = 20
        btn.backgroundColor  = #colorLiteral(red: 0.8347420096, green: 0.1139526293, blue: 0.1157940701, alpha: 1)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBarApperance(title: "كشف حساب", showNotifButton: false)
        view.backgroundColor = .white
        view.addSubview(mainTableView)
        mainTableView.fillSuperview()
    }
}

extension AccountStatementViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AccountStatementCell", for: indexPath) as! AccountStatementCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 110
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = .white
        let containerView: UIView = {
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.viewBorderWidth = 0.5
            view.viewCornerRadius = 8
            view.viewBorderColor = #colorLiteral(red: 0.89402318, green: 0.8941735625, blue: 0.89400208, alpha: 1)
            view.backgroundColor = .white
            view.layer.applySketchShadow(color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.19), alpha: 1, x: 0, y: 3, blur: 2, spread: 0)
            return view
        }()
        
        view.addSubview(containerView)
        NSLayoutConstraint.activate([
            containerView.heightAnchor.constraint(equalToConstant: 35),
            containerView.widthAnchorWithMultiplier(multiplier: 0.9),
            containerView.centerXInSuperview(),
            containerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 10)
            ])
        
        let totalLable: LablesOne = {
            let label = LablesOne(textOne: "الإجمالي")
            label.textAlignment = .right
            return label
        }()
        let totalLableValue: LablesOne = {
            let label = LablesOne(textOne: "٢١٣ رس")
            return label
        }()
        containerView.addSubview(totalLableValue)
        NSLayoutConstraint.activate([
            totalLableValue.centerYInSuperview(),
            totalLableValue.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            ])
        containerView.addSubview(totalLable)
        NSLayoutConstraint.activate([
            totalLable.centerYInSuperview(),
            totalLable.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
            ])
        
        let buttonsStack =
            UIStackView(arrangedSubviews: [refuseButton,
                                           acceptButton
                ])
        buttonsStack.axis = h
        buttonsStack.spacing = 20
        buttonsStack.distribution = .fillEqually
        buttonsStack.translatesAutoresizingMaskIntoConstraints = no
        view.addSubview(buttonsStack)
        NSLayoutConstraint.activate([
            buttonsStack.centerXInSuperview(),
            buttonsStack.topAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 10),
            buttonsStack.widthAnchorWithMultiplier(multiplier: 0.85),
            
            ])
        return view
    }
}

class AccountStatementCell: UITableViewCell {
    private lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.viewBorderWidth = 0.5
        view.viewCornerRadius = 8
        view.viewBorderColor = #colorLiteral(red: 0.89402318, green: 0.8941735625, blue: 0.89400208, alpha: 1)
        view.backgroundColor = .white
        view.layer.applySketchShadow(color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.19), alpha: 1, x: 0, y: 3, blur: 2, spread: 0)
        return view
    }()
    private lazy var recNumber: LablesOne = {
        let label = LablesOne(textOne: "فاتوره رقم ٣٢٢")
        label.textAlignment = .right
        return label
    }()
    private lazy var dateLable: LablesOne = {
        let label = LablesOne(textOne: "التاريخ: ٢١/٢١/١٢١١")
        label.font = .CairoRegular(of: 14)
        label.textAlignment = .right
        return label
    }()
    private lazy var priceLable: LablesOne = {
        let label = LablesOne(textOne: "المبلغ: ٢٣١ رس")
        label.font = .CairoRegular(of: 14)
        label.textAlignment = .right
        return label
    }()
    private lazy var dowenloadImageView: SmallUIImageView = {
        let img = SmallUIImageView(image: #imageLiteral(resourceName: "download"))
        return img
    }()
    private lazy var printImageView: SmallUIImageView = {
        let img = SmallUIImageView(image: #imageLiteral(resourceName: "print"))
        return img
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }; required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    private func setupView() {
        contentView.addSubview(containerView)
        containerView.fillSuperview(padding: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
        
        let lablesContainerViewStack =
            UIStackView(arrangedSubviews: [recNumber,
                                           stackSpliterGray(),
                                           dateLable,
                                           priceLable,
                                           ])
        lablesContainerViewStack.axis = .vertical
        lablesContainerViewStack.spacing = 5
        lablesContainerViewStack.translatesAutoresizingMaskIntoConstraints = no
        containerView.addSubview(lablesContainerViewStack)
        lablesContainerViewStack.fillSuperview(padding: UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5))

        let imagesContainerViewStack =
            UIStackView(arrangedSubviews: [dowenloadImageView,
                                           stackSpliterGray(),
                                           printImageView,
                                           ])
        imagesContainerViewStack.axis = .vertical
        imagesContainerViewStack.spacing = 5
        imagesContainerViewStack.translatesAutoresizingMaskIntoConstraints = no
        containerView.addSubview(imagesContainerViewStack)
        ActivateConstraint([
            imagesContainerViewStack.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -5),
            imagesContainerViewStack.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 5),
            imagesContainerViewStack.widthAnchor.constraint(equalToConstant: 22),
            imagesContainerViewStack.heightAnchor.constraint(equalToConstant: 45)
            ])

        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.835205555, green: 0.8353466392, blue: 0.8351857066, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = no
        containerView.addSubview(view)
        ActivateConstraint([
            view.leadingAnchor.constraint(equalTo: imagesContainerViewStack.trailingAnchor, constant: 5),
            view.bottomAnchor.constraint(equalTo: imagesContainerViewStack.bottomAnchor),
            view.widthAnchor.constraint(equalToConstant: 1.5),
            view.heightAnchor.constraint(equalTo: imagesContainerViewStack.heightAnchor)
            ])
    }
}

class SmallUIImageView: UIImageView {
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 20, height: 20)
    }
    override init(image: UIImage?) {
        super.init(image: image)
        clipsToBounds = true
        contentMode = .scaleToFill
        translatesAutoresizingMaskIntoConstraints = false
    }; required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
}
