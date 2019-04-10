//
//  RefuseMessageViewController.swift
//  Naql
//
//  Created by Youssef on 4/10/19.
//  Copyright © 2019 Youssef. All rights reserved.
//

import UIKit

class PaymentProveView: BaseView {
    private let moneyBox: NewRequestsTextField = {
        let txt = NewRequestsTextField(placeHolder: "المبلغ")
        txt.viewCornerRadius = 9
        return txt
    }()
    private let recpNumBox: NewRequestsTextField = {
        let txt = NewRequestsTextField(placeHolder: "رقم الفاتورة")
        txt.viewCornerRadius = 9
        return txt
    }()
    private let paymentNumBox: NewRequestsTextField = {
        let txt = NewRequestsTextField(placeHolder: "رقم السداد")
        txt.viewCornerRadius = 9
        return txt
    }()
    private let bankBox: NewRequestsTextField = {
        let txt = NewRequestsTextField(placeHolder: "البنك")
        txt.viewCornerRadius = 9
        return txt
    }()
    private let recpLable: NewRequestsLable = {
        let lable = NewRequestsLable(text: "اضف صورة من ايصال التحويل")
        return lable
    }()
    var userPictureImageView: UIButton = {
        var btn = UIButton()
        btn.setBackgroundImage(#imageLiteral(resourceName: "addpic"), for: .normal)
        btn.imageView?.contentMode = .scaleAspectFill
//        btn.layer.borderColor = UIColor.paleGreyTwo.cgColor
//        btn.layer.borderWidth = 1
        btn.clipsToBounds = true
        btn.layer.cornerRadius = 45
        btn.widthAnchorConstant(constant: 90)
        btn.heightAnchorConstant(constant: 90)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    lazy var gradientLayer: LinearGradientLayer = {
        let gradientLayer = LinearGradientLayer(colors: [#colorLiteral(red: 0.882707119, green: 0.6987941861, blue: 0.09962636977, alpha: 1), #colorLiteral(red: 0.8282236457, green: 0.6515137553, blue: 0.07690628618, alpha: 1)])
        gradientLayer.direction = .bottomLeftToTopRight
        gradientLayer.cornerRadius = 15
        return gradientLayer
    }()
    lazy var confirmButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("تأكيد الدفع", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.layer.insertSublayer(gradientLayer, at: 0)
        btn.titleLabel?.font = .CairoSemiBold(of: 15)
        btn.layer.cornerRadius = 15
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTheTarget(action: {[weak self] in
//            self?.goToNewRequestsViewController()
        })
        return btn
    }()
    override func setupView() {
        let boxStack = UIStackView(arrangedSubviews: [moneyBox, recpNumBox, paymentNumBox, bankBox
            ])
        boxStack.axis = v
        boxStack.spacing = 10
        boxStack.distribution = .fillEqually
        addSubview(boxStack)
        ActivateConstraint([
            boxStack.centerXInSuperview(),
            boxStack.widthAnchorWithMultiplier(multiplier: 0.9),
            boxStack.topAnchorSuperView(constant: 20),
            boxStack.heightAnchorConstant(constant: 170)
            ])
        addSubview(recpLable)
        addSubview(userPictureImageView)
        ActivateConstraint([
//            recpLable.widthAnchorConstant(constant: 0.9),
            recpLable.centerXInSuperview(),
            recpLable.topAnchor.constraint(equalTo: boxStack.bottomAnchor, constant: 20),
            userPictureImageView.topAnchor.constraint(equalTo: recpLable.bottomAnchor, constant: 10),
            userPictureImageView.centerXInSuperview()
            ])
        addSubview(confirmButton)
        ActivateConstraint([
            confirmButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.9),
            confirmButton.heightAnchor.constraint(equalToConstant: 40),
            confirmButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            confirmButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -30)
            ])
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = confirmButton.bounds
    }
}
