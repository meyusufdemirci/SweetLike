//
//  UIViewExtensions.swift
//  SweetLike
//
//  Created by Yusuf Demirci on 29.07.2019.
//

import UIKit

extension UIView {
    
    func bindFrameToViewBounds(toView: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        
        topAnchor.constraint(equalTo: toView.topAnchor, constant: 0).isActive = true
        bottomAnchor.constraint(equalTo: toView.bottomAnchor, constant: 0).isActive = true
        leadingAnchor.constraint(equalTo: toView.leadingAnchor, constant: 0).isActive = true
        trailingAnchor.constraint(equalTo: toView.trailingAnchor, constant: 0).isActive = true
    }
}
