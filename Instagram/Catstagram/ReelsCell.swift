//
//  ReelsCell.swift
//  Catstagram
//
//  Created by 임수진 on 2023/12/18.
//

import UIKit
import SnapKit
import AVKit

class ReelsCell: UICollectionViewCell {
    static let identifier = "ReelsCell"
    
    var videoView: VideoPlayerView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setupURL(_ urlStr: String) {
        self.videoView = VideoPlayerView(frame: .zero, urlStr: urlStr) // 객체 전달
        setupAttribute()
        setupLayout()
    }
    
    private func setupAttribute() {
        
    }
    
    private func setupLayout() {
        guard let videoView = videoView else { return } // videoView가 있다면 아래 코드 실행
        contentView.addSubview(videoView)
        
        videoView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
