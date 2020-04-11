//
//  TripsTableViewCell.swift
//  TripManager
//
//  Created by ganesh padole on 04/04/20.
//  Copyright © 2020 ganesh padole. All rights reserved.
//

import UIKit

class TripsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var tripImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        cellView.addRoundedCornerAndRadius()
        titleLabel.font = UIFont(name: Theme.mainFontName, size: 32.0)
        cellView.backgroundColor = Theme.accent
        tripImageView.layer.cornerRadius = cellView.layer.cornerRadius
    }
    
    func setupCell(tripModel: TripModel) {
        self.titleLabel.text = tripModel.title
        self.tripImageView.image = tripModel.image
        
        if let tripImage = tripModel.image {
            tripImageView.alpha = 0.3
            tripImageView.image = tripImage
            
            UIView.animate(withDuration: 1) {
                self.tripImageView.image = tripImage
                self.tripImageView.alpha = 1
            }
        }
    }
}
