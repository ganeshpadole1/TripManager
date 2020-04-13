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
    var sectionHeaderHeight: CGFloat = 0.0
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!
      
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        
        TripFunctions.readTrip(by: tripId) { [weak self] (model) in
            
            guard let self = self else {return}
            self.tripModel = model
            
            self.title = self.tripModel?.title
            self.backgroundImageView.image = self.tripModel?.image
            self.tableView.reloadData()
        }
        
        sectionHeaderHeight = tableView.dequeueReusableCell(withIdentifier: "HeaderCell")?.contentView.bounds.height ?? 0.0 // initially get height for header
    }
   
}

extension ActivitiesViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tripModel?.dayModels[section].activityModels.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let activityModel = tripModel?.dayModels[indexPath.section].activityModels[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! ActivityTableViewCell
        cell.setup(model: activityModel!)
        return UITableViewCell(style: .default, reuseIdentifier: "cell")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return tripModel?.dayModels.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let model = tripModel?.dayModels[section]
        let cell = tableView.dequeueReusableCell(withIdentifier: "HeaderCell") as! HeaderTableViewCell
        cell.setup(dayModel: model!)
        return cell.contentView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
       
        return sectionHeaderHeight
    }

}
