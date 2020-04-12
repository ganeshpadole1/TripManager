//
//  TripModel.swift
//  TripManager
//
//  Created by ganesh padole on 02/04/20.
//  Copyright © 2020 ganesh padole. All rights reserved.
//

import UIKit

struct TripModel {
    let id: UUID
    var title: String
    var image: UIImage?
    var dayModels = [DayModel]()
    init(title: String, image: UIImage? = nil,dayModels: [DayModel]? = nil) {
        id = UUID()
        self.title = title
        self.image = image
        
        if let dayModels = dayModels {
            self.dayModels = dayModels
        }
        
    }
}
