//
//  UIViewExtensions.swift
//  TripManager
//
//  Created by ganesh padole on 04/04/20.
//  Copyright © 2020 ganesh padole. All rights reserved.
//

import UIKit

extension UIView {
    
    func addRoundedCornerAndRadius() {
        layer.shadowOpacity = 1
        layer.cornerRadius = 10
        layer.shadowOffset = CGSize.zero
        layer.shadowColor = UIColor.darkGray.cgColor
    }
}
