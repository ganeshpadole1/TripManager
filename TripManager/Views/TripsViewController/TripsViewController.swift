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
    var indexToEditTrip: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        self.title = "Trips"
        view.backgroundColor = Theme.backgroundColor
        
        TripFunctions.readTrips { [weak self] in
            self?.tableView.reloadData()
        }
        
        let originalImage = UIImage(named: "addButton")
        let tintedImage = originalImage?.withRenderingMode(.alwaysTemplate)
        addButton.setImage(tintedImage, for: .normal)
        addButton.tintColor = .white
        
        addButton.createFloatingActionButton()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toAddTripSegue" {
            let popUpView = segue.destination as! AddTripViewController
            popUpView.indexToEditTrip = indexToEditTrip
            popUpView.doneSaving = { [weak self] in
                self?.tableView.reloadData()
            }
            indexToEditTrip = nil
        }
    }
}

extension TripsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Data.tripModels.count
    }
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: TripsTableViewCell.identifier) as! TripsTableViewCell
        cell.setupCell(tripModel: Data.tripModels[indexPath.row])
        
        return cell
    }
}

extension TripsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let trip = Data.tripModels[indexPath.row]
         
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (contextualAction, view, actionPerformed: @escaping (Bool) -> ()) in
            
            let alertController = UIAlertController(title: "Delete Trip?", message: "Are you sure you want to delete this trip: \(trip.title)", preferredStyle: .alert)
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (alertAction) in
                actionPerformed(false)
            }
            
            let deleteAction = UIAlertAction(title: "Delete", style: .destructive) { (alertAction) in
                TripFunctions.deleteTrip(index: indexPath.row)
                actionPerformed(true)
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
            
            alertController.addAction(cancelAction)
            alertController.addAction(deleteAction)
            
            self.present(alertController, animated: true)
          }
        deleteAction.image = #imageLiteral(resourceName: "delete")
        
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let editAction = UIContextualAction(style: .normal, title: "Edit") { (contextualAction, view, actionPerformed: @escaping (Bool) -> ()) in
            actionPerformed(true)
            self.indexToEditTrip = indexPath.row
            self.performSegue(withIdentifier: "toAddTripSegue", sender: nil)
        }
        
        editAction.image = #imageLiteral(resourceName: "EditImage")
        editAction.backgroundColor = #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)
        return UISwipeActionsConfiguration(actions: [editAction])
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let trip = Data.tripModels[indexPath.row]
        
        let storyboard = UIStoryboard(name: String(describing: ActivitiesViewController.self), bundle: nil)
        let vc = storyboard.instantiateInitialViewController() as! ActivitiesViewController
        vc.tripId = trip.id
        vc.tripTitle = trip.title
        navigationController?.pushViewController(vc, animated: true)
    }
}
