
//
//  SearchVC.swift
//  KurdFollowers
//
//  Created by Siros Taib on 4/21/24.
//

import UIKit

class SearchVC: UIViewController {
    
    let logoImageView = UIImageView()
    let usernameTextField = KFTextField()
    let callToActionButton = KFButton(bgColor: .systemCyan, title: "Search Now")
    
    var isUserNameEntered: Bool {
        return !usernameTextField.text!.isEmpty
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor =  .systemBackground
        configureLogoImageView()
        configureTextField()
        configureCallToButton()
        createKeyboardDismissTapGesture()
    }
    
    override func  viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true) 
    }
    
    private func createKeyboardDismissTapGesture(){
        let tap = UITapGestureRecognizer(target:  self.view , action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
    
    @objc private func pushFollowerListVC(){
        guard isUserNameEntered else { 
            presentKFAlertOnMainThread(title:  "Username is Empty!", message: "Please provide a username 🧐", buttonTitle: "Good")
            return
        }
        let followerListVC = FollowerListVC()
        followerListVC.username = usernameTextField.text
        followerListVC.title = usernameTextField.text
        navigationController?.pushViewController(followerListVC, animated: true)
    }
    
    private func configureLogoImageView(){
        view.addSubview(logoImageView)
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.image = UIImage(named: "kf-logo")
        logoImageView.layer.cornerRadius = 25
        logoImageView.layer.masksToBounds = true

        NSLayoutConstraint.activate([
            logoImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -180),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.heightAnchor.constraint(equalToConstant: 250),
            logoImageView.widthAnchor.constraint(equalToConstant: 250)
        ])
    }
    
    private func configureTextField(){
        view.addSubview(usernameTextField)
        usernameTextField.delegate = self
        NSLayoutConstraint.activate([
            usernameTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 50),
            usernameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            usernameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            usernameTextField.heightAnchor.constraint(equalToConstant: 55)
        ])
    }
    
    private func configureCallToButton(){
        view.addSubview(callToActionButton)
        callToActionButton.addTarget(self, action: #selector(pushFollowerListVC), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            callToActionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            callToActionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            callToActionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            callToActionButton.heightAnchor.constraint(equalToConstant: 55)
        ])
    }

}

extension SearchVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        pushFollowerListVC()
        return true
    }
}
