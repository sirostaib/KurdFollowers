//
//  UIViewController+Ext.swift
//  KurdFollowers
//
//  Created by Siros Taib on 4/21/24.
//

import UIKit

extension UIViewController {
   func presentKFAlertOnMainThread(title: String, message: String, buttonTitle: String){
        DispatchQueue.main.async {
            let alertVC = KFAlertVC(alertTitle: title, bodyText: message, buttonTitle: buttonTitle)
            alertVC.modalPresentationStyle = .overFullScreen
            alertVC.modalTransitionStyle = .crossDissolve
            self.present(alertVC, animated: true)
        }
    }
}
 
