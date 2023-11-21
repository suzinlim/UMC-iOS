//
//  TitleTableViewCell.swift
//  BeaminDelivery
//
//  Created by 임수진 on 2023/10/28.
//

import UIKit

class TitleTableViewCell: UITableViewCell {
    @IBOutlet weak var foodDetail: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        foodDetail.layer.cornerRadius = 20
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
