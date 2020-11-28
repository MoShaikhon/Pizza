////
////  PizzaPlacesListVC.swift
////  Pizza
////
////  Created by Mohamed Shaikhon on 11/27/20.
////
//
//import UIKit
//
//class PizzaPlacesListVC: UITableViewController {
//
//    let pizzaPlacesPresenter: PizzaPlacesPresenter
//    var dataSource: [PizzaPlace]?
//    init(pizzaPlacesPresenter: PizzaPlacesPresenter) {
//        self.pizzaPlacesPresenter = pizzaPlacesPresenter
//        super.init(nibName: nil, bundle: nil)
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        dataSource = pizzaPlacesPresenter.getPizzaPlaces()
//        tableView.register(PizzaPlaceCell.self, forCellReuseIdentifier: cellID)
//        tableView.rowHeight = 170
//
//    }
//
//    // MARK: - Table view data source
//
////    override func numberOfSections(in tableView: UITableView) -> Int {
////        // #warning Incomplete implementation, return the number of sections
////        return 0
////    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return dataSource?.count ?? 0
//    }
//    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! PizzaPlaceCell
//        let pizzaPlace = dataSource![indexPath.row]
//        cell.populateCell(pizzaPlaceName: pizzaPlace.name, pizzaPlaceRating: pizzaPlace.rating.rawValue)
//        return cell
//    }
//    
//
//    /*
//    // Override to support conditional editing of the table view.
//    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
//        // Return false if you do not want the specified item to be editable.
//        return true
//    }
//    */
//
//    /*
//    // Override to support editing the table view.
//    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            // Delete the row from the data source
//            tableView.deleteRows(at: [indexPath], with: .fade)
//        } else if editingStyle == .insert {
//            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
//        }    
//    }
//    */
//
//    /*
//    // Override to support rearranging the table view.
//    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
//
//    }
//    */
//
//    /*
//    // Override to support conditional rearranging of the table view.
//    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
//        // Return false if you do not want the item to be re-orderable.
//        return true
//    }
//    */
//
//    /*
//    // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destination.
//        // Pass the selected object to the new view controller.
//    }
//    */
//
//}
