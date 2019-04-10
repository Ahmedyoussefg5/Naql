//
//  MyRequestsViewController.swift
//  Naql
//
//  Created by Youssef on 4/9/19.
//  Copyright © 2019 Youssef. All rights reserved.
//

import UIKit

class MyRequestsView: UIView {
    
    enum SelectedButton: Int {
        case inProgressButton = 1
        case blockedButton = 2
        case finishedButton = 3
    }
    
    var selectedButton: SelectedButton = .inProgressButton {
        didSet {
            mainTableView.reloadData()
        }
    }
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.applySketchShadow(color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.19), alpha: 1, x: 0, y: 3, blur: 2, spread: 0)
        return view
    }()
    private lazy var selectionView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.viewCornerRadius = 5
        view.layer.applySketchShadow(color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.19), alpha: 1, x: 0, y: 3, blur: 2, spread: 0)
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var inProgressButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("قيد التوصيل", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = .CairoSemiBold(of: 15)
        btn.layer.cornerRadius = 15
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTheTarget(action: {[weak self] in
            self?.selectedButton = .inProgressButton
            self?.handleButtonsClick(sender: btn)
        })
        return btn
    }()
    private lazy var blockedButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("عليها اعتراض", for: .normal)
        btn.setTitleColor(UIColor.white.withAlphaComponent(0.5), for: .normal)
        btn.titleLabel?.font = .CairoSemiBold(of: 15)
        btn.layer.cornerRadius = 15
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTheTarget(action: {[weak self] in
            self?.selectedButton = .blockedButton
            self?.handleButtonsClick(sender: btn)
        })
        return btn
    }()
    private lazy var finishedButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("منتهية", for: .normal)
        btn.setTitleColor(UIColor.white.withAlphaComponent(0.5), for: .normal)
        btn.titleLabel?.font = .CairoSemiBold(of: 15)
        btn.layer.cornerRadius = 15
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTheTarget(action: {[weak self] in
            self?.selectedButton = .finishedButton
            self?.handleButtonsClick(sender: btn)
        })
        return btn
    }()
    
    private func handleButtonsClick(sender: UIButton) {
        var buttons = [inProgressButton, blockedButton, finishedButton]
        buttons.removeAll {
            $0 == sender
        }
        sender.setTitleColor(.white, for: .normal)
        buttons.forEach {
            $0.setTitleColor(UIColor.white.withAlphaComponent(0.5), for: .normal)
        }
        
        UIView.animate(withDuration: 0.7) {[weak self] in
            guard let self = self else { return }
            self.selectionView.removeFromSuperview()
            self.containerView.addSubview(self.selectionView)
            self.ActivateConstraint([
                self.selectionView.widthAnchor.constraint(equalToConstant: 25),
                self.selectionView.heightAnchor.constraint(equalToConstant: 10),
                self.selectionView.topAnchor.constraint(equalTo: self.containerView.bottomAnchor, constant: -5),
                self.selectionView.centerXAnchor.constraint(equalTo: sender.centerXAnchor)
                ])
        }
    }
    
    lazy var mainTableView: UITableView = {
        let tableV = UITableView()
        tableV.isTransperant()
        tableV.separatorColor = .clear
        tableV.register(MyRequestsCell.self, forCellReuseIdentifier: "MyRequestsCell")
        return tableV
    }()
    private lazy var gradientLayer: LinearGradientLayer = {
        let gradientLayer = LinearGradientLayer(colors: [#colorLiteral(red: 0.6906743646, green: 0.05539446324, blue: 0.05300607532, alpha: 1), #colorLiteral(red: 0.5739542246, green: 0.1024537459, blue: 0.06843120605, alpha: 1)])
        gradientLayer.direction = .bottomLeftToTopRight
        return gradientLayer
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupView()
        containerView.layer.insertSublayer(gradientLayer, at: 0)
    }; required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = containerView.bounds
    }
    
    private var selectionViewXconstrain: NSLayoutConstraint!
    
    private func setupView() {
        addSubview(containerView)
        ActivateConstraint([
            containerView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            containerView.widthAnchor.constraint(equalTo: widthAnchor),
            containerView.heightAnchor.constraint(equalToConstant: 50),
            containerView.centerXAnchor.constraint(equalTo: centerXAnchor)
            ])
        let containerStack = UIStackView(arrangedSubviews: [finishedButton, blockedButton, inProgressButton])
        containerStack.axis = .horizontal
        containerStack.distribution = .fillEqually
        containerView.addSubview(containerStack)
        containerStack.fillSuperview()
        
        addSubview(mainTableView)
        ActivateConstraint([
            mainTableView.topAnchor.constraint(equalTo: containerView.bottomAnchor),
            mainTableView.widthAnchor.constraint(equalTo: widthAnchor),
            mainTableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            mainTableView.centerXAnchor.constraint(equalTo: centerXAnchor)
            ])
        
        containerView.addSubview(selectionView)
        ActivateConstraint([
            selectionView.widthAnchor.constraint(equalToConstant: 25),
            selectionView.heightAnchor.constraint(equalToConstant: 10),
            selectionView.topAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -5),
            selectionView.centerXAnchor.constraint(equalTo: inProgressButton.centerXAnchor)
            ])
    }
}

class MyRequestsCell: UITableViewCell {
    
