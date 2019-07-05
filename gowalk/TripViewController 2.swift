//
//  TripViewController.swift
//  gowalk
//
//  Created by Student on 02/07/2019.
//  Copyright © 2019 Student. All rights reserved.
//

import UIKit

class TripViewController: UIViewController {

    var trip: Trip?
    
    
    @IBOutlet weak var tripImage: UIImageView!
    @IBOutlet weak var tripDescription: UILabel!
    @IBOutlet weak var tripTime: UILabel!
    @IBOutlet weak var tripRating: UILabel!
    @IBOutlet weak var tripName: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        if let trip = trip {
            tripName.text = trip.name
            tripRating.text = "\(String(trip.rating))/5"
            tripTime.text = "~\(String(trip.time)) мин."
            tripDescription.text = trip.description
            tripImage.image = trip.image
        }
        // Do any additional setup after loading the view.
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
