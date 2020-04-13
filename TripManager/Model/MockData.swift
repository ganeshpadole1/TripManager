//
//  MockData.swift
//  TripManager
//
//  Created by ganesh padole on 12/04/20.
//  Copyright © 2020 ganesh padole. All rights reserved.
//

import UIKit

class MockData {
    
    static func createMockTripModelData() -> [TripModel] {
        var mockTrips = [TripModel]()
        mockTrips.append(TripModel(title: "Trip to Bali", image: nil, dayModels: createMockDayModelData()))
        mockTrips.append(TripModel(title: "Trip to Pune"))
        mockTrips.append(TripModel(title: "Mumbai", image: #imageLiteral(resourceName: "ganesh.jpg"), dayModels: nil))
        return mockTrips
    }
    
    static func createMockDayModelData() -> [DayModel] {
        var mockDays = [DayModel]()
     //   mockDays.append(DayModel(title: "April 18", subtitle: "Departure", activityModels: createMockActivityModelData(sectionTitle: "April 18")))
//        mockDays.append(DayModel(title: String, subtitle: <#T##String#>, activityModels: <#T##[ActivityModels]?#>))
//        mockDays.append(DayModel(title: <#T##String#>, subtitle: <#T##String#>, activityModels: <#T##[ActivityModels]?#>))
//        mockDays.append(DayModel(title: <#T##String#>, subtitle: <#T##String#>, activityModels: <#T##[ActivityModels]?#>))
        return mockDays
    }
    
//    func createMockActivityModelData(sectionTitle: String) -> String{
//        
//    }
}
