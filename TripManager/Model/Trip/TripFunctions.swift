//
//  TripFunctions.swift
//  TripManager
//
//  Created by ganesh padole on 02/04/20.
//  Copyright © 2020 ganesh padole. All rights reserved.
//

import UIKit

class TripFunctions {
    
    static func createTrip(tripModel: TripModel) {
        Data.tripModels.append(tripModel)
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
    
    static func updateTrip(index: Int, title: String, image: UIImage? = nil) {
        DispatchQueue.global(qos: .background).async {
            Data.tripModels[index].title = title
            Data.tripModels[index].image = image
        }
    }
    
    static func deleteTrip(index: Int) {
        Data.tripModels.remove(at: index)
    }
}
