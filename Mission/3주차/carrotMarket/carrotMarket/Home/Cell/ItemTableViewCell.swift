//
//  ItemTableViewCell.swift
//  carrotMarket
//
//  Created by 임수진 on 2023/10/02.
//

import UIKit

class ItemTableViewCell: UITableViewCell {
    
    @IBOutlet weak var categotyLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var costLabel: UILabel!
    @IBOutlet weak var chatButton: UIButton!
    @IBOutlet weak var heartButton: UIButton!
    @IBOutlet weak var ItemImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
