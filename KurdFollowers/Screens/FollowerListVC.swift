
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
        
        NetworkManager.shared.getFollowers(for: username, page: 1) { result in
            
            switch result {
            case .success(let followers):
                print(followers )
                print("Followers Count: \(followers.count )")
                
            case .failure(let error):
                self.presentKFAlertOnMainThread(title: "Bad Stuff Happened!", message: error.rawValue, buttonTitle: "OK")
            }
            
           
            
            
        }
  
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true) 
    }

}
