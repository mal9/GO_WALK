//
//  Model.swift
//  gowalk
//
//  Created by Student on 02/07/2019.
//  Copyright © 2019 Student. All rights reserved.
//

import Foundation
import UIKit
import MapKit
import CoreLocation

struct Trip {
    var description:String
    var name:String
    //var tripRef: String
    var rating:Float
    var amountOfMarks:Int
    var time:Int
    var createTime:Date
    var image:UIImage
    var coordinate: [CLLocationCoordinate2D]
}

