//
//  PopupUIView.swift
//  TripManager
//
//  Created by ganesh padole on 05/04/20.
//  Copyright © 2020 ganesh padole. All rights reserved.
//

import UIKit

class PopupUIView: UIView {
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        layer.shadowOpacity = 1
        layer.cornerRadius = 10
        layer.shadowOffset = CGSize.zero
        layer.shadowColor = UIColor.darkGray.cgColor
        backgroundColor = Theme.backgroundColor
    }
}
