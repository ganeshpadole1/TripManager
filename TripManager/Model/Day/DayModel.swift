//
//  DayModel.swift
//  TripManager
//
//  Created by ganesh padole on 12/04/20.
//  Copyright © 2020 ganesh padole. All rights reserved.
//

import Foundation

struct DayModel {
    var id: String!
    var title = ""
    var subtitle = ""
    var activityModels = [ActivityModels]()
    
    init(title: String, subtitle: String, activityModels: [ActivityModels]?) {
        id = UUID().uuidString
        self.title = title
        self.subtitle = subtitle
        
        if let activityModels = activityModels {
            self.activityModels = activityModels
        }
    }
}
