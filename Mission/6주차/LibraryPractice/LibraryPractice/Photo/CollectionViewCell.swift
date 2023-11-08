//
//  CollectionViewCell.swift
//  LibraryPractice
//
//  Created by 임수진 on 2023/11/08.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageView.clipsToBounds = true
    }

}
