//
//  KFTextField.swift
//  KurdFollowers
//
//  Created by Siros Taib on 4/21/24.
//

import UIKit

class KFTextField: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(){
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 15
        layer.borderWidth = 2
        layer.borderColor = UIColor.systemGray5.cgColor
        
        textColor = .label
        tintColor = .label
        textAlignment = .center
        font = UIFont.preferredFont(forTextStyle: .title2)
        adjustsFontSizeToFitWidth = true
        minimumFontSize = 10
        
        backgroundColor = .tertiarySystemBackground
        autocorrectionType = .no
        keyboardType = .default
        returnKeyType = .go
        placeholder = "Enter username"
        
    }

}
