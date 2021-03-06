//
//  SearchViewController.swift
//  Tanta Services
//
//  Created by Youssef on 11/22/18.
//  Copyright © 2018 Youssef. All rights reserved.
//

import UIKit
import MapKit

class HomeViewController: UIViewController, MKMapViewDelegate {
    
    let mapView: MKMapView = {
        let txt = MKMapView()
        txt.translatesAutoresizingMaskIntoConstraints = false
        return txt
    }()

    lazy var locationButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.imageForNormal = #imageLiteral(resourceName: "locationred").withRenderingMode(.alwaysOriginal)
        btn.backgroundColor = .white
        btn.viewBorderWidth = 0.5
        btn.viewBorderColor = UIColor.gray.withAlphaComponent(0.5)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTheTarget(action: {[weak self] in
            self?.goToNewRequestsViewController()
        })
        return btn
    }()
    lazy var gradientLayer: LinearGradientLayer = {
        let gradientLayer = LinearGradientLayer(colors: [#colorLiteral(red: 0.882707119, green: 0.6987941861, blue: 0.09962636977, alpha: 1), #colorLiteral(red: 0.8282236457, green: 0.6515137553, blue: 0.07690628618, alpha: 1)])
        gradientLayer.direction = .bottomLeftToTopRight
        gradientLayer.cornerRadius = 15
        return gradientLayer
    }()
    lazy var gradientLayerRed: LinearGradientLayer = {
        let gradientLayer = LinearGradientLayer(colors: [#colorLiteral(red: 0.8347420096, green: 0.1139526293, blue: 0.1157940701, alpha: 1), #colorLiteral(red: 0.6309103966, green: 0.1291202009, blue: 0.1118160859, alpha: 1)])
        gradientLayer.direction = .bottomLeftToTopRight
        gradientLayer.cornerRadius = 15
        return gradientLayer
    }()
    lazy var newRequestButton: UIButton = {
        let btn = UIButton(type: .system)
        if userType == .driver {
            btn.setTitle("طلب جديد", for: .normal)
        } else if userType == .commercial {
            btn.setTitle("طلب عرض اسعار", for: .normal)
        }
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = .CairoSemiBold(of: 15)
        btn.layer.cornerRadius = 15
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.layer.insertSublayer(gradientLayer, at: 0)
        btn.addTheTarget(action: {[weak self] in
            if userType == .driver {
                self?.goToNewRequestsViewController()
            } else if userType == .commercial {
                self?.goToRequestPriceOfferViewController()
            }
        })
        return btn
    }()
    lazy var newRequestRedButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("طلب جديد", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = .CairoSemiBold(of: 15)
        btn.layer.cornerRadius = 15
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.layer.insertSublayer(gradientLayerRed, at: 0)
        btn.addTheTarget(action: {[weak self] in
            if userType == .driver {
                self?.goToNewRequestsViewController()
            } else if userType == .commercial {
                self?.goToRequestPriceOfferViewController()
            }
        })
        return btn
    }()
    var long = 0.00
    var lat = 0.00
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        view.backgroundColor = .white
        setStatusBarBackgroundColor(colors: [#colorLiteral(red: 0.6906743646, green: 0.05539446324, blue: 0.05300607532, alpha: 1), #colorLiteral(red: 0.5739542246, green: 0.1024537459, blue: 0.06843120605, alpha: 1)])
        setupLayout()
        addAnnotation()
        setupSideMenu()
        setupNavBarApperance(title: "الرئيسية", showNotifButton: true)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        gradientLayer.frame = newRequestButton.bounds
        gradientLayerRed.frame = newRequestRedButton.bounds
    }
    
    fileprivate func setupLayout() {
        view.addSubview(mapView)
        mapView.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor, padding: .zero)
        
        if userType == .driver {
            view.addSubview(newRequestButton)
            view.ActivateConstraint([
                newRequestButton.heightAnchor.constraint(equalToConstant: 40),
                newRequestButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                newRequestButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
                newRequestButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9)
                ])
        } else if userType == .commercial {
            view.addSubview(newRequestButton)
            view.addSubview(newRequestRedButton)
            view.ActivateConstraint([
                newRequestButton.heightAnchor.constraint(equalToConstant: 40),
                newRequestButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                newRequestButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
                newRequestButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.4),
                newRequestRedButton.heightAnchor.constraint(equalToConstant: 40),
                newRequestRedButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                newRequestRedButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
                newRequestRedButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.4),
                ])
        }
        
        view.addSubview(locationButton)
        view.ActivateConstraint([
            locationButton.widthAnchor.constraint(equalToConstant: 30),
            locationButton.heightAnchor.constraint(equalToConstant: 40),
            locationButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            locationButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10)
            ])
    }
    
    private func goToNewRequestsViewController() {
        navigationController?.pushViewController(NewRequestsViewController(), animated: true)
    }
    
    private func goToRequestPriceOfferViewController() {
        navigationController?.pushViewController(RequestPriceOfferViewController(), animated: true)
    }
    
    fileprivate func addAnnotation() {
        let annotation = MKPointAnnotation()
        annotation.title = "Point"
        annotation.coordinate = CLLocationCoordinate2D(latitude: lat, longitude: long)
        mapView.addAnnotation(annotation)
        
        //        let locationManager = CLLocationManager()
        //        locationManager.delegate = self
        //        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        //Zoom to user location
        let viewRegion = MKCoordinateRegion.init(center: annotation.coordinate, latitudinalMeters: 200, longitudinalMeters: 200)
        mapView.setRegion(viewRegion, animated: true)
        //
        //        // we can make navigate to the location
        
    }
    
    // here from add company
    fileprivate func zoomToUserLocation() {
        //        let locationManager = CLLocationManager()
        //        locationManager.delegate = self
        //        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        //
        //        //Zoom to user location
        //        if let userLocation = locationManager.location?.coordinate {
        //            let viewRegion = MKCoordinateRegionMakeWithDistance(userLocation, 200, 200)
        //            mapView.setRegion(viewRegion, animated: false)
        //        }
        //
        //        self.locationManager = locationManager
        //
        //        DispatchQueue.main.async {
        //            self.locationManager.startUpdatingLocation()
        //        }
    }
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let view = MKAnnotationView()
        view.image = #imageLiteral(resourceName: "locationred")
        view.isDraggable = false
        return view
    }
}
