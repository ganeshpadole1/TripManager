//
//  TripsViewController.swift
//  TripManager
//
//  Created by ganesh padole on 02/04/20.
//  Copyright © 2020 ganesh padole. All rights reserved.
//

import UIKit

class TripsViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var addButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        view.backgroundColor = Theme.backgroundColor
        
        TripFunctions.readTrips { [weak self] in
            self?.tableView.reloadData()
        }
        
        let origImage = UIImage(named: "addButton")
        let tintedImage = origImage?.withRenderingMode(.alwaysTemplate)
        addButton.setImage(tintedImage, for: .normal)
        addButton.tintColor = .white
        
        addButton.createFloatingActionButton()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toAddTripSegue" {
            let popUpView = segue.destination as! AddTripViewController
            popUpView.doneSaving = { [weak self] in
                self?.tableView.reloadData()
            }
        }
    }
}

extension TripsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Data.tripModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TripsTableViewCell
        cell.setupCell(tripModel: Data.tripModels[indexPath.row])
        
        return cell
    }
}

extension TripsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}
