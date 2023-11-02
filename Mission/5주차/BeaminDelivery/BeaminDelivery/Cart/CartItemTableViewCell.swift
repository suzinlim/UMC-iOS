//
//  CartItemTableViewCell.swift
//  BeaminDelivery
//
//  Created by 임수진 on 2023/11/02.
//

import UIKit

protocol InquiryCartViewControllerDelegate: AnyObject {
    func setPriceInfo(price: String, priceDetail: String)
}

class CartItemTableViewCell: UITableViewCell {
    weak var delegate: InquiryCartViewControllerDelegate?
    
    @IBOutlet weak var itemCount: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    @IBAction func stepperPressed(_ sender: UIStepper) {
        itemCount.text = Int(sender.value).description
    }
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var priceDetail: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var optionButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        itemImage.layer.borderWidth = 2
        itemImage.layer.borderColor = UIColor.systemGray5.cgColor
        itemImage.layer.cornerRadius = 10
        optionButton.layer.borderWidth = 2
        optionButton.layer.borderColor = UIColor.systemGray5.cgColor
        optionButton.layer.cornerRadius = 5

        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
