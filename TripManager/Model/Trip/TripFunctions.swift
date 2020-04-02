//
//  TripFunctions.swift
//  TripManager
//
//  Created by ganesh padole on 02/04/20.
//  Copyright © 2020 ganesh padole. All rights reserved.
//

import Foundation

class TripFunctions {
    
    static func createTrip(tripModel: TripModel) {
        
    }
    
    static func readTrips(completion: @escaping () -> ()) {
        
        DispatchQueue.global(qos: .userInteractive).async {
            if Data.tripModels.count == 0 {
                Data.tripModels.append(TripModel(title: "Trip to Bali!"))
                Data.tripModels.append(TripModel(title: "Mexico"))
                Data.tripModels.append(TripModel(title: "Russian Trip"))
            }
            
            DispatchQueue.main.async {
                completion()
            }
        }
    }
    
    static func updateTrip(tripModel: TripModel) {
        
    }
    
    static func deleteTrip(tripModel: TripModel) {
        
    }
}