    private lazy var container: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.viewCornerRadius = 8
        view.layer.applySketchShadow(color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.19), alpha: 1, x: 0, y: 3, blur: 2, spread: 0)
        view.viewBorderWidth = 0.5
        view.viewBorderColor = #colorLiteral(red: 0.8234420419, green: 0.8235812187, blue: 0.8234224319, alpha: 1)
        view.backgroundColor = .white
        return view
    }()
    
    lazy var orderNumberLable = MyRequestsCellLable(title: "طلب رقم", color: #colorLiteral(red: 0.9579748511, green: 0.6032417417, blue: 0.1833830774, alpha: 1), fontSize: 13)
    lazy var dateLable = MyRequestsCellLable(title: "12/12/12", color: #colorLiteral(red: 0.6774116158, green: 0.6668222547, blue: 0.6664904952, alpha: 1), fontSize: 14)
    lazy var splitView = StackSpliter()
    lazy var userNameLable = MyRequestsCellLableWithImage(title: "محمد", color: #colorLiteral(red: 0.9771355987, green: 0.6151583195, blue: 0.1842674017, alpha: 1), fontSize: 12, image: #imageLiteral(resourceName: "mswq"))
    lazy var priceLable = MyRequestsCellLableWithImageRight(title: "٢٣ ريال", color: #colorLiteral(red: 0.9771355987, green: 0.6151583195, blue: 0.1842674017, alpha: 1), fontSize: 12, image: #imageLiteral(resourceName: "money"))
    lazy var splitVieww = StackSpliter()
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
        container.addSubview(dateLable)
        container.addSubview(orderNumberLable)
        container.addSubview(splitView)
        
        splitView.backgroundColor = #colorLiteral(red: 0.8234420419, green: 0.8235812187, blue: 0.8234224319, alpha: 1)
        splitView.translatesAutoresizingMaskIntoConstraints = false
        splitVieww.backgroundColor = #colorLiteral(red: 0.8234420419, green: 0.8235812187, blue: 0.8234224319, alpha: 1)
        splitVieww.translatesAutoresizingMaskIntoConstraints = false
        
        container.ActivateConstraint([
            dateLable.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 5),
            dateLable.topAnchor.constraint(equalTo: container.topAnchor, constant: 5),
            
            orderNumberLable.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -5),
            orderNumberLable.centerYAnchor.constraint(equalTo: dateLable.centerYAnchor),
            
            splitView.widthAnchor.constraint(equalTo: container.widthAnchor),
            splitView.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            splitView.topAnchor.constraint(equalTo: orderNumberLable.bottomAnchor)
            ])
        
        container.addSubview(userNameLable)
        container.addSubview(priceLable)
        container.addSubview(splitVieww)
        container.ActivateConstraint([
            userNameLable.topAnchor.constraint(equalTo: splitView.bottomAnchor, constant: 5),
            userNameLable.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -5),
            
            priceLable.centerYAnchor.constraint(equalTo: userNameLable.centerYAnchor),
            priceLable.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 5),
            
            splitVieww.widthAnchor.constraint(equalTo: container.widthAnchor),
            splitVieww.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            splitVieww.topAnchor.constraint(equalTo: priceLable.bottomAnchor)
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
        
        container.addSubview(firstDot)
        container.addSubview(secoundDot)
        container.addSubview(horeiLine)
        container.ActivateConstraint([
            firstDot.widthAnchor.constraint(equalToConstant: dotWidth),
            firstDot.heightAnchor.constraint(equalToConstant: dotWidth),
            secoundDot.widthAnchor.constraint(equalToConstant: dotWidth),
            secoundDot.heightAnchor.constraint(equalToConstant: dotWidth),
            horeiLine.widthAnchor.constraint(equalToConstant: 1.6),
            horeiLine.heightAnchor.constraint(equalToConstant: 22)
            ])
        
        container.ActivateConstraint([
            firstDot.topAnchor.constraint(equalTo: splitVieww.bottomAnchor, constant: 5),
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

class MyRequestsCellLable: UILabel {
    init(title: String, color: UIColor, fontSize: Int) {
        super.init(frame: .zero)
        textColor = color
        font = .CairoRegular(of: CGFloat(fontSize))
        textAlignment = .right
        text = title
        translatesAutoresizingMaskIntoConstraints = false
    }; required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
}

class MyRequestsCellLableWithImage: UIImageView {
    let lable = UILabel()
    
    init(title: String, color: UIColor, fontSize: Int, image: UIImage) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        self.image = image
        lable.textColor = color
        lable.font = .CairoRegular(of: CGFloat(fontSize))
        lable.textAlignment = .right
        lable.text = title
        lable.translatesAutoresizingMaskIntoConstraints = false
        addSubview(lable)
        NSLayoutConstraint.activate([
            lable.trailingAnchor.constraint(equalTo: leadingAnchor, constant: -5),
            lable.centerYAnchor.constraint(equalTo: centerYAnchor)
            ])
    }; required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    func setLableText(text: String) {
        lable.text = text
    }
}

class MyRequestsCellLableWithImageRight: UILabel {
    init(title: String, color: UIColor, fontSize: Int, image: UIImage) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        textColor = color
        font = .CairoRegular(of: CGFloat(fontSize))
        textAlignment = .right
        text = title
        
        let imgView = UIImageView(image: image)
        imgView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(imgView)
        NSLayoutConstraint.activate([
            imgView.leadingAnchor.constraint(equalTo: trailingAnchor, constant: 5),
            imgView.centerYAnchor.constraint(equalTo: centerYAnchor)
            ])
    }; required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
}

class StackSpliter: UIView {
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 0, height: 1)
    }
}
