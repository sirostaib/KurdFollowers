
//
//  FollowerListVCViewController.swift
//  KurdFollowers
//
//  Created by Siros Taib on 4/21/24.
//

import UIKit

class FollowerListVC: UIViewController {
    
    var username: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        
        NetworkManager.shared.getFollowers(for: username, page: 1) { follwers, errorMessage in
            guard let followers = follwers else {
                print("hereeeee")
                print(errorMessage)
                self.presentKFAlertOnMainThread(title: "Bad Stuff Happened!", message: errorMessage?.rawValue ?? "Something went wrong!", buttonTitle: "OK")
                return
            }
            
            print("Followers Count: \(followers.count )")
            print(follwers )
        }
  
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true) 
    }

}
