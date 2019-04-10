//
//  MyRequestsViewController.swift
//  Naql
//
//  Created by Youssef on 4/9/19.
//  Copyright © 2019 Youssef. All rights reserved.
//

import UIKit

class MyRequestsViewController: UIViewController {
    
    private var mainView = MyRequestsView()
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBarApperance(title: "طلباتي", showNotifButton: false)
        mainView.mainTableView.delegate = self
        mainView.mainTableView.dataSource = self
    }
}

extension MyRequestsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if mainView.selectedButton == .inProgressButton {
            return 3
        } else if mainView.selectedButton == .blockedButton {
            return 2
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyRequestsCell", for: indexPath) as! MyRequestsCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 170
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigationController?.pushViewController(RequestDetailsViewController(), animated: true)
    }
    
}
