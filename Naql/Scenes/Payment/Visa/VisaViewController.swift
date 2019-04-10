//
//  VisaViewController.swift
//  Naql
//
//  Created by Youssef on 4/10/19.
//  Copyright © 2019 Youssef. All rights reserved.
//

import UIKit

class VisaViewController: UIViewController, SendResult {
    
    weak var sender: UIButton?
    
    func result(name: String) {
        sender?.setTitle(name, for: .normal)
    }
    
    private let cardNumberLable: PaymentLable = {
        let lable = PaymentLable(text: "رقم البطاقة")
        lable.textColor = #colorLiteral(red: 0.843057096, green: 0.7096734047, blue: 0.2560491562, alpha: 1)
        return lable
    }()
    private let cardNumberBox: NewRequestsTextField = {
        let txt = NewRequestsTextField(placeHolder: "0000-0000-0000-0000")
        txt.viewCornerRadius = 9
        return txt
    }()
    private let cardOwnerNameLable: PaymentLable = {
        let lable = PaymentLable(text: "اسم صاحب البطاقة")
        lable.textColor = #colorLiteral(red: 0.843057096, green: 0.7096734047, blue: 0.2560491562, alpha: 1)
        return lable
    }()
    private let cardExpireLable: PaymentLable = {
        let lable = PaymentLable(text: "اسم صاحب البطاقة")
        lable.textColor = #colorLiteral(red: 0.843057096, green: 0.7096734047, blue: 0.2560491562, alpha: 1)
        return lable
    }()
    private let cardOwnerNameBox: NewRequestsTextField = {
        let txt = NewRequestsTextField(placeHolder: "Ahmed Ahmed")
        txt.viewCornerRadius = 9
        return txt
    }()
    private let cardcodeLable: PaymentLable = {
        let lable = PaymentLable(text: "الرقم السري (CCV)")
        lable.textColor = #colorLiteral(red: 0.843057096, green: 0.7096734047, blue: 0.2560491562, alpha: 1)
        return lable
    }()
    private let cardcodeBox: NewRequestsTextField = {
        let txt = NewRequestsTextField(placeHolder: "")
        txt.viewCornerRadius = 9
        return txt
    }()
    private lazy var mounthButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("شهر", for: .normal)
        btn.contentHorizontalAlignment = .right
        btn.titleEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        btn.setTitleColor(.blueGrey, for: .normal)
        btn.titleLabel?.font = .CairoSemiBold(of: 15)
        btn.layer.cornerRadius = 15
        btn.viewBorderColor = #colorLiteral(red: 0.921471417, green: 0.921626091, blue: 0.9214496017, alpha: 1)
        btn.viewBorderWidth = 0.5
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addLeadingImageView(image: #imageLiteral(resourceName: "arrow_down"), width: 15, hight: 15)
        btn.addTheTarget(action: {[weak self] in
            self?.sender = btn
            let pick = PickerViewController(itemsToShow: ["سبب ١", "سبب ٢"])
            pick.delegate = self
            self?.presentModelyVC(vc: pick)
        })
        return btn
    }()
    private lazy var yearButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("سنة", for: .normal)
        btn.contentHorizontalAlignment = .right
        btn.titleEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        btn.setTitleColor(.blueGrey, for: .normal)
        btn.titleLabel?.font = .CairoSemiBold(of: 15)
        btn.layer.cornerRadius = 15
        btn.addLeadingImageView(image: #imageLiteral(resourceName: "arrow_down"), width: 15, hight: 15)
        btn.viewBorderColor = #colorLiteral(red: 0.921471417, green: 0.921626091, blue: 0.9214496017, alpha: 1)
        btn.viewBorderWidth = 0.5
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTheTarget(action: {[weak self] in
            self?.sender = btn
            let pick = PickerViewController(itemsToShow: ["سبب ١", "سبب ٢"])
            pick.delegate = self
            self?.presentModelyVC(vc: pick)
        })
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
        btn.titleLabel?.font = .CairoSemiBold(of: 15)
        btn.layer.cornerRadius = 15
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.layer.insertSublayer(gradientLayer, at: 0)
        btn.addTheTarget(action: {[weak self] in
//            self?.goToNewRequestsViewController()
        })
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let buttonsStack = UIStackView(arrangedSubviews: [yearButton, mounthButton])

        buttonsStack.axis = .horizontal
        buttonsStack.spacing = 30
        buttonsStack.distribution = .fillEqually
        
        let allStack = UIStackView(arrangedSubviews: [cardNumberLable, cardNumberBox,
                                                      stackSpliter(),
                                                     cardOwnerNameLable, cardOwnerNameBox,
                                                     stackSpliter(),
                                                     cardExpireLable, buttonsStack,
                                                     stackSpliter(),
                                                     cardcodeLable, cardcodeBox
                                                     ])
        allStack.axis = v
        allStack.spacing = 5
        view.addSubview(allStack)
        allStack.translatesAutoresizingMaskIntoConstraints = no
        NSLayoutConstraint.activate([
            allStack.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            allStack.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
            allStack.heightAnchor.constraint(equalToConstant: 320),
            allStack.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            ])
        view.addSubview(confirmButton)
        view.ActivateConstraint([
            confirmButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
            confirmButton.heightAnchor.constraint(equalToConstant: 40),
            confirmButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            confirmButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30)
            ])
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        gradientLayer.frame = confirmButton.bounds
    }

}
