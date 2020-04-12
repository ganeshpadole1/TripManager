//
//  ActivitiesViewController.swift
//  TripManager
//
//  Created by ganesh padole on 12/04/20.
//  Copyright © 2020 ganesh padole. All rights reserved.
//

import UIKit

class ActivitiesViewController: UIViewController {
    
    var tripId: UUID!
    var tripModel: TripModel?
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!
      
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        
        TripFunctions.readTrip(by: tripId) { [weak self] (model) in
            
            guard let self = self else {return}
            self.tripModel = model
            
            self.title = self.tripModel?.title
            self.backgroundImageView.image = self.tripModel?.image
            self.tableView.reloadData()
        }
    }
   
}

extension ActivitiesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tripModel?.dayModels[section].activityModels.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        }
        
        cell?.textLabel?.text = tripModel?.dayModels[indexPath.section].activityModels[indexPath.row].title
        
        return UITableViewCell(style: .default, reuseIdentifier: "cell")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return tripModel?.dayModels.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let title = tripModel?.dayModels[section].title ?? ""
        let subtitle = tripModel?.dayModels[section].subtitle ?? ""
        
        return "\(title) - \(subtitle)"
    }
}
