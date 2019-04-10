//
//  NewRequestView.swift
//  Naql
//
//  Created by Youssef on 4/9/19.
//  Copyright © 2019 Youssef. All rights reserved.
//

import UIKit
import DLRadioButton

protocol ShowHome: class {
    func goToHome()
}

class NewRequestView: UIView {
    private let scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.alwaysBounceVertical = true
        scroll.contentSize.height = 600
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()
    private lazy var radioView: UIView = {
        let radioView = UIView()
        radioView.backgroundColor = #colorLiteral(red: 0.9959738851, green: 0.9961403012, blue: 0.9959504008, alpha: 1)
        radioView.viewBorderColor = #colorLiteral(red: 0.9371561408, green: 0.9373133779, blue: 0.9371339679, alpha: 1)
        radioView.viewBorderWidth = 1
        radioView.viewCornerRadius = 19
        return radioView
    }()
    private let radioLable: NewRequestsLable = {
        let lable = NewRequestsLable(text: "نوع الرحلة")
        return lable
    }()
    private lazy var radioGoOnly: DLRadioButton = {
        let fram = CGRect(x: 0, y: 0, width: 150, height: 17)
        return createRadioButton(frame: fram, title: "ذهاب", color: #colorLiteral(red: 0.9913578629, green: 0.8508614898, blue: 0.4721890092, alpha: 1))
    }()
    private lazy var radioGoAndReturn: DLRadioButton = {
        let fram = CGRect(x: 0, y: 0, width: 150, height: 17)
        return createRadioButton(frame: fram, title: "ذهاب وعودة", color: #colorLiteral(red: 0.9913578629, green: 0.8508614898, blue: 0.4721890092, alpha: 1))
    }()
    private let firstPlaceLable: NewRequestsLable = {
        let lable = NewRequestsLable(text: "مكان التحميل")
        return lable
    }()
    private let firstPlaceBox: NewRequestsTextField = {
        let txt = NewRequestsTextField(placeHolder: "اسم المدينة")
        return txt
    }()
    private let secondPlaceLable: NewRequestsLable = {
        let lable = NewRequestsLable(text: "مكان التفريغ")
        return lable
    }()
    private let secondPlaceBox: NewRequestsTextField = {
        let txt = NewRequestsTextField(placeHolder: "اسم المدينة")
        return txt
    }()
    private let wightLable: NewRequestsLable = {
        let lable = NewRequestsLable(text: "الوزن بالطن")
        return lable
    }()
    private let wightBox: NewRequestsTextField = {
        let btn = NewRequestsTextField(placeHolder: "مثال: ٤٥ طن")
        return btn
    }()
    private let carKindLable: NewRequestsLable = {
        let lable = NewRequestsLable(text: "نوع المقطورة")
        return lable
    }()
    private let carKindBox: NewRequestsTextField = {
        let btn = NewRequestsTextField(placeHolder: "مثال: سزوكي")
        return btn
    }()
    private let priceLable: NewRequestsLable = {
        let lable = NewRequestsLable(text: "السعر")
        return lable
    }()
    private let priceBox: NewRequestsTextField = {
        let txt = NewRequestsTextField(placeHolder: "اكتب السعر هنا")
        return txt
    }()
    private lazy var newRequestButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("طلب جديد", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = .CairoSemiBold(of: 15)
        btn.layer.cornerRadius = 15
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTheTarget(action: {[weak self] in
            self?.handleNewRequestButton()
        })
        return btn
    }()
    private lazy var gradientLayer: LinearGradientLayer = {
        let gradientLayer = LinearGradientLayer(colors: [#colorLiteral(red: 0.882707119, green: 0.6987941861, blue: 0.09962636977, alpha: 1), #colorLiteral(red: 0.8282236457, green: 0.6515137553, blue: 0.07690628618, alpha: 1)])
        gradientLayer.direction = .bottomLeftToTopRight
        gradientLayer.cornerRadius = 15
        return gradientLayer
    }()
    private lazy var newRequestAlertView: NewRequestAlertView = {
        let view = NewRequestAlertView()
        view.alpha = 0
        view.disMiss = {[weak self] in
            self?.showHome?.goToHome()
        }
        return view
    }()
    
    weak var showHome: ShowHome?
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupView()
        newRequestButton.layer.insertSublayer(gradientLayer, at: 0)
    }; required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = newRequestButton.bounds
    }
    
    private func setupView() {
        addSubview(scrollView)
        ActivateConstraint([
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor)
            ])
        addSubview(newRequestAlertView)
        newRequestAlertView.fillSuperview()
        
        let stack = UIStackView(arrangedSubviews: [
            radioLable, radioView,
            stackSpliter(),
            firstPlaceLable, firstPlaceBox,
            stackSpliter(),
            secondPlaceLable, secondPlaceBox,
            stackSpliter(),
            wightLable, wightBox,
            stackSpliter(),
            carKindLable, carKindBox,
            stackSpliter(),
            priceLable, priceBox,
            stackSpliter(), stackSpliter(), stackSpliter(), stackSpliter(),
            newRequestButton
            ])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 4
        stack.axis = .vertical
        scrollView.addSubview(stack)
        ActivateConstraint([
            stack.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 10),
            stack.widthAnchor.constraint(equalTo:  widthAnchor, multiplier: 0.9),
            stack.centerXAnchor.constraint(equalTo:  centerXAnchor),
            ])
        let radioStack = UIStackView(arrangedSubviews: [radioGoOnly, radioGoAndReturn])
        radioStack.axis = .horizontal
        radioStack.distribution = .fillEqually
        radioView.addSubview(radioStack)
        radioStack.fillSuperview(padding: UIEdgeInsets(top: 10, left: 50, bottom: 10, right: 50))
    }
    
