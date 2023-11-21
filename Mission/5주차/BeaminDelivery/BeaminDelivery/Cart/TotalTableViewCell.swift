//
//  TotalTableViewCell.swift
//  BeaminDelivery
//
//  Created by 임수진 on 2023/11/02.
//

import UIKit

class TotalTableViewCell: UITableViewCell {
    @IBOutlet weak var totalCount: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    @IBAction func stepperPressed(_ sender: UIStepper) {
        totalCount.text = Int(sender.value).description
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
