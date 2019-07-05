//
//  TripTableViewCell.swift
//  gowalk
//
//  Created by Student on 02/07/2019.
//  Copyright © 2019 Student. All rights reserved.
//

import UIKit

class TripTableViewCell: UITableViewCell {
    @IBOutlet weak var tripName: UILabel!
    @IBOutlet weak var tripDescription: UILabel!
    @IBOutlet weak var tripRating: UILabel!
    @IBOutlet weak var tripImage: UIImageView!
    
    func update(trip: Trip) {
        tripName.text = trip.name
        tripDescription.text = trip.description
        tripRating.text = String(trip.rating)
        tripImage.image = trip.image
    }
}
