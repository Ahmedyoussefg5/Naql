//
//  Constants.swift
//  Naql
//
//  Created by Youssef on 4/9/19.
//  Copyright © 2019 Youssef. All rights reserved.
//

import UIKit

func getRootViewController() -> HomeViewController {
    let rootNav = UIApplication.shared.keyWindow?.rootViewController as! UINavigationController
    return rootNav.viewControllers.first as! HomeViewController
}
