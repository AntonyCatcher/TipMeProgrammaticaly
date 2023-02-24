//
//  UIFont.swift
//  TipMeProgrammaticaly
//
//  Created by Anton  on 23.02.2023.
//

import UIKit

extension UIFont {
    
    static func setupHelvetica(size: CGFloat) -> UIFont {
        UIFont(name: "Helvetica", size: size) ?? UIFont()
    }
}
