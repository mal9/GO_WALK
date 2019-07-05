//
//  TripViewController.swift
//  gowalk
//
//  Created by Student on 02/07/2019.
//  Copyright © 2019 Student. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit


class TripViewController: UIViewController {
    
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
        
    var trip: Trip?
    
    @IBOutlet weak var tripImage: UIImageView!
    @IBOutlet weak var tripDescription: UILabel!
    @IBOutlet weak var tripTime: UILabel!
    @IBOutlet weak var tripRating: UILabel!
    @IBOutlet weak var tripName: UILabel!
    @IBOutlet weak var tripMap: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        if let trip = trip {
            tripName.text = trip.name
            tripRating.text = "\(String(trip.rating))/5"
            tripTime.text = "~\(String(trip.time)) мин."
            tripDescription.text = trip.description
            tripImage.image = trip.image
            if trip.coordinate.count > 0 {
                for elem in trip.coordinate {
                    let annotation = MKPointAnnotation()
                    annotation.coordinate = elem
                    self.tripMap.addAnnotation(annotation)
                }
            }
        }
        navigationController?.navigationBar.barTintColor = hexStringToUIColor(hex: "#c9f452")
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
