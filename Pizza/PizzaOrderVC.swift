//
//  PizzaOrderVC.swift
//  Pizza
//
//  Created by Mohamed Shaikhon on 11/28/20.
//

import UIKit

class PizzaOrderVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
}

enum PizzaSize: String {
    case small = "Small"
    case medium = "Medium"
    case large = "Large"
}

enum Drink: String {
    case cocaCola = "CocaCola"
    case water = "Water"
    case pepsi = "Pepsi"
}
struct Order {
    let pizzaSize: PizzaSize
    let drink: Drink
}

struct PastOrder {
    let totalCost: Int
    let pizzaPlaceName: String
}
class PastOrdersInteractor {
    static var pastOrdersInteractor = PastOrdersInteractor()
    private init(){}
    private var pastOrders = [PastOrder]()
    func addOrder(pastOrder: PastOrder){
        pastOrders.append(pastOrder)
    }
    func deleteOrder(atIndex: Int){
        pastOrders.remove(at: atIndex)
    }
    func fetchOrders()->[PastOrder]{
        return pastOrders
    }
    class PastOrdersPresenter {
        func getPastOrders()-> [PastOrder] {
            return PastOrdersInteractor.pastOrdersInteractor.fetchOrders()
        }
        func deleteOrder(atIndex: Int){
            PastOrdersInteractor.pastOrdersInteractor.deleteOrder(atIndex: atIndex)
        }
    }
}
