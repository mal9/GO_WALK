//
//  SecondViewController.swift
//  gowalk
//
//  Created by Student on 02/07/2019.
//  Copyright © 2019 Student. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var descriptionField: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameField.layer.borderColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0).cgColor
        nameField.layer.borderWidth = 1.0
        nameField.layer.cornerRadius = 5
        descriptionField.layer.borderColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0).cgColor
        descriptionField.layer.borderWidth = 1.0
        descriptionField.layer.cornerRadius = 5
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func sendButton(_ sender: Any) {
        let name = nameField.text ?? ""
        let description = descriptionField.text ?? ""
        if name != "" {
            let newTrip = Trip(description: description,
                               name: name,
                               rating: 0, amountOfMarks: 0,
                               time: Int.random(in: 1 ... 240), createTime: Date(),
                               image: UIImage(named: "popich")!)
            let app = App.shared
            app.addTrip(Trip: newTrip)
        }
    }
}