    private func handleNewRequestButton() {
        UIView.animate(withDuration: 0.8, animations: {[weak self] in
            self?.newRequestAlertView.alpha = 1
        })
    }
}

extension NewRequestView {
    private func createRadioButton(frame : CGRect, title : String, color : UIColor) -> DLRadioButton {
        let radioButton = DLRadioButton(frame: frame)
        radioButton.titleLabel?.font = .CairoSemiBold(of: 14)
        radioButton.setTitle(title, for: [])
        radioButton.setTitleColor(color, for: [])
        radioButton.iconColor = color
        radioButton.indicatorColor = color
        radioButton.contentHorizontalAlignment = .left
        radioButton.addTarget(self, action: #selector(logSelectedButton), for: .touchUpInside);
        return radioButton
    }
    
    @objc private func logSelectedButton(radioButton: DLRadioButton) {
        var radios = [radioGoOnly, radioGoAndReturn]
        radios.removeAll {
            $0 == radioButton
        }
        radios.forEach({
            $0.isSelected = false
        })
        
        //        if radioButton.isMultipleSelectionEnabled {
        //            for button in radioButton.selectedButtons() {
        //                print(String(format: "%@ is selected.\n", button.titleLabel!.text!));
        //            }
        //        } else {
        //            print(String(format: "%@ is selected.\n", radioButton.selected()!.titleLabel!.text!));
        //        }
    }
}

class NewRequestAlertView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }; required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    private lazy var newRequestButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("الصفحة الرئسية", for: .normal)
        btn.setTitleColor(#colorLiteral(red: 0.882707119, green: 0.6987941861, blue: 0.09962636977, alpha: 1), for: .normal)
        btn.titleLabel?.font = .CairoSemiBold(of: 15)
        btn.layer.cornerRadius = 15
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTheTarget(action: {[weak self] in
            if self?.disMiss != nil {
                self?.disMiss!()
            }
        })
        return btn
    }()
    
    var disMiss: (() -> ())?
    
    private func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = UIColor.black.withAlphaComponent(0.35)
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.viewCornerRadius = 5
        addSubview(view)
        ActivateConstraint([
            view.centerYAnchor.constraint(equalTo: centerYAnchor),
            view.centerXAnchor.constraint(equalTo: centerXAnchor),
            view.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.9),
            view.heightAnchor.constraint(equalToConstant: 180)
            ])
        
        let messageLable = NewRequestsLable(text: "تم ارسال طلبك الي التاجر والمسوقين، في حال الموافقة سيأتيك اشعار.")
        messageLable.numberOfLines = 0
        messageLable.textColor = #colorLiteral(red: 0.882707119, green: 0.6987941861, blue: 0.09962636977, alpha: 1)
        messageLable.textAlignment = .center
        view.addSubview(messageLable)
        messageLable.fillSuperview(padding: UIEdgeInsets(top: 10, left: 10, bottom: 70, right: 10))
        view.addSubview(newRequestButton)
        ActivateConstraint([
            newRequestButton.widthAnchor.constraint(equalTo: view.widthAnchor),
            newRequestButton.heightAnchor.constraint(equalToConstant: 50),
            newRequestButton.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            newRequestButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            ])
        let splitView = UIView()
        splitView.backgroundColor = #colorLiteral(red: 0.8312843442, green: 0.8314247727, blue: 0.8312646747, alpha: 1)
        view.addSubview(splitView)
        splitView.translatesAutoresizingMaskIntoConstraints = false
        ActivateConstraint([
            splitView.widthAnchor.constraint(equalTo: newRequestButton.widthAnchor),
            splitView.heightAnchor.constraint(equalToConstant: 1.2),
            splitView.bottomAnchor.constraint(equalTo: newRequestButton.topAnchor),
            splitView.centerXAnchor.constraint(equalTo: newRequestButton.centerXAnchor)
            ])
    }
}
