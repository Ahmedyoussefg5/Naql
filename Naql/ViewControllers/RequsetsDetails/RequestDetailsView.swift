//
//  RequestDetailsViewController.swift
//  Naql
//
//  Created by Youssef on 4/10/19.
//  Copyright © 2019 Youssef. All rights reserved.
//

import UIKit
import MapKit

class RequestDetailsView: BaseView {
    let scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.alwaysBounceVertical = true
        scroll.contentSize.height = 800
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()
    private lazy var profileContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.viewBorderWidth = 0.5
        view.viewBorderColor = #colorLiteral(red: 0.89402318, green: 0.8941735625, blue: 0.89400208, alpha: 1)
        view.backgroundColor = .white
        view.viewCornerRadius = 5
        view.layer.applySketchShadow(color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.19), alpha: 1, x: 0, y: 3, blur: 2, spread: 0)
        return view
    }()
    private lazy var userImage: UIImageView = {
        let img = UIImageView()
        img.clipsToBounds = true
        img.contentMode = .scaleToFill
        img.layer.applySketchShadow(color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.19), alpha: 1, x: 0, y: 3, blur: 2, spread: 0)
        img.image = #imageLiteral(resourceName: "markting")
        img.viewCornerRadius = 35
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    private lazy var nameLable: UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0.9167680144, green: 0.7220980525, blue: 0.3397578597, alpha: 1)
        label.textAlignment = .right
        label.text = "Name"
        label.font = .CairoBold(of: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private lazy var addressLable: UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0.9167680144, green: 0.7220980525, blue: 0.3397578597, alpha: 1)
        label.textAlignment = .right
        label.text = "Jedda"
        label.font = .CairoBold(of: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private lazy var phoneLable: UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0.9167680144, green: 0.7220980525, blue: 0.3397578597, alpha: 1)
        label.textAlignment = .right
        label.font = .CairoBold(of: 14)
        label.text = "012020311"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private lazy var detailsContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.viewBorderWidth = 0.5
        view.viewBorderColor = #colorLiteral(red: 0.89402318, green: 0.8941735625, blue: 0.89400208, alpha: 1)
        view.viewCornerRadius = 5
        view.backgroundColor = .white
        view.layer.applySketchShadow(color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.19), alpha: 1, x: 0, y: 3, blur: 2, spread: 0)
        return view
    }()
    private lazy var tripKind: TwoLablesOneLine = {
        let label = TwoLablesOneLine(textOne: "نوع الرحلة")
        return label
    }()
    private lazy var cardgeKind: TwoLablesOneLine = {
        let label = TwoLablesOneLine(textOne: "نوع الحمولة")
        return label
    }()
    private lazy var wieghtKind: TwoLablesOneLine = {
        let label = TwoLablesOneLine(textOne: "الوزن بالطن")
        return label
    }()
    private lazy var place: TwoLablesOneLine = {
        let label = TwoLablesOneLine(textOne: "مكان التحميل")
        return label
    }()
    private lazy var date: TwoLablesOneLine = {
        let label = TwoLablesOneLine(textOne: "تاريخ التحميل")
        return label
    }()
    private lazy var time: TwoLablesOneLine = {
        let label = TwoLablesOneLine(textOne: "وقت التحميل")
        return label
    }()
    private lazy var delay: TwoLablesOneLine = {
        let label = TwoLablesOneLine(textOne: "الوقت المسموح به بالتأخير")
        return label
    }()
    
    private lazy var tripKindValue: LablesOne = {
        let label = LablesOne(textOne: "نوع الرحلة")
        return label
    }()
    private lazy var cardgeKindValue: LablesOne = {
        let label = LablesOne(textOne: "نوع الحمولة")
        return label
    }()
    private lazy var wieghtKindValue: LablesOne = {
        let label = LablesOne(textOne: "الوزن بالطن")
        return label
    }()
    private lazy var placeValue: LablesOne = {
        let label = LablesOne(textOne: "مكان التحميل")
        return label
    }()
    private lazy var dateValue: LablesOne = {
        let label = LablesOne(textOne: "تاريخ التحميل")
        return label
    }()
    private lazy var timeValue: LablesOne = {
        let label = LablesOne(textOne: "وقت التحميل")
        return label
    }()
    private lazy var delayValue: LablesOne = {
        let label = LablesOne(textOne: "الوقت المسموح به بالتأخير")
        return label
    }()
    
    private lazy var overAllContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.viewBorderWidth = 0.5
        view.viewBorderColor = #colorLiteral(red: 0.89402318, green: 0.8941735625, blue: 0.89400208, alpha: 1)
        view.viewCornerRadius = 5
        view.backgroundColor = .white
        view.layer.applySketchShadow(color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.19), alpha: 1, x: 0, y: 3, blur: 2, spread: 0)
        return view
    }()
    private lazy var totalPrice: TwoLablesOneLine = {
        let label = TwoLablesOneLine(textOne: "السعر الاجمالي")
        return label
    }()
    private lazy var totalPriceValue: LablesOne = {
        let label = LablesOne(textOne: "السعر الاجمالي")
        return label
    }()
    private lazy var driverPrice: TwoLablesOneLine = {
        let label = TwoLablesOneLine(textOne: "استحقاق السائق")
        return label
    }()
    private lazy var driverPriceValue: LablesOne = {
        let label = LablesOne(textOne: "استحقاق السائق")
        return label
    }()
    private lazy var appPrice: TwoLablesOneLine = {
        let label = TwoLablesOneLine(textOne: "استحقاق التطبيق")
        return label
    }()
    private lazy var appPriceValue: LablesOne = {
        let label = LablesOne(textOne: "استحقاق التطبيق")
        return label
    }()
    
    private lazy var mapView: MKMapView = {
        let mapView = MKMapView()
        mapView.viewCornerRadius = 5
        mapView.translatesAutoresizingMaskIntoConstraints = false
        return mapView
    }()
    internal override func setupAppearance() {
        backgroundColor = .white
        acceptButton.layer.insertSublayer(acceptGradientLayer, at: 0)
        acceptButton.backgroundColor = #colorLiteral(red: 0.9209308028, green: 0.722579658, blue: 0.1201269105, alpha: 1)
        refuseButton.backgroundColor  = #colorLiteral(red: 0.8347420096, green: 0.1139526293, blue: 0.1157940701, alpha: 1)
        refuseButton.layer.insertSublayer(refuseGradientLayer, at: 0)
    }
    
    internal override func setupView() {
        addSubview(scrollView)
        scrollView.fillSuperview()
        scrollView.addSubview(profileContainerView)
        ActivateConstraint([
            profileContainerView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 10),
            profileContainerView.widthAnchorWithMultiplier(multiplier: 0.9),
            profileContainerView.heightAnchor.constraint(equalToConstant: 90),
            profileContainerView.centerXInSuperview()
            ])
        
        profileContainerView.addSubview(userImage)
        ActivateConstraint([
            userImage.widthAnchor.constraint(equalToConstant: 70),
            userImage.heightAnchor.constraint(equalToConstant: 70),
            userImage.trailingAnchor.constraint(equalTo: profileContainerView.trailingAnchor, constant: -10),
            userImage.centerYInSuperview()
            ])
        
        let lableStack = UIStackView(arrangedSubviews: [nameLable, addressLable, phoneLable])
        lableStack.axis = .vertical
        lableStack.distribution = .fillEqually
        profileContainerView.addSubview(lableStack)
        ActivateConstraint([
            lableStack.trailingAnchor.constraint(equalTo: userImage.leadingAnchor, constant: -10),
            lableStack.leadingAnchor.constraint(equalTo: profileContainerView.leadingAnchor, constant: 10),
            lableStack.centerYInSuperview()
            ])
        
        scrollView.addSubview(detailsContainerView)
        ActivateConstraint([
            detailsContainerView.topAnchor.constraint(equalTo: profileContainerView.bottomAnchor, constant: 10),
            detailsContainerView.centerXInSuperview(),
            detailsContainerView.widthAnchorWithMultiplier(multiplier: 0.9),
            detailsContainerView.heightAnchor.constraint(equalToConstant: 230)
            ])
        
        
        let detailsContainerViewStack =
            UIStackView(arrangedSubviews: [tripKind,
                                           stackSpliterGray(),
                                           cardgeKind,
                                           stackSpliterGray(),
                                           wieghtKind,
                                           stackSpliterGray(),
                                           place,
                                           stackSpliterGray(),
                                           date,
                                           stackSpliterGray(),
                                           time,
                                           stackSpliterGray(),
                                           delay,
                ])
        
        detailsContainerViewStack.axis = .vertical
        detailsContainerViewStack.spacing = 5
        detailsContainerViewStack.translatesAutoresizingMaskIntoConstraints = no
        detailsContainerView.addSubview(detailsContainerViewStack)
        ActivateConstraint([
            detailsContainerViewStack.widthAnchorWithMultiplier(multiplier: 0.95),
            detailsContainerViewStack.trailingAnchor.constraint(equalTo: detailsContainerView.trailingAnchor, constant: -10),
            detailsContainerViewStack.centerYInSuperview(),
            detailsContainerViewStack.topAnchor.constraint(equalTo: detailsContainerView.topAnchor, constant: 10)
            ])
        
        let detailsContainerViewStackInfo =
            UIStackView(arrangedSubviews: [tripKindValue,
                                           stackSpliterGray(),
                                           cardgeKindValue,
                                           stackSpliterGray(),
                                           wieghtKindValue,
                                           stackSpliterGray(),
                                           placeValue,
                                           stackSpliterGray(),
                                           dateValue,
                                           stackSpliterGray(),
                                           timeValue,
                                           stackSpliterGray(),
                                           delayValue,
                                           ])
        detailsContainerViewStackInfo.axis = .vertical
        detailsContainerViewStackInfo.spacing = 5
        detailsContainerViewStackInfo.translatesAutoresizingMaskIntoConstraints = no
        detailsContainerView.addSubview(detailsContainerViewStackInfo)
        ActivateConstraint([
            detailsContainerViewStackInfo.widthAnchorWithMultiplier(multiplier: 0.5),
            detailsContainerViewStackInfo.leadingAnchor.constraint(equalTo: detailsContainerView.leadingAnchor, constant: 10),
            detailsContainerViewStackInfo.centerYInSuperview(),
            detailsContainerViewStackInfo.topAnchor.constraint(equalTo: detailsContainerView.topAnchor, constant: 10)
            ])
        
        scrollView.addSubview(overAllContainerView)
        ActivateConstraint([
            overAllContainerView.topAnchor.constraint(equalTo: detailsContainerView.bottomAnchor, constant: 10),
            overAllContainerView.centerXInSuperview(),
            overAllContainerView.widthAnchorWithMultiplier(multiplier: 0.9),
            overAllContainerView.heightAnchor.constraint(equalToConstant: 110)
            ])
        
        let overAllContainerViewStackInfo =
            UIStackView(arrangedSubviews: [totalPrice,
                                           stackSpliterGray(),
                                           driverPrice,
                                           stackSpliterGray(),
                                           appPrice,
                                           ])
        overAllContainerViewStackInfo.axis = .vertical
        overAllContainerViewStackInfo.spacing = 5
        overAllContainerViewStackInfo.translatesAutoresizingMaskIntoConstraints = no
        overAllContainerView.addSubview(overAllContainerViewStackInfo)
        ActivateConstraint([
            overAllContainerViewStackInfo.widthAnchorWithMultiplier(multiplier: 0.5),
            overAllContainerViewStackInfo.trailingAnchor.constraint(equalTo: overAllContainerView.trailingAnchor, constant: -10),
            overAllContainerViewStackInfo.centerYInSuperview(),
            overAllContainerViewStackInfo.topAnchor.constraint(equalTo: overAllContainerView.topAnchor, constant: 10)
            ])
        
        let overAllValusContainerViewStackInfo =
            UIStackView(arrangedSubviews: [totalPriceValue,
                                           stackSpliterGray(),
                                           driverPriceValue,
                                           stackSpliterGray(),
                                           appPriceValue,
                                           ])
        overAllValusContainerViewStackInfo.axis = .vertical
        overAllValusContainerViewStackInfo.spacing = 5
        overAllValusContainerViewStackInfo.translatesAutoresizingMaskIntoConstraints = no
        overAllContainerView.addSubview(overAllValusContainerViewStackInfo)
        ActivateConstraint([
            overAllValusContainerViewStackInfo.widthAnchorWithMultiplier(multiplier: 0.5),
            overAllValusContainerViewStackInfo.leadingAnchor.constraint(equalTo: overAllContainerView.leadingAnchor, constant: 10),
            overAllValusContainerViewStackInfo.centerYInSuperview(),
            overAllValusContainerViewStackInfo.topAnchor.constraint(equalTo: overAllContainerView.topAnchor, constant: 10)
            ])
        
        scrollView.addSubview(mapView)
        ActivateConstraint([
            mapView.topAnchor.constraint(equalTo: overAllContainerView.bottomAnchor, constant: 10),
            mapView.centerXInSuperview(),
            mapView.widthAnchorWithMultiplier(multiplier: 0.9),
            mapView.heightAnchor.constraint(equalToConstant: 90)
            ])
        
        let buttonsStack =
            UIStackView(arrangedSubviews: [refuseButton,
                                           acceptButton
                                           ])
        buttonsStack.axis = h
        buttonsStack.spacing = 20
        buttonsStack.distribution = .fillEqually
        buttonsStack.translatesAutoresizingMaskIntoConstraints = no
        scrollView.addSubview(buttonsStack)
        ActivateConstraint([
            buttonsStack.topAnchor.constraint(equalTo: mapView.bottomAnchor, constant: 15),
            buttonsStack.centerXInSuperview(),
            buttonsStack.widthAnchorWithMultiplier(multiplier: 0.8),
            buttonsStack.heightAnchor.constraint(equalToConstant: 40)
            ])
    }
    
    lazy var acceptGradientLayer: LinearGradientLayer = {
        let gradientLayer = LinearGradientLayer(colors: [#colorLiteral(red: 0.882707119, green: 0.6987941861, blue: 0.09962636977, alpha: 1), #colorLiteral(red: 0.8282236457, green: 0.6515137553, blue: 0.07690628618, alpha: 1)])
        gradientLayer.direction = .bottomLeftToTopRight
        gradientLayer.cornerRadius = 20
        return gradientLayer
    }()
    lazy var acceptButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("قبول الطلب", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = .CairoSemiBold(of: 15)
        btn.layer.cornerRadius = 20
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    lazy var refuseGradientLayer: LinearGradientLayer = {
        let gradientLayer = LinearGradientLayer(colors: [#colorLiteral(red: 0.882707119, green: 0.6987941861, blue: 0.09962636977, alpha: 1), #colorLiteral(red: 0.8282236457, green: 0.6515137553, blue: 0.07690628618, alpha: 1)])
        gradientLayer.direction = .bottomLeftToTopRight
        gradientLayer.cornerRadius = 20
        return gradientLayer
    }()
    lazy var refuseButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("رفض الطلب", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = .CairoSemiBold(of: 15)
        btn.layer.cornerRadius = 20
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    override func layoutSubviews() {
        super.layoutSubviews()
        acceptGradientLayer.frame = acceptButton.bounds
        refuseGradientLayer.frame = refuseButton.bounds
    }
}


class BaseView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupAppearance()
        setupView()
    }; required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    func setupView() {
        
    }
    
    func setupAppearance() {
        backgroundColor = .white
    }
}
