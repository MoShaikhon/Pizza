//
//  File.swift
//  Pizza
//
//  Created by Mohamed Shaikhon on 11/27/20.
//
import UIKit

class PastOrderCell: UICollectionViewCell {
    var vc: PastOrdersVC?
    var index: Int?
    private lazy var containerView: UIView = {
        let view = UIView()
        view.enableAutoLayout()
        view.backgroundColor = .white
        return view
    }()
    private lazy var PizzaPlaceNameLabel: UILabel = {
        let label = UILabel()
        label.enableAutoLayout()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    private lazy var PizzaPlaceRatingLabel: UILabel = {
        let label = UILabel()
        label.enableAutoLayout()
        label.textAlignment = .right
        label.font = UIFont.systemFont(ofSize: 12)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    private lazy var pizzaPlaceImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.enableAutoLayout()
        imageView.contentMode = .scaleAspectFill
        imageView.image = #imageLiteral(resourceName: "pizza0")
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCard()
        anchorViews()
        let gesture = UILongPressGestureRecognizer(target: self, action: #selector(deleteOrder))
        containerView.addGestureRecognizer(gesture)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   @objc private func deleteOrder(){
   
                let alertController = UIAlertController(title:"Delete past order" , message: "Are you sure you want to delete this order?", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
                alertController.addAction(UIAlertAction(title: "Yes", style: .default, handler: { [weak self] _ in
                    guard let self = self else {return}
                    if self.index != nil {
                        self.vc?.deleteOrder(atIndex: self.index!)
                    }
                }))
                vc?.present(alertController,animated: true)
    
   }
    
    fileprivate func setupCard() {
        containerView.layer.cornerRadius = 20.0
        containerView.layer.shadowColor = UIColor.gray.cgColor
        containerView.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        containerView.layer.shadowRadius = 2.0
        containerView.layer.shadowOpacity = 0.4
        clipsToBounds = true
    }
    
    private func anchorViews() {
        anchorContainerView()
        anchorPizzaPlaceImageView()
        anchorPizzaPlaceNameLabel()
        anchorPizzaPlaceRatingLabel()
    }
    private func anchorContainerView() {
        addSubview(containerView)
        containerView.anchorYAxis(top: topAnchor, bottom: bottomAnchor, topConstant: 0, bottomConstant: -5)
        containerView.anchorXAxis(leading: leadingAnchor, trailing: trailingAnchor, leadingConstant: 0, trailingConstant: 0)
    }
    private func anchorPizzaPlaceImageView() {
        containerView.addSubview(pizzaPlaceImageView)
        pizzaPlaceImageView.anchorYAxis(top: containerView.topAnchor, topConstant: 0)
        pizzaPlaceImageView.anchorXAxis(leading: containerView.leadingAnchor,trailing: containerView.trailingAnchor,leadingConstant: 0, trailingConstant: 0)
        pizzaPlaceImageView.anchorHeight(height: containerView.heightAnchor, multiplier: 0.38, constant: 0)
    }
    private func anchorPizzaPlaceNameLabel() {
        containerView.addSubview(PizzaPlaceNameLabel)
        PizzaPlaceNameLabel.anchorYAxis(bottom: containerView.bottomAnchor, topConstant: 2, bottomConstant: -10)
        PizzaPlaceNameLabel.anchorXAxis(leading: containerView.leadingAnchor,  leadingConstant: 10)
    }
    private func anchorPizzaPlaceRatingLabel() {
        containerView.addSubview(PizzaPlaceRatingLabel)
        PizzaPlaceRatingLabel.anchorYAxis(top: PizzaPlaceNameLabel.topAnchor, bottom: PizzaPlaceNameLabel.bottomAnchor, topConstant: 2, bottomConstant: -2)
        PizzaPlaceRatingLabel.anchorXAxis(trailing: trailingAnchor,trailingConstant: -10)
    }
    
    func populateCell(pizzaPlaceName: String, pizzaPlaceRating: String) {
        PizzaPlaceNameLabel.text = pizzaPlaceName
        PizzaPlaceRatingLabel.text = pizzaPlaceRating + "$"
        
    }
    
    
}
