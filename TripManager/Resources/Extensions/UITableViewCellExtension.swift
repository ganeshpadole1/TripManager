//
//  UITableViewCellExtension.swift
//  TripManager
//
//  Created by ganesh padole on 13/04/20.
//  Copyright © 2020 ganesh padole. All rights reserved.
//

import UIKit

extension UITableViewCell {
    ///Return a string representation of class
    class var identifier: String {
        return String(describing: self)
    }
}
