//
//  StringExtension.swift
//  Motor Sports
//
//  Created by Youssef on 1/31/17.
//  Copyright © 2017 Youssef. All rights reserved.
//

import UIKit
//import MOLH

extension UITableView {
    func isTransperant() {
        backgroundColor = .clear
        isOpaque = false
        backgroundView = nil
        tableFooterView = UIView()
        separatorColor = .clear
        translatesAutoresizingMaskIntoConstraints = false
    }
}

class ArabicCollectionFlow: UICollectionViewFlowLayout {
    override var flipsHorizontallyInOppositeLayoutDirection: Bool {
        return AppMainLang.isRTLLanguage()
    }
}
