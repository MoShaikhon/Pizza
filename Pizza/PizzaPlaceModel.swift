//
//  PizzaPlaceModel.swift
//  Pizza
//
//  Created by Mohamed Shaikhon on 11/27/20.
//

import Foundation

enum Rating: String {
    case good = "Good"
    case veryGood = "VeryGood"
    case awesome = "Awesome"
    case notBad = "NotBad"
    case bad = "Bad"
    
}
struct PizzaPlace {
    var name: String
    var rating: Rating
}
