//
//  PostCollectionViewCell.swift
//  Catstagram
//
//  Created by 임수진 on 2023/11/10.
//

import UIKit
import Kingfisher

class PostCollectionViewCell: UICollectionViewCell {
    static let identifier = "PostCollectionViewCell"
    
    @IBOutlet weak var postImageView: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    public func setupData(_ imageURLStr: String?) { // 파라미터로 데이터를 받음
        // 이미지뷰의 이미지를 업로드한다.
        
        guard let imageURLStr = imageURLStr else { return } // 옵셔널 해제
        if let url = URL(string: imageURLStr) { // 타입 변환
            postImageView.kf.setImage(
                with: url,
                placeholder: UIImage(systemName: "photo"))
        }
    }

}
