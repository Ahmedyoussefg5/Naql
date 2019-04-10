//
//  RequestDetailsViewController.swift
//  Naql
//
//  Created by Youssef on 4/10/19.
//  Copyright © 2019 Youssef. All rights reserved.
//

import UIKit

class RequestDetailsViewController: BaseUIViewController<RequestDetailsView> {

    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.acceptButton.addTheTarget {[weak self] in
            self?.navigationController?.popToRootViewController(animated: true)
        }
        mainView.refuseButton.addTheTarget {[weak self] in
            self?.navigationController?.pushViewController(RefuseMessageViewController(), animated: true)
        }
    }
    


}

class BaseUIViewController<T: UIView>: UIViewController {
    var mainView = T()
    override func loadView() {
        view = mainView
    }
}
