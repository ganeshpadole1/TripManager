//
//  ActivityTableViewCell.swift
//  TripManager
//
//  Created by ganesh padole on 13/04/20.
//  Copyright © 2020 ganesh padole. All rights reserved.
//

import UIKit

class ActivityTableViewCell: UITableViewCell {

    @IBOutlet weak var activityImageView: UIImageView!
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
        cardView.addRoundedCornerAndRadius()
        titleLabel.font = UIFont(name: Theme.bodyFontNameDemiBold, size: 17)
        subtitleLabel.font = UIFont(name: Theme.bodyFontNameBold, size: 17)
    }

    func setup(model: ActivityModel) {
        self.titleLabel.text = model.title
        self.subtitleLabel.text = model.subTitle
        
        self.activityImageView.image = getActivityImage(type: model.activityType)
    }

    func getActivityImage(type: ActivityType) -> UIImage {
        
        switch type {
        case .auto:
            return #imageLiteral(resourceName: "Car")
        case .food:
            return #imageLiteral(resourceName: "Food")
        case .hotel:
            return #imageLiteral(resourceName: "Hotel")
        case .flight:
             return #imageLiteral(resourceName: "Flight")
        case .excursion:
            return #imageLiteral(resourceName: "Excursion")
        
        }
    }
}
