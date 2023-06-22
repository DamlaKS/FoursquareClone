//
//  PlacesSingleton.swift
//  FoursquareClone
//
//  Created by Damla KS on 20.06.2023.
//

import Foundation
import UIKit

class PlaceModel {
    
    static let sharedInstance = PlaceModel()
    
    var placeName = ""
    var placeType = ""
    var placeAtmosphere = ""
    var placeImage = UIImage()
    var placeLatitude = ""
    var placeLongitude = ""
    
    private init() {
        
    }
    
}
