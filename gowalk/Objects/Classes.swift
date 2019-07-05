//
//  Classes.swift
//  gowalk
//
//  Created by Student on 02/07/2019.
//  Copyright © 2019 Student. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class App {
    
    public static var shared = App()
    
    var trips:[Trip] = []
    
    private init() {
        self.getTrips()
    }
    
    func getTrips(){
        /*
        let tripsRef = Database
            .database(url: "https://gowalk-d1872.firebaseio.com/")
            .reference()
            .child("trips")
        
        var cTrips:[Trip] = []
        tripsRef.observe(.value) { snapshot in
            for child in snapshot.children { //even though there is only 1 child
                let snap = child as! DataSnapshot
                let dict = snap.value as! [String: Any]
                let name = dict["name"] as? String ?? ""
                let rating = Float(dict["rating"] as? String ?? "")
                let amountOfMarks = Int(dict["amountOfMarks"] as? String ?? "")
                let description = dict["description"] as? String ?? ""
                let time = Int(dict["time"] as? String ?? "")
                let createTime = Double(dict["name"] as? String ?? "")
                let image = dict["image"] as? String ?? ""
                cTrips.append(Trip(description: description, name: name, rating: rating!, amountOfMarks: amountOfMarks!, time: time!, createTime: Date(timeIntervalSince1970: createTime ?? 1562102042), image: UIImage(named: image) ?? UIImage(named: "popich")!, coordinate: []))
                
            }
        self.trips = cTrips
    }*/
        
        trips = [Trip(description: """
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut dignissim ligula molestie sapien lobortis malesuada. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse potenti. Phasellus fermentum enim et porttitor auctor. Curabitur ac varius odio. Praesent accumsan est at arcu tempus mattis. Aenean lacus ex, interdum at mollis at, tempus nec ex. Nulla quam purus, blandit ac nunc sit amet, faucibus pharetra nunc. Nam consectetur libero augue, non volutpat tellus imperdiet ac.
            
""", name: "Романтика", rating: 5, amountOfMarks:13, time: 200, createTime: Date(timeIntervalSince1970: 1562102042), image: UIImage(named: "MSK")!, coordinate: []),
        Trip(description: """
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut dignissim ligula molestie sapien lobortis malesuada. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse potenti. Phasellus fermentum enim et porttitor auctor. Curabitur ac varius odio. Praesent accumsan est at arcu tempus mattis. Aenean lacus ex, interdum at mollis at, tempus nec ex. Nulla quam purus, blandit ac nunc sit amet, faucibus pharetra nunc. Nam consectetur libero augue, non volutpat tellus imperdiet ac.
            
""", name: "Прогулка с собакой", rating: 4.04, amountOfMarks: 17, time: 300, createTime: Date(timeIntervalSince1970: 1562062042), image: UIImage(named: "park")!, coordinate: []),
        Trip(description: """
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut dignissim ligula molestie sapien lobortis malesuada. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse potenti. Phasellus fermentum enim et porttitor auctor. Curabitur ac varius odio. Praesent accumsan est at arcu tempus mattis. Aenean lacus ex, interdum at mollis at, tempus nec ex. Nulla quam purus, blandit ac nunc sit amet, faucibus pharetra nunc. Nam consectetur libero augue, non volutpat tellus imperdiet ac.
            
""", name: "Утренняя пробежка", rating: 3.65, amountOfMarks:4, time: 400, createTime: Date(timeIntervalSince1970: 1162122042), image: UIImage(named: "bannoe")!, coordinate: []),
        Trip(description: """
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut dignissim ligula molestie sapien lobortis malesuada. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse potenti. Phasellus fermentum enim et porttitor auctor. Curabitur ac varius odio. Praesent accumsan est at arcu tempus mattis. Aenean lacus ex, interdum at mollis at, tempus nec ex. Nulla quam purus, blandit ac nunc sit amet, faucibus pharetra nunc. Nam consectetur libero augue, non volutpat tellus imperdiet ac.
            
""", name: "Поход в кино", rating: 2.4, amountOfMarks:8, time: 500, createTime: Date(timeIntervalSince1970: 1562140042), image: UIImage(named: "с1")!, coordinate: [])]
 
    }
    
    func addTrip(Trip:Trip){
        self.trips.append(Trip)
    }
    
    private func calcPopularity(trip:Trip) -> Float{
        let r = trip.rating - 3.5
        return r*Float(trip.amountOfMarks)
    }
    
    
    func sortedByPopularity() -> [Trip]{
        var popularityList: [Float] = []
        var sortedTrips: [Trip] = []
        
        for trip in self.trips{
            let cp = calcPopularity(trip: trip)
            var i = 0
            while i < popularityList.count && popularityList[i] > cp{
                i += 1
            }
            popularityList.insert(cp, at: i)
            sortedTrips.insert(trip, at: i)
            }
        
        return sortedTrips
    }
    
    func sortedByCreateTime() -> [Trip]{
        var createTimeList: [Float] = []
        var sortedTrips: [Trip] = []
        
        for trip in self.trips{
            let cp = trip.createTime.timeIntervalSince1970
            var i = 0
            while i < createTimeList.count && createTimeList[i] > Float(cp){
                i += 1
            }
            createTimeList.insert(Float(cp), at: i)
            sortedTrips.insert(trip, at: i)
        }
        
        return sortedTrips
    }
    
}


