//
//  AppUIButton.swift
//  TripManager
//
//  Created by ganesh padole on 05/04/20.
//  Copyright © 2020 ganesh padole. All rights reserved.
//

import UIKit

class AppUIButton: UIButton {

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        backgroundColor = Theme.tint
        layer.cornerRadius = frame.height / 2
        setTitleColor(UIColor.white, for: .normal)
    }

}
