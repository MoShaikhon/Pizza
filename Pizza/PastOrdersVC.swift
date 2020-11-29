//
//  PastOrdersVC.swift
//  Pizza
//
//  Created by Mohamed Shaikhon on 11/28/20.
//

import UIKit

private let reuseIdentifier = "Cell"

class PastOrdersVC: UICollectionViewController,UICollectionViewDelegateFlowLayout {
    let pastOrdersPresenter: PastOrdersPresenter
    var dataSource: [PastOrder]?
    
    init(pastOrdersPresenter: PastOrdersPresenter) {
        self.pastOrdersPresenter = pastOrdersPresenter
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        dataSource = pastOrdersPresenter.getPastOrders()
        // Register cell classes
        self.collectionView!.register(PastOrderCell.self, forCellWithReuseIdentifier: cellID)
    }

    func deleteOrder(atIndex: Int) {
        pastOrdersPresenter.deleteOrder(atIndex: atIndex)
        dataSource = pastOrdersPresenter.getPastOrders()
        collectionView.reloadData()
    }
    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return dataSource?.count ?? 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! PastOrderCell
        let pastOrder = dataSource![indexPath.item]
        cell.index = indexPath.item
        cell.vc = self
        cell.populateCell(pizzaPlaceName: pastOrder.pizzaPlaceName, pizzaPlaceRating: String(pastOrder.totalCost))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width - 30, height: 170)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    

}

