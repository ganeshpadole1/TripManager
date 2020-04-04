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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        cellView.addRoundedCornerAndRadius()
        titleLabel.font = UIFont(name: Theme.mainFontName, size: 32.0)
        cellView.backgroundColor = Theme.accent
    }
    
    func setupCell(tripModel: TripModel) {
        self.titleLabel.text = tripModel.title
    }
}
