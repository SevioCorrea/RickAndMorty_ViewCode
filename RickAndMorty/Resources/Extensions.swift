//
//  Extensions.swift
//  RickAndMorty
//
//  Created by Sévio Basilio Corrêa on 06/01/23.
//

import UIKit



extension UIView {
    func addSubviews(_ views: UIView...) {
        
        views.forEach({
            addSubview($0)
        })
    }
}
