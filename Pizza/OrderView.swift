//
//  OrderView.swift
//  Pizza
//
//  Created by Mohamed Shaikhon on 11/28/20.
//

import UIKit
import DLRadioButton

class PizzaOrderView: UIView {
    var pizzaOrderPizzaCost = 0
    var pizzaOrderDrinkCost = 0
    var vc: PizzaOrderVC?
    private lazy var pizzaPlaceImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.enableAutoLayout()
        imageView.contentMode = .scaleToFill
        imageView.image = #imageLiteral(resourceName: "pizza4")
        return imageView
    }()
    
    private lazy var pizzaPlaceNameLabel: UILabel = {
        let label = UILabel()
        label.enableAutoLayout()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.numberOfLines = 0
        label.sizeToFit()
        //        label.text = "capXX: cap the photo with a width or height of XX. (whichever is larger). Scales they"
        return label
    }()
    private lazy var pizzaSizeLabel: UILabel = {
        let label = UILabel()
        label.enableAutoLayout()
        label.text = "Size"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.numberOfLines = 0
        label.sizeToFit()
        //        label.text = "capXX: cap the photo with a width or height of XX. (whichever is larger). Scales they"
        return label
    }()
    private lazy var drinkLabel: UILabel = {
        let label = UILabel()
        label.enableAutoLayout()
        label.text = "Drink"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.numberOfLines = 0
        label.sizeToFit()
        //        label.text = "capXX: cap the photo with a width or height of XX. (whichever is larger). Scales they"
        return label
    }()
    
    private lazy var checkoutButton: UIButton = {
        let btn = UIButton()
        btn.enableAutoLayout()
        btn.backgroundColor = #colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1)
        btn.setTitle("Checkout", for: .normal)
        btn.titleLabel?.textColor = .white
        btn.addTarget(self, action: #selector(checkoutTapped), for: .touchUpInside)

        //        label.text = "capXX: cap the photo with a width or height of XX. (whichever is larger). Scales they"
        return btn
    }()
    private lazy var largeBtn: DLRadioButton = {
        let btn = createRadioButton(title: PizzaSize.large.rawValue, color: #colorLiteral(red: 0.2387817211, green: 0.4137153402, blue: 0.1239768465, alpha: 1))
        btn.enableAutoLayout()
        btn.otherButtons.append(mediumBtn)
        btn.otherButtons.append(smallBtn)
        //        label.text = "capXX: cap the photo with a width or height of XX. (whichever is larger). Scales they"
        return btn
    }()
    private lazy var mediumBtn: DLRadioButton = {
        let btn = createRadioButton(title: PizzaSize.medium.rawValue, color: #colorLiteral(red: 0.2387817211, green: 0.4137153402, blue: 0.1239768465, alpha: 1))
        btn.enableAutoLayout()
        //        label.text = "capXX: cap the photo with a width or height of XX. (whichever is larger). Scales they"
        return btn
    }()
    private lazy var smallBtn: DLRadioButton = {
        let btn = createRadioButton(title: PizzaSize.small.rawValue, color: #colorLiteral(red: 0.2387817211, green: 0.4137153402, blue: 0.1239768465, alpha: 1))
        btn.enableAutoLayout()
        //        label.text = "capXX: cap the photo with a width or height of XX. (whichever is larger). Scales they"
        return btn
    }()
    private lazy var cokeBtn: DLRadioButton = {
        let btn = createRadioButton(title: Drink.cocaCola.rawValue, color: #colorLiteral(red: 0.2387817211, green: 0.4137153402, blue: 0.1239768465, alpha: 1))
        btn.otherButtons.append(pepsiBtn)
        btn.otherButtons.append(waterBtn)
        btn.enableAutoLayout()
        //        label.text = "capXX: cap the photo with a width or height of XX. (whichever is larger). Scales they"
        return btn
    }()
    private lazy var pepsiBtn: DLRadioButton = {
        let btn = createRadioButton(title: Drink.pepsi.rawValue, color: #colorLiteral(red: 0.2387817211, green: 0.4137153402, blue: 0.1239768465, alpha: 1))
        btn.enableAutoLayout()
        //        label.text = "capXX: cap the photo with a width or height of XX. (whichever is larger). Scales they"
        return btn
    }()
    private lazy var waterBtn: DLRadioButton = {
        let btn = createRadioButton(title: Drink.water.rawValue, color: #colorLiteral(red: 0.2387817211, green: 0.4137153402, blue: 0.1239768465, alpha: 1))
        btn.enableAutoLayout()
        //        label.text = "capXX: cap the photo with a width or height of XX. (whichever is larger). Scales they"
        return btn
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(pizzaPlaceImageView)
        addSubview(pizzaSizeLabel)
        addSubview(pizzaPlaceNameLabel)
        addSubview(largeBtn)
        addSubview(mediumBtn)
        addSubview(smallBtn)
        addSubview(drinkLabel)
        addSubview(cokeBtn)
        addSubview(waterBtn)
        addSubview(pepsiBtn)
        addSubview(checkoutButton)
        pizzaPlaceImageView.anchorXAxis(leading: leadingAnchor, trailing: trailingAnchor, leadingConstant: 0, trailingConstant: 0)
        pizzaPlaceImageView.anchorYAxis(top: topAnchor, topConstant: 0, bottomConstant: 0)
        pizzaPlaceImageView.anchorHeight(height: heightAnchor, multiplier: 0.2, constant: 0)
        
        pizzaSizeLabel.anchorYAxis(top: pizzaPlaceImageView.bottomAnchor, topConstant: 30, bottomConstant: 0)
        pizzaSizeLabel.anchorXAxis(leading: leadingAnchor, leadingConstant: 15, trailingConstant: 0)
        
        largeBtn.anchorYAxis(top: pizzaSizeLabel.bottomAnchor, topConstant: 15, bottomConstant: 0)
        largeBtn.anchorXAxis(leading: pizzaSizeLabel.leadingAnchor,trailing: trailingAnchor, leadingConstant: 0, trailingConstant: 0)
        largeBtn.anchorHeight(equalToConstant: 17)
        largeBtn.addTarget(self, action: #selector(largeBtnSelected), for: UIControl.Event.touchUpInside);
        
        mediumBtn.anchorYAxis(top: largeBtn.bottomAnchor, topConstant: 5, bottomConstant: 0)
        mediumBtn.anchorXAxis(leading: pizzaSizeLabel.leadingAnchor,trailing: trailingAnchor, leadingConstant: 0, trailingConstant: 0)
        mediumBtn.anchorHeight(equalToConstant: 17)
        mediumBtn.addTarget(self, action: #selector(mediumBtnSelected), for: UIControl.Event.touchUpInside);
        
        
        smallBtn.anchorYAxis(top: mediumBtn.bottomAnchor, topConstant: 5, bottomConstant: 0)
        smallBtn.anchorXAxis(leading: pizzaSizeLabel.leadingAnchor,trailing: trailingAnchor, leadingConstant: 0, trailingConstant: 0)
        smallBtn.anchorHeight(equalToConstant: 17)
        smallBtn.addTarget(self, action: #selector(smallBtnSelected), for: UIControl.Event.touchUpInside);
        
        
        
        drinkLabel.anchorYAxis(top: smallBtn.bottomAnchor, topConstant: 30, bottomConstant: 0)
        drinkLabel.anchorXAxis(leading: leadingAnchor, leadingConstant: 15, trailingConstant: 0)
        
        
        cokeBtn.anchorYAxis(top: drinkLabel.bottomAnchor, topConstant: 5, bottomConstant: 0)
        cokeBtn.anchorXAxis(leading: pizzaSizeLabel.leadingAnchor,trailing: trailingAnchor, leadingConstant: 0, trailingConstant: 0)
        cokeBtn.anchorHeight(equalToConstant: 17)
        cokeBtn.addTarget(self, action: #selector(cokeBtnSelected), for: UIControl.Event.touchUpInside);
        
        
        pepsiBtn.anchorYAxis(top: cokeBtn.bottomAnchor, topConstant: 5, bottomConstant: 0)
        pepsiBtn.anchorXAxis(leading: pizzaSizeLabel.leadingAnchor,trailing: trailingAnchor, leadingConstant: 0, trailingConstant: 0)
        pepsiBtn.anchorHeight(equalToConstant: 17)
        pepsiBtn.addTarget(self, action: #selector(pepsiBtnSelected), for: UIControl.Event.touchUpInside);
        
        
        waterBtn.anchorYAxis(top: pepsiBtn.bottomAnchor, topConstant: 5, bottomConstant: 0)
        waterBtn.anchorXAxis(leading: pizzaSizeLabel.leadingAnchor,trailing: trailingAnchor, leadingConstant: 0, trailingConstant: 0)
        waterBtn.anchorHeight(equalToConstant: 17)
        waterBtn.addTarget(self, action: #selector(waterBtnSelected), for: UIControl.Event.touchUpInside);
        
        
        checkoutButton.anchorYAxis( bottom: bottomAnchor, topConstant: 0, bottomConstant: -60)
        checkoutButton.anchorCenter(horizontal: centerXAnchor, xConstant: 0, yConstant: 0)
        checkoutButton.anchorHeight(equalToConstant: 50)
        checkoutButton.anchorWidth(width: widthAnchor, multiplier: 0.7, constant: 0)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createRadioButton(title : String, color : UIColor) -> DLRadioButton {
        let radioButton = DLRadioButton()
        radioButton.titleLabel!.font = UIFont.systemFont(ofSize: 14);
        radioButton.setTitle(title, for: []);
        radioButton.setTitleColor(color, for: []);
        radioButton.iconColor = color;
        radioButton.indicatorColor = color;
        radioButton.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left;
        self.addSubview(radioButton);
        
        return radioButton;
    }
    @objc private func largeBtnSelected(radioButton : DLRadioButton) {
        pizzaOrderPizzaCost = 20
        print(String(format: "%@ is selected.\n", radioButton.selected()!.titleLabel!.text!));
        
    }
    @objc private func mediumBtnSelected(radioButton : DLRadioButton) {
        pizzaOrderPizzaCost = 15
        
        print(String(format: "%@ is selected.\n", radioButton.selected()!.titleLabel!.text!));
        
    }
    @objc private func smallBtnSelected(radioButton : DLRadioButton) {
        pizzaOrderPizzaCost = 10
        
        print(String(format: "%@ is selected.\n", radioButton.selected()!.titleLabel!.text!));
        
    }
    @objc private func cokeBtnSelected(radioButton : DLRadioButton) {
        pizzaOrderDrinkCost = 3
        
        print(String(format: "%@ is selected.\n", radioButton.selected()!.titleLabel!.text!));
        
    }
    @objc private func pepsiBtnSelected(radioButton : DLRadioButton) {
        pizzaOrderDrinkCost = 3
        
        print(String(format: "%@ is selected.\n", radioButton.selected()!.titleLabel!.text!));
        
    }
    @objc private func waterBtnSelected(radioButton : DLRadioButton) {
        pizzaOrderDrinkCost = 1
        print(String(format: "%@ is selected.\n", radioButton.selected()!.titleLabel!.text!));
        
    }
    @objc func checkoutTapped(sender: UIButton!){
        vc?.orderTotalCost = pizzaOrderPizzaCost + pizzaOrderDrinkCost
    }
}
