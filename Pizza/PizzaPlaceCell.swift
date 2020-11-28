//
//  File.swift
//  Pizza
//
//  Created by Mohamed Shaikhon on 11/27/20.
//
let cellID = "pizzaCell"
import UIKit

//protocol PresentingCellDataSource {
//    var placeName: String { get set }
//    var placeAddress: String { get set }
//    var placePhoto: String { get set }
//    var id: String {get set}
//}
//struct PresentedCellDataSource: PresentingCellDataSource {
//    var placeName: String
//    var rating: String
//    var placePhoto: String
//
//}

class PizzaPlaceCell: UICollectionViewCell {
    
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
        //        label.text = "capXX: cap the photo with a width or height of XX. (whichever is larger). Scales they"
        return label
    }()
    private lazy var PizzaPlaceRatingLabel: UILabel = {
        let label = UILabel()
        label.enableAutoLayout()
        label.textAlignment = .right
        label.font = UIFont.systemFont(ofSize: 12)
        label.numberOfLines = 0
        label.sizeToFit()
        //        label.text = "capXX: cap the photo with a width or height of XX. (whichever is larger). Scales they"
        return label
    }()
    
    private lazy var pizzaPlaceImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.enableAutoLayout()
        imageView.contentMode = .scaleAspectFill
        imageView.image = #imageLiteral(resourceName: "pizza")
        //        imageView.backgroundColor = .lightGray
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCard()

        anchorViews()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    fileprivate func setupCard() {
//        backgroundColor = #colorLiteral(red: 0.9378238342, green: 0.9378238342, blue: 0.9378238342, alpha: 1)
        containerView.layer.cornerRadius = 20.0
        containerView.layer.shadowColor = UIColor.gray.cgColor
        containerView.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        containerView.layer.shadowRadius = 2.0
        containerView.layer.shadowOpacity = 0.4
        
//        containerView.layer.masksToBounds = true
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
        PizzaPlaceNameLabel.anchorYAxis(top: pizzaPlaceImageView.bottomAnchor ,bottom: containerView.bottomAnchor, topConstant: 2, bottomConstant: -2)
        PizzaPlaceNameLabel.anchorXAxis(leading: containerView.leadingAnchor,  leadingConstant: 5)
//        PizzaPlaceNameLabel.anchorWidth(equalToConstant: containerView.frame.width / 2)
    }
    private func anchorPizzaPlaceRatingLabel() {
        containerView.addSubview(PizzaPlaceRatingLabel)
        PizzaPlaceRatingLabel.anchorYAxis(top: PizzaPlaceNameLabel.topAnchor, bottom: containerView.bottomAnchor, topConstant: 2, bottomConstant: -2)
        PizzaPlaceRatingLabel.anchorXAxis(trailing: trailingAnchor,trailingConstant: -5)
        
    }
    
    func populateCell(pizzaPlaceName: String, pizzaPlaceRating: String) {
        PizzaPlaceNameLabel.text = pizzaPlaceName
        PizzaPlaceRatingLabel.text = pizzaPlaceRating
        
    }
    
    
}
