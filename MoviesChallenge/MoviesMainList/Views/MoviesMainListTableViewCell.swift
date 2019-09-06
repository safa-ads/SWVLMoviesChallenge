//
//  MoviesMainListTableViewCell.swift
//  MoviesChallenge
//
//  Created by Safa Ads on 9/6/19.
//  Copyright © 2019 safaads. All rights reserved.
//

import UIKit
import Cosmos


class MoviesMainListTableViewCell: UITableViewCell {

    public static let cellIdentifier = "MoviesMainListTableViewCellIdentifier"
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ratingView: CosmosView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func setRating(rating:Int) {
        ratingView.settings.updateOnTouch = false
        ratingView.rating = Double(rating)
    }
}
