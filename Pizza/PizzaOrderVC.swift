//
//  PizzaOrderVC.swift
//  Pizza
//
//  Created by Mohamed Shaikhon on 11/28/20.
//

import UIKit

class PizzaOrderVC: UIViewController {
    var pizzaPlaceName: String!
    var orderTotalCost = 0 {
        didSet{
            let alertController = UIAlertController(title:"Thanks for ordering!" , message: "Your order is on its way!", preferredStyle: .alert)
            
            alertController.addAction(UIAlertAction(title: "Okay", style: .default, handler: { [weak self] _ in
                guard let self = self else {return}
                PastOrdersInteractor.pastOrdersInteractor.addOrder(pastOrder: PastOrder(totalCost: self.orderTotalCost, pizzaPlaceName: self.pizzaPlaceName))
                self.navigationController?.popViewController(animated: true)
                
            }))
            self.present(alertController,animated: true)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let orderView = PizzaOrderView()
        orderView.vc = self
        view.addSubview(orderView)
        orderView.enableAutoLayout()
        orderView.anchorYAxis(top: view.safeAreaLayoutGuide.topAnchor, bottom: view.bottomAnchor, topConstant: 0, bottomConstant: 0)
        orderView.anchorXAxis(leading: view.leadingAnchor, trailing: view.trailingAnchor, leadingConstant: 0, trailingConstant: 0)
        
        // Do any additional setup after loading the view.
    }
    
}

enum PizzaSize: String {
    case small = "Small 10$"
    case medium = "Medium 15$"
    case large = "Large 20$"
}

enum Drink: String {
    case cocaCola = "CocaCola 3$"
    case water = "Water 1$"
    case pepsi = "Pepsi 3$"
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
        if pastOrders.count > atIndex {
        pastOrders.remove(at: atIndex)
        }
    }
    func fetchOrders()->[PastOrder]{
        return pastOrders
    }
}
    class PastOrdersPresenter {
        func getPastOrders()-> [PastOrder] {
            return PastOrdersInteractor.pastOrdersInteractor.fetchOrders()
        }
        func deleteOrder(atIndex: Int){
            PastOrdersInteractor.pastOrdersInteractor.deleteOrder(atIndex: atIndex)
        }
    }

