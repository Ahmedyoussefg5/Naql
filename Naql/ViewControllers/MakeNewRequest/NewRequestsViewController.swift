//
//  NewRequestsViewController.swift
//  Naql
//
//  Created by Youssef on 4/8/19.
//  Copyright © 2019 Youssef. All rights reserved.
//

import UIKit

class NewRequestsViewController: UIViewController {
    private var mainView = NewRequestView()
    override func loadView() {
        mainView.showHome = self
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBarApperance(title: "طلب جديد", showNotifButton: false)
    }
}

extension NewRequestsViewController: ShowHome {
    func goToHome() {
        navigationController?.popViewController(animated: true)
    }
}
