//
//  RefuseMessageViewController.swift
//  Naql
//
//  Created by Youssef on 4/10/19.
//  Copyright © 2019 Youssef. All rights reserved.
//

import UIKit

class RefuseMessageViewController: UIViewController, SendResult {
    func result(name: String) {
        resonButton.setTitle(name, for: .normal)
    }
    
    private lazy var resonButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("اختر سبب الاعتراض", for: .normal)
        btn.contentHorizontalAlignment = .right
        btn.titleEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        btn.setTitleColor(.blueGrey, for: .normal)
        btn.titleLabel?.font = .CairoSemiBold(of: 15)
        btn.layer.cornerRadius = 15
        btn.viewBorderColor = #colorLiteral(red: 0.921471417, green: 0.921626091, blue: 0.9214496017, alpha: 1)
        btn.viewBorderWidth = 0.5
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTheTarget(action: {[weak self] in
            let pick = PickerViewController(itemsToShow: ["سبب ١", "سبب ٢"])
            pick.delegate = self
            self?.presentModelyVC(vc: pick)
        })
        return btn
    }()
    let messageTextView: UITextView = {
        let txtView = UITextView()
        txtView.backgroundColor = .clear
        txtView.layer.cornerRadius = 8
        txtView.layer.borderWidth = 1
        txtView.layer.borderColor = #colorLiteral(red: 0.921471417, green: 0.921626091, blue: 0.9214496017, alpha: 1)
        txtView.font = .CairoBold(of: 14)
        txtView.textColor = .blueGrey
        txtView.textAlignment = .natural
        txtView.translatesAutoresizingMaskIntoConstraints = false
        return txtView
    }()
    lazy var sendButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("ارسال", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = .CairoSemiBold(of: 15)
        btn.layer.cornerRadius = 15
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTheTarget(action: {[weak self] in
//            self?.goToNewRequestsViewController()
        })
        return btn
    }()
    lazy var gradientLayer: LinearGradientLayer = {
        let gradientLayer = LinearGradientLayer(colors: [#colorLiteral(red: 0.882707119, green: 0.6987941861, blue: 0.09962636977, alpha: 1), #colorLiteral(red: 0.8282236457, green: 0.6515137553, blue: 0.07690628618, alpha: 1)])
        gradientLayer.direction = .bottomLeftToTopRight
        gradientLayer.cornerRadius = 15
        return gradientLayer
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        sendButton.layer.insertSublayer(gradientLayer, at: 0)
        view.addSubview(resonButton)
        NSLayoutConstraint.activate([
            resonButton.heightAnchor.constraint(equalToConstant: 50),
            resonButton.centerXInSuperview(),
            resonButton.widthAnchorWithMultiplier(multiplier: 0.9),
            resonButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20)
            ])
        view.addSubview(messageTextView)
        NSLayoutConstraint.activate([
            messageTextView.topAnchor.constraint(equalTo: resonButton.bottomAnchor, constant: 20),
            messageTextView.widthAnchorWithMultiplier(multiplier: 0.9),
            messageTextView.heightAnchor.constraint(equalToConstant: 300),
            messageTextView.centerXInSuperview()
            ])
        view.addSubview(sendButton)
        NSLayoutConstraint.activate([
            sendButton.topAnchor.constraint(equalTo: messageTextView.bottomAnchor, constant: 20),
            sendButton.widthAnchorWithMultiplier(multiplier: 0.9),
            sendButton.centerXInSuperview(),
            sendButton.heightAnchor.constraint(equalToConstant: 40)
            ])
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        gradientLayer.frame = sendButton.bounds
    }
}
