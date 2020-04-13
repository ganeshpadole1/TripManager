//
//  AddTripViewController.swift
//  TripManager
//
//  Created by ganesh padole on 04/04/20.
//  Copyright © 2020 ganesh padole. All rights reserved.
//

import UIKit
import Photos

class AddTripViewController: UIViewController {
    
    @IBOutlet weak var cameraButton: UIButton!
    @IBOutlet weak var addTripLabel: UILabel!
    @IBOutlet weak var addTripTextField: UITextField!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    
    var doneSaving: (() -> ())? //callback function
    var indexToEditTrip: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addTripLabel.font = UIFont(name: Theme.mainFontName, size: 24)
        imageView.layer.cornerRadius = 10
        
        //dropShadow on title
        addTripLabel.layer.shadowOpacity = 1
        addTripLabel.layer.shadowColor = UIColor.white.cgColor
        addTripLabel.layer.shadowOffset = CGSize.zero
        addTripLabel.layer.shadowRadius = 5
        
        if let index = indexToEditTrip {
            let trip = Data.tripModels[index]
            addTripTextField.text = trip.title
            imageView.image = trip.image
            addTripLabel.text = "Edit Trip"
        }
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
        
        if let index = indexToEditTrip { //Edit trip
            TripFunctions.updateTrip(index: index, title: newTripName, image: imageView.image)
        } else {
            TripFunctions.createTrip(tripModel: TripModel(title: newTripName, image: imageView.image))
        }
         
        if let doneSaving = doneSaving {
            doneSaving()
        }
        dismiss(animated: true)
    }
    
    fileprivate func presentPhotoPicker() {
        let myPickerController = UIImagePickerController()
        myPickerController.allowsEditing = true
        myPickerController.delegate = self
        myPickerController.sourceType = .photoLibrary
        self.present(myPickerController, animated: true)
    }
    
    @IBAction func cameraPhot(_ sender: UIButton) {
        
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            PHPhotoLibrary.requestAuthorization { (status) in
                switch status {
                case .authorized:
                    DispatchQueue.main.async {
                        self.presentPhotoPicker()
                    }
                case .notDetermined:
                    if status == PHAuthorizationStatus.authorized {
                      //  DispatchQueue.main.async {
                            self.presentPhotoPicker()
                        //}
                    }
                case .restricted:
                    let alertController = UIAlertController(title: "Photo Library Access Restricted", message: "Photo Library access is restricted and cannot be accessed.", preferredStyle: .alert )
                    let okButton = UIAlertAction(title: "OK", style: .default)
                    alertController.addAction(okButton)
                    self.present(alertController, animated: true, completion: nil)
                case .denied:
                    print("")
//                    let alertController = UIAlertController(title: "Photo Library Restricted", message: "Photo Library access was previously denied. Please update your Settings if you want to change this.", preferredStyle: .alert )
//                    let gotoSettingsAction = UIAlertAction(title: "Go to Settings", style: .default) {
//                        (action) in
//
////                        DispatchQueue.global(qos: .background).async {
////                           // DispatchQueue.main.async {
////                                let url = URL(string: UIApplication.openSettingsURLString)!
////                                UIApplication.shared.open(url, options: [:])
////                            //}
////                        }
//
//                    }
//                    let cancelButton = UIAlertAction(title: "Cancel", style: .cancel)
//                    alertController.addAction(gotoSettingsAction)
//                    alertController.addAction(cancelButton)
//                    self.present(alertController, animated: true, completion: nil)
                @unknown default:
                    print("future case")
                }
            }
        }
        
    }
    
}

extension AddTripViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let editedImage = info[.editedImage] as? UIImage {
            self.imageView.image = editedImage
        } else if let image = info[.originalImage] as? UIImage {
            self.imageView.image = image
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}
