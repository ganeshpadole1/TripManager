//
//  AddTripViewController.swift
//  TripManager
//
//  Created by ganesh padole on 04/04/20.
//  Copyright © 2020 ganesh padole. All rights reserved.
//

import UIKit

class AddTripViewController: UIViewController {
    
    @IBOutlet weak var addTripLabel: UILabel!
    @IBOutlet weak var addTripTextField: UITextField!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    
    var doneSaving: (() -> ())? //callback function
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addTripLabel.font = UIFont(name: Theme.mainFontName, size: 24)
    }
    
    @IBAction func cancel(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    
    @IBAction func save(_ sender: UIButton) {
        
        addTripTextField.rightViewMode = .never
        
        guard addTripTextField.text != "", let newTripName = addTripTextField.text else {
            //            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 30, height: 20))
            //            imageView.image = #imageLiteral(resourceName: "warningImage")
            //            imageView.contentMode = .scaleAspectFit
            //            addTripTextField.rightView = imageView
            
            //alternative
            //addTripTextField.backgroundColor = .red
            
            addTripTextField.layer.borderColor = UIColor.red.cgColor
            addTripTextField.layer.borderWidth = 2
            addTripTextField.layer.cornerRadius = 5
            addTripTextField.placeholder = "Trip name required"
            
            addTripTextField.rightViewMode = .always
            
            return
        }
        
        
        TripFunctions.createTrip(tripModel: TripModel(title: newTripName))
        if let doneSaving = doneSaving {
            doneSaving()
        }
        dismiss(animated: true)
    }
}
