//
//  RefuseMessageViewController.swift
//  Naql
//
//  Created by Youssef on 4/10/19.
//  Copyright © 2019 Youssef. All rights reserved.
//

import UIKit
import Photos

class PaymentProveViewController: UIViewController {
    
    var mainView = PaymentProveView()
    override func loadView() {
        view = mainView
    }
    
    
    private var pickerUserImage: UIImage? {
        didSet {
            mainView.userPictureImageView.setBackgroundImage(pickerUserImage, for: .normal)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBarApperance(title: "اثبات الدفع", showNotifButton: no)
        mainView.userPictureImageView.addTheTarget {[weak self] in
            self?.pickUserImage()
        }
    }
}

extension PaymentProveViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func pickUserImage() {
        let photoAuthorizationStatus = PHPhotoLibrary.authorizationStatus()
        
        switch photoAuthorizationStatus {
        case .authorized:
            let picker = UIImagePickerController()
            picker.delegate = self
            picker.sourceType = .photoLibrary
            picker.allowsEditing = true
            present(picker, animated: true, completion: nil)
        case .notDetermined: PHPhotoLibrary.requestAuthorization ({
            (newStatus) in
            print("status is \(newStatus)")
            if newStatus == PHAuthorizationStatus.authorized {
                //                let picker = UIImagePickerController()
                //                picker.sourceType = .photoLibrary
                //                picker.delegate = self
                //                picker.allowsEditing = true
                //                self.present(picker, animated: true, completion: nil)
            }
        })
        case .restricted: print("User do not have access to photo album.")
        case .denied: print("User has denied the permission.")
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        
        if let editedImage = info[.editedImage] {
            self.pickerUserImage = editedImage as? UIImage
        } else if let originalImage = info[.originalImage] {
            self.pickerUserImage = originalImage as? UIImage
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.delegate = nil
        picker.dismiss(animated: true, completion: nil)
    }
}
