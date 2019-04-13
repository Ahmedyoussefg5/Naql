//
//  MyRequestsTableCell.swift
//  Naql
//
//  Created by Youssef on 4/10/19.
//  Copyright © 2019 Youssef. All rights reserved.
//

import UIKit

class MyOffersCell: UITableViewCell {
    
    private lazy var container: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.viewCornerRadius = 8
        view.layer.applySketchShadow(color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.19), alpha: 1, x: 0, y: 3, blur: 2, spread: 0)
        view.viewBorderWidth = 0.5
        view.viewBorderColor = #colorLiteral(red: 0.8234420419, green: 0.8235812187, blue: 0.8234224319, alpha: 1)
        view.backgroundColor = #colorLiteral(red: 0.8234420419, green: 0.8235812187, blue: 0.8234224319, alpha: 1)
        return view
    }()
    private lazy var topContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.viewBorderWidth = 0.5
        view.viewBorderColor = #colorLiteral(red: 0.8234420419, green: 0.8235812187, blue: 0.8234224319, alpha: 1)
        view.backgroundColor = .white
        return view
    }()
    private lazy var bottomContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.viewBorderWidth = 0.5
        view.viewBorderColor = #colorLiteral(red: 0.8234420419, green: 0.8235812187, blue: 0.8234224319, alpha: 1)
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var acceptImageView: CellButton = {
        let img = CellButton(type: .system)
        img.setBackgroundImage(#imageLiteral(resourceName: "button_right"), for: .normal)
        img.imageView?.contentMode = .center
        return img
    }()
    private lazy var refuseImageView: CellButton = {
        let img = CellButton(type: .system)
        img.setBackgroundImage(#imageLiteral(resourceName: "cancel"), for: .normal)
        img.imageView?.contentMode = .center
        return img
    }()
    
    lazy var carTypeLable = MyRequestsCellLableWithImageRight(title: "تيوتا", color: #colorLiteral(red: 0.9771355987, green: 0.6151583195, blue: 0.1842674017, alpha: 1), fontSize: 12, image: #imageLiteral(resourceName: "truck"))
    lazy var priceLable = MyRequestsCellLableWithImageRight(title: "٢١٢١ رس", color: #colorLiteral(red: 0.9771355987, green: 0.6151583195, blue: 0.1842674017, alpha: 1), fontSize: 12, image: #imageLiteral(resourceName: "money"))
    
    private lazy var reqNumLable: UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0.9771355987, green: 0.6151583195, blue: 0.1842674017, alpha: 1)
        label.textAlignment = .right
        label.text = "طلب رقم ٣٢٤٢٢"
        label.font = .CairoSemiBold(of: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private lazy var nameLable: UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0.9771355987, green: 0.6151583195, blue: 0.1842674017, alpha: 1)
        label.textAlignment = .right
        label.text = "محمد محمد"
        label.font = .CairoSemiBold(of: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private lazy var addressLable: UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0.9771355987, green: 0.6151583195, blue: 0.1842674017, alpha: 1)
        label.textAlignment = .right
        label.text = "الرياض"
        label.font = .CairoSemiBold(of: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var userImage: UIImageView = {
        let img = UIImageView()
        img.clipsToBounds = true
        img.contentMode = .scaleToFill
        img.image = #imageLiteral(resourceName: "driver")
        img.viewCornerRadius = 25
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    lazy var addressOne: UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 2
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    lazy var addressTwo: UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 2
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .white
        selectionStyle = .none
        setupView()
    }; required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    private func setupView() {
        contentView.addSubview(container)
        container.fillSuperview(padding: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
        
        container.addSubview(topContainer)
        ActivateConstraint([
            topContainer.widthAnchorWithMultiplier(multiplier: 1),
            topContainer.heightAnchorWithMultiplier(multiplier: 0.495),
            topContainer.topAnchorSuperView(constant: 0),
            topContainer.centerXInSuperview()
            ])
        
        container.addSubview(bottomContainer)
        ActivateConstraint([
            bottomContainer.widthAnchorWithMultiplier(multiplier: 1),
            bottomContainer.heightAnchorWithMultiplier(multiplier: 0.495),
            bottomContainer.bottomAnchorSuperView(constant: 0),
            bottomContainer.centerXInSuperview()
            ])
        
        topContainer.addSubview(acceptImageView)
        ActivateConstraint([
            acceptImageView.centerYInSuperview(),
            acceptImageView.widthAnchorConstant(constant: 30),
            acceptImageView.heightAnchorConstant(constant: 30),
            acceptImageView.leadingAnchorSuperView(constant: 10)
            ])
        
        let lineView = stackSpliterGray()
        topContainer.addSubview(lineView)
        ActivateConstraint([
            lineView.heightAnchorWithMultiplier(multiplier: 1),
            lineView.leadingAnchor.constraint(equalTo: acceptImageView.trailingAnchor, constant: 5),
            lineView.widthAnchorConstant(constant: 1),
            lineView.centerYInSuperview(),
            ])
        
        topContainer.addSubview(userImage)
        ActivateConstraint([
            userImage.centerYInSuperview(),
            userImage.trailingAnchorAnchorSuperView(constant: -5),
            userImage.widthAnchorConstant(constant: 50),
            userImage.heightAnchorConstant(constant: 50)
            ])
        
        
        let lablesStack = UIStackView(arrangedSubviews: [carTypeLable, priceLable])
        lablesStack.axis = v
        lablesStack.distribution = .fillEqually
        topContainer.addSubview(lablesStack)
        ActivateConstraint([
            lablesStack.topAnchorSuperView(constant: 5),
            lablesStack.bottomAnchorSuperView(constant: -5),
            lablesStack.leadingAnchor.constraint(equalTo: lineView.trailingAnchor, constant: 5),
            ])
        let infoLablesStack = UIStackView(arrangedSubviews: [reqNumLable, nameLable, addressLable])
        infoLablesStack.axis = v
        infoLablesStack.distribution = .fillEqually
        topContainer.addSubview(infoLablesStack)
        ActivateConstraint([
            infoLablesStack.topAnchorSuperView(constant: 5),
            infoLablesStack.bottomAnchorSuperView(constant: -5),
            infoLablesStack.trailingAnchor.constraint(equalTo: userImage.leadingAnchor, constant: -5),
            ])
        
        
        bottomContainer.addSubview(refuseImageView)
        ActivateConstraint([
            refuseImageView.centerYInSuperview(),
            refuseImageView.widthAnchorConstant(constant: 30),
            refuseImageView.heightAnchorConstant(constant: 30),
            refuseImageView.leadingAnchorSuperView(constant: 10)
            ])
        
        let lineVieww = stackSpliterGray()
        bottomContainer.addSubview(lineVieww)
        ActivateConstraint([
            lineVieww.heightAnchorWithMultiplier(multiplier: 1),
            lineVieww.leadingAnchor.constraint(equalTo: refuseImageView.trailingAnchor, constant: 5),
            lineVieww.widthAnchorConstant(constant: 1),
            lineVieww.centerYInSuperview(),
            ])
        
        let dotWidth: CGFloat = 20.00
        
        let firstDot = UIView()
        firstDot.backgroundColor = #colorLiteral(red: 0.6454728246, green: 0.07720529288, blue: 0.05508542806, alpha: 1)
        firstDot.translatesAutoresizingMaskIntoConstraints = false
        firstDot.viewCornerRadius = dotWidth / 2
        let secoundDot = UIView()
        secoundDot.backgroundColor = #colorLiteral(red: 0.9771355987, green: 0.6151583195, blue: 0.1842674017, alpha: 1)
        secoundDot.translatesAutoresizingMaskIntoConstraints = false
        secoundDot.viewCornerRadius = dotWidth / 2
        let horeiLine = UIView()
        horeiLine.backgroundColor = #colorLiteral(red: 0.827363193, green: 0.8275030255, blue: 0.8273435235, alpha: 1)
        horeiLine.translatesAutoresizingMaskIntoConstraints = false
        
        bottomContainer.addSubview(firstDot)
        bottomContainer.addSubview(secoundDot)
        bottomContainer.addSubview(horeiLine)
        bottomContainer.ActivateConstraint([
            firstDot.widthAnchor.constraint(equalToConstant: dotWidth),
            firstDot.heightAnchor.constraint(equalToConstant: dotWidth),
            secoundDot.widthAnchor.constraint(equalToConstant: dotWidth),
            secoundDot.heightAnchor.constraint(equalToConstant: dotWidth),
            horeiLine.widthAnchor.constraint(equalToConstant: 1.6),
            horeiLine.heightAnchor.constraint(equalToConstant: 22)
            ])
        
        bottomContainer.ActivateConstraint([
            firstDot.topAnchor.constraint(equalTo: bottomContainer.topAnchor, constant: 5),
            firstDot.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -5),
            
            horeiLine.topAnchor.constraint(equalTo: firstDot.bottomAnchor),
            horeiLine.centerXAnchor.constraint(equalTo: firstDot.centerXAnchor),
            
            secoundDot.topAnchor.constraint(equalTo: horeiLine.bottomAnchor),
            secoundDot.centerXAnchor.constraint(equalTo: firstDot.centerXAnchor)
            ])
        
        container.addSubview(addressOne)
        container.addSubview(addressTwo)
        container.ActivateConstraint([
            addressOne.trailingAnchor.constraint(equalTo: firstDot.leadingAnchor, constant: -5),
            addressOne.topAnchor.constraint(equalTo: firstDot.topAnchor),
            
            addressTwo.trailingAnchor.constraint(equalTo: secoundDot.leadingAnchor, constant: -5),
            addressTwo.topAnchor.constraint(equalTo: secoundDot.topAnchor),
            ])
        
        addressOne.attributedText = NSMutableAttributedString(texts: ["منتزه السلام", "\nمنتزه السلام"], fonts: [.CairoSemiBold(of: 12), .CairoRegular(of: 10)], colors: [#colorLiteral(red: 0.6454728246, green: 0.07720529288, blue: 0.05508542806, alpha: 1), #colorLiteral(red: 0.8234420419, green: 0.8235812187, blue: 0.8234224319, alpha: 1)], [.right, .right])
        addressTwo.attributedText = NSMutableAttributedString(texts: ["منتزه السلام", "\nمنتزه السلام"], fonts: [.CairoSemiBold(of: 12), .CairoRegular(of: 10)], colors: [#colorLiteral(red: 0.9771355987, green: 0.6151583195, blue: 0.1842674017, alpha: 1), #colorLiteral(red: 0.8234420419, green: 0.8235812187, blue: 0.8234224319, alpha: 1)], [.right, .right])
    }
}

class CellButton: UIButton {
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 20, height: 20)
    }
}
