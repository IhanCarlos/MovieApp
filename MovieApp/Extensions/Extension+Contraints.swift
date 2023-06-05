//
//  File.swift
//  MovieApp
//
//  Created by ihan carlos on 04/06/23.
//

import UIKit

extension UIView {
    func pin(to superView: UIView){
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: superView.topAnchor).isActive = true
        leadingAnchor.constraint(equalTo: superView.leadingAnchor).isActive = true
        bottomAnchor.constraint(equalTo: superView.bottomAnchor).isActive = true
        trailingAnchor.constraint(equalTo: superView.trailingAnchor).isActive = true
    }
    
    func cardImageConstraints(image: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: image.topAnchor, constant: 10).isActive = true
        leadingAnchor.constraint(equalTo: image.leadingAnchor, constant: 5).isActive = true
        trailingAnchor.constraint(equalTo: image.trailingAnchor, constant: -5).isActive = true
        bottomAnchor.constraint(equalTo: image.bottomAnchor, constant: -10).isActive = true
    }
}
