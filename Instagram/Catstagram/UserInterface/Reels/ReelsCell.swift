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
    
    // 릴스
    let cellTitleLabel = UILabel()
    
    // 카메라
    let cameraImageView = UIImageView()
    
    // 댓글
    let commentImageView = UIImageView()
    
    // 좋아요
    // let likeImageView = UIImageView() 기존의 ImageView를 Button으로 변경
    let likeButton = UIButton(type: .custom)
    
    // 공유하기
    let shareImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLikeButton()
    }
    
    public func setupURL(_ urlStr: String) {
        self.videoView = VideoPlayerView(frame: .zero, urlStr: urlStr) // 객체 전달
        setupAttribute()
        setupLayout()
    }
    
    private func setupLikeButton() {
        // 좋아요 버튼의 이미지 설정
        likeButton.setImage(UIImage(systemName: "suit.heart"), for: .normal)
        likeButton.setImage(UIImage(systemName: "suit.heart.fill"), for: .selected)
        likeButton.imageView?.contentMode = .scaleAspectFill

        
        // 버튼의 액션 설정
        likeButton.addTarget(self, action: #selector(likeButtonTapped), for: .touchUpInside)
    }

    // 좋아요 버튼이 눌렸을 때 실행될 액션
    @objc private func likeButtonTapped() {
        // 현재 버튼의 선택 상태를 변경하여 이미지 변경
        likeButton.isSelected = !likeButton.isSelected
        
        // 버튼의 선택 상태에 따라 틴트 색상 변경
        likeButton.tintColor = likeButton.isSelected ? .red : .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupAttribute() {
        cellTitleLabel.text = "릴스"
        cellTitleLabel.font = .boldSystemFont(ofSize: 25)
        cellTitleLabel.textAlignment = .left
        cellTitleLabel.textColor = .white
        
        // 공통되는 속성은 배열로 처리
        [cameraImageView, shareImageView, commentImageView]
            .forEach {
                $0.contentMode = .scaleAspectFit
                $0.tintColor = .white
            }
        
        cameraImageView.image = UIImage(systemName: "camera")
        shareImageView.image = UIImage(systemName: "paperplane")
        commentImageView.image = UIImage(systemName: "message")
        
//        likeImageView.image = UIImage(systemName: "suit.heart")
        // 좋아요 이미지 -> 버튼 변경에 따른 설정
        likeButton.tintColor = .white
        likeButton.contentMode = .scaleAspectFill
        likeButton.contentVerticalAlignment = .fill
        likeButton.contentHorizontalAlignment = .fill

    }
    
    private func setupLayout() {
        guard let videoView = videoView else { return } // videoView가 있다면 아래 코드 실행
        contentView.addSubview(videoView)
        contentView.addSubview(likeButton)
        
        videoView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        [cellTitleLabel, cameraImageView,
        likeButton,
        commentImageView,
        shareImageView]
            .forEach { contentView.addSubview($0) }
        
        // 레이아웃 설정
        cellTitleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20) // 20만큼 상단과 떨어지게
            make.leading.equalToSuperview().offset(20) // 20만큼 좌측과 떨어지게
        }
        
        cameraImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
        
        shareImageView.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-50)
            make.trailing.trailing.equalToSuperview().offset(-20)
            make.width.height.equalTo(35)
        }
        
        let space = CGFloat(20)
        
        commentImageView.snp.makeConstraints { make in
            make.bottom.equalTo(shareImageView.snp.top).offset(-space)
            make.centerX.equalTo(shareImageView)
            make.width.height.equalTo(35)
        }
        
        likeButton.snp.makeConstraints { make in
            make.bottom.equalTo(commentImageView.snp.top).offset(-space)
            make.centerX.equalTo(shareImageView)
            make.width.height.equalTo(30)
        }
    }
}
