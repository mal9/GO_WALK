//
//  SecondViewController.swift
//  gowalk
//
//  Created by Student on 02/07/2019.
//  Copyright © 2019 Student. All rights reserved.
//

import UIKit
import GoogleMaps


class SecondViewController: UIViewController {
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var descriptionField: UITextView!
    @IBOutlet weak var img_view: UIImageView!
    let imagepicker = UIImagePickerController()
    
    /*override func loadView() {
        // Create a GMSCameraPosition that tells the map to display the
        // coordinate -33.86,151.20 at zoom level 6.
        let camera = GMSCameraPosition.camera(withLatitude: -33.86, longitude: 151.20, zoom: 6.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        view = mapView
        
        // Creates a marker in the center of the map.
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: -33.86, longitude: 151.20)
        marker.title = "Sydney"
        marker.snippet = "Australia"
        marker.map = mapView
    }*/
    
    override func viewDidLoad() {
        super.viewDidLoad()
        img_view.image = UIImage(named: "popich")
        nameField.layer.borderColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0).cgColor
        nameField.layer.borderWidth = 1.0
        nameField.layer.cornerRadius = 5
        descriptionField.layer.borderColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0).cgColor
        descriptionField.layer.borderWidth = 1.0
        descriptionField.layer.cornerRadius = 5
        // Do any additional setup after loading the view, typically from a nib.
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
                               image: img_view.image ?? UIImage(named: "popich")!)
            let app = App.shared
            app.addTrip(Trip: newTrip)
        }
    }
}


extension SecondViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
}
