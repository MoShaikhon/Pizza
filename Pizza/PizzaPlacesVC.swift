//
//  PizzaPlacesVC.swift
//  Pizza
//
//  Created by Mohamed Shaikhon on 11/27/20.
//

import UIKit


class PizzaPlacesVC: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let pizzaPlacesPresenter: PizzaPlacesPresenter
    var dataSource: [PizzaPlace]?
    
    init(pizzaPlacesPresenter: PizzaPlacesPresenter) {
        self.pizzaPlacesPresenter = pizzaPlacesPresenter
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        dataSource = pizzaPlacesPresenter.getPizzaPlaces()
        // Register cell classes
        self.collectionView!.register(PizzaPlaceCell.self, forCellWithReuseIdentifier: cellID)
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! PizzaPlaceCell
        let pizzaPlace = dataSource![indexPath.item]
        cell.populateCell(pizzaPlaceName: pizzaPlace.name, pizzaPlaceRating: pizzaPlace.rating.rawValue)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width - 30, height: 170)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }

}
