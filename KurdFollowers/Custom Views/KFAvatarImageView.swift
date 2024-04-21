//
//  KFAvatarImageView.swift
//  KurdFollowers
//
//  Created by Siros Taib on 4/21/24.
//

import UIKit

class KFAvatarImageView: UIImageView {
    
    let placeholderImage = UIImage(named: "avatar-placeholder")

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
     
    private func configure(){
        layer.cornerRadius = 14
        clipsToBounds = true
        image = placeholderImage
        translatesAutoresizingMaskIntoConstraints = false
        
    }
}
