//
//  NewRequestsViewController.swift
//  Naql
//
//  Created by Youssef on 4/8/19.
//  Copyright © 2019 Youssef. All rights reserved.
//

import UIKit

class RequestPriceOfferViewController: UIViewController {
//    private var mainView = RequestPriceOfferView()
    override func loadView() {
//        mainView.showHome = self
//        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBarApperance(title: "طلب جديد", showNotifButton: false)
    }
}

extension RequestPriceOfferViewController: ShowHome {
    func goToHome() {
        navigationController?.popViewController(animated: true)
    }
}
