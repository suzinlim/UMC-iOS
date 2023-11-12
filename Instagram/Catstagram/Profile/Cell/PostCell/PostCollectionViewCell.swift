//
//  PostCollectionViewCell.swift
//  Catstagram
//
//  Created by 임수진 on 2023/11/10.
//

import UIKit

class PostCollectionViewCell: UICollectionViewCell {
    static let identifier = "PostCollectionViewCell"
    
    @IBOutlet weak var postImageView: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    public func setupData() {
        // 이미지뷰의 이미지를 업로드한다.
    }

}
