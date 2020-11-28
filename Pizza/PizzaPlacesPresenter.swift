//
//  PizzaPlacesPresenter.swift
//  Pizza
//
//  Created by Mohamed Shaikhon on 11/27/20.
//

import Foundation
class PizzaPlacesPresenter {
    let pizzaPlaceInteractor: PizzaPlacesInteractror
    init(pizzaPlaceInteractor: PizzaPlacesInteractror) {
        self.pizzaPlaceInteractor = pizzaPlaceInteractor
    }
    func getPizzaPlaces()-> [PizzaPlace] {
       return pizzaPlaceInteractor.fetchPizzaPlaces()
    }
}
