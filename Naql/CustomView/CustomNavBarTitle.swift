//
//  CustomNavBarTitle.swift
//  Naql
//
//  Created by Youssef on 4/8/19.
//  Copyright © 2019 Youssef. All rights reserved.
//

import UIKit

class CustomNavBarTitle: UIView {
    var buttonAction: ((_ tag: Int) -> Void)?
    private lazy var menuBarButton: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setBackgroundImage(#imageLiteral(resourceName: "menu"), for: .normal)
        btn.addTarget(self, action: #selector(handleButton), for: .touchUpInside)
        btn.tag = 1
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
//    private lazy var notifBarButton: UIButton = {
//        let btn = UIButton(type: .custom)
//        btn.setBackgroundImage(#imageLiteral(resourceName: "notification"), for: .normal)
//        btn.addTarget(self, action: #selector(handleButton), for: .touchUpInside)
//        btn.tag = 2
//        btn.clipsToBounds = true
//        btn.translatesAutoresizingMaskIntoConstraints = false
//        return btn
//    }()
    private lazy var lable: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .right
        label.font = .CairoSemiBold(of: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    init(title: String) {
        super.init(frame: .zero)
        lable.text = title.localize
        setupView()
    }; required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    private func setupView() {
//        addSubview(notifBarButton)
        addSubview(menuBarButton)
        addSubview(lable)
        let height = CGFloat(25)
        NSLayoutConstraint.activate([
            menuBarButton.widthAnchor.constraint(equalToConstant: height),
            menuBarButton.heightAnchor.constraint(equalToConstant: height),
            menuBarButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            menuBarButton.centerYAnchor.constraint(equalTo: centerYAnchor)
            ])
//        NSLayoutConstraint.activate([
//            notifBarButton.widthAnchor.constraint(equalToConstant: height),
//            notifBarButton.heightAnchor.constraint(equalToConstant: height),
//            notifBarButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
//            notifBarButton.centerYAnchor.constraint(equalTo: centerYAnchor)
//            ])
        NSLayoutConstraint.activate([
            lable.trailingAnchor.constraint(equalTo: menuBarButton.leadingAnchor, constant: -10),
            lable.centerYAnchor.constraint(equalTo: centerYAnchor),
            lable.centerXAnchor.constraint(equalTo: centerXAnchor)
            ])
    }
    
    @objc fileprivate func handleButton(_ sender: UIButton) {
        buttonAction?(sender.tag)
    }
}
