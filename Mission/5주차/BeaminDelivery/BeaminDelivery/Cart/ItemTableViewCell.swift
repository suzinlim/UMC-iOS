//
//  ItemTableViewCell.swift
//  BeaminDelivery
//
//  Created by 임수진 on 2023/11/01.
//

import UIKit

class ItemTableViewCell: UITableViewCell {
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var itemPrice: UILabel!
    @IBOutlet weak var checkbox: UIButton!
    @IBAction func checkboxTapped(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected

            if sender.isSelected {
                // 선택된 경우 체크박스 이미지 설정
                if let checkedImage = UIImage(named: "checked") {
                    checkbox.setImage(checkedImage, for: .normal)
                }
            } else {
                // 선택이 해제된 경우 체크박스 이미지 설정
                if let uncheckedImage = UIImage(named: "isnotchecked") {
                    checkbox.setImage(uncheckedImage, for: .normal)
                }
            }

            checkbox.tintColor = .white // 클릭 시 변경될 배경색
    }
    func configure(withItem item: ItemInfo) {
            itemName.text = item.name
            itemPrice.text = item.price
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
