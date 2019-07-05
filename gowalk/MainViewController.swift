//
//  FirstViewController.swift
//  gowalk
//
//  Created by Student on 02/07/2019.
//  Copyright © 2019 Student. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var mainViewSortType: UISegmentedControl!
    
    var trips: [Trip] {
        if mainViewSortType.selectedSegmentIndex == 1{
            return App.shared.sortedByCreateTime()
        }
        return App.shared.sortedByPopularity()
    }
    @IBAction func mainViewSortTypeChanged(_ sender: Any) { tableView.reloadData()
    }
    
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
    
    
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        navigationController?.navigationBar.barTintColor = hexStringToUIColor(hex: "#c9f452")
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.setHidesBackButton(true, animated: false)
        tableView.reloadData()
    }
    
}

extension MainViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trips.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tripCell", for: indexPath) as! TripTableViewCell
        cell.update(trip: trips[indexPath.row])
        return cell
    }
    
    
}

extension MainViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let view = UIStoryboard(name: "SingleTripStoryboard", bundle: nil).instantiateViewController(withIdentifier: "tripViewController") as! TripViewController
//        view.loadViewIfNeeded()
        view.trip = trips[indexPath.row]
        show(view, sender: nil)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
