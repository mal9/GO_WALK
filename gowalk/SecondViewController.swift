//
//  SecondViewController.swift
//  gowalk
//
//  Created by Student on 02/07/2019.
//  Copyright © 2019 Student. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit


class SecondViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var descriptionField: UITextView!
    @IBOutlet weak var img_view: UIImageView!
    @IBOutlet weak var mapView: MKMapView!
    let imagepicker = UIImagePickerController()
    var locationManager: CLLocationManager!
    var coordinate = [CLLocationCoordinate2D]()
    
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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
                navigationController?.navigationBar.barTintColor = hexStringToUIColor(hex: "#c9f452")
        
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager = CLLocationManager()
            locationManager.delegate = self
            locationManager.requestAlwaysAuthorization()
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
        }
        
        img_view.image = UIImage(named: "MSK")
        
        nameField.layer.borderColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0).cgColor
        nameField.layer.borderWidth = 1.0
        nameField.layer.cornerRadius = 5
        descriptionField.layer.borderColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0).cgColor
        descriptionField.layer.borderWidth = 1.0
        descriptionField.layer.cornerRadius = 5
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func btn_pick_img_press(_ sender: Any) {
        imagepicker.delegate = self
        imagepicker.sourceType = UIImagePickerController.SourceType.savedPhotosAlbum
        self.present(imagepicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            img_view.image = image
        }
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func sendButton(_ sender: Any) {
        let name = nameField.text ?? ""
        let description = descriptionField.text ?? ""
        if name != "" {
            let newTrip = Trip(description: description,
                               name: name,
                               rating: 0, amountOfMarks: 0,
                               time: Int.random(in: 1 ... 240), createTime: Date(),
                               image: img_view.image ?? UIImage(named: "popich")!,
                               coordinate: coordinate)
            let app = App.shared
            app.addTrip(Trip: newTrip)
        }
    }
    
    func locationManager(manager: CLLocationManager!, didUpdateToLocation newLocation: CLLocation!, fromLocation oldLocation: CLLocation!) {
        let span = MKCoordinateSpan(latitudeDelta: 0.20, longitudeDelta: 0.20)
        let region = MKCoordinateRegion(center: newLocation.coordinate, span: span)
        mapView.setRegion(region, animated: true)
    }
    
    @IBAction func addPin(_ sender: UILongPressGestureRecognizer) {
        let location = sender.location(in: self.mapView)
        let locCoord = self.mapView.convert(location, toCoordinateFrom: self.mapView)
        let annotation = MKPointAnnotation()
        annotation.coordinate = locCoord
        coordinate.append(locCoord)
        self.mapView.addAnnotation(annotation)
    }
    
}


extension SecondViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
}
