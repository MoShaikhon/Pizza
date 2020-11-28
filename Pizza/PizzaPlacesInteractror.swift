//
//  PizzaPlacesInteractror.swift
//  Pizza
//
//  Created by Mohamed Shaikhon on 11/27/20.
//

import Foundation
struct PizzaPlacesInteractror {
   private let pizzaPlaces = [PizzaPlace(name: "Domino's", rating: .awesome),PizzaPlace(name: "Pizza Hut", rating: .veryGood),PizzaPlace(name: "Papa Jones", rating: .good), PizzaPlace(name: "Milano Pizza", rating: .awesome), PizzaPlace(name: "Mike's Pizza", rating: .bad), PizzaPlace(name: "Mark's Pizza", rating: .notBad)]
    func fetchPizzaPlaces() -> [PizzaPlace] {
        return pizzaPlaces
    }
    
}
