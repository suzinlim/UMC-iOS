//
//  SortedItemCollectionViewCell.swift
//  carrotMarket
//
//  Created by 임수진 on 2023/10/19.
//

import UIKit

class SortedItemCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var sortedImage: UIImageView!
    @IBOutlet weak var sortedItemTitle: UILabel!
    @IBOutlet weak var sortedItemCost: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
