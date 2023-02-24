//
//  UIView.swift
//  TipMeProgrammaticaly
//
//  Created by Anton  on 23.02.2023.
//

import UIKit

extension UIView {
    
    func setupView(_ view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        
    }
    
    func addSubviews(_ views: UIView...) {
        views.forEach {
            addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
}
