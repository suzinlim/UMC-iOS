//
//  ProfileViewController.swift
//  Catstagram
//
//  Created by 임수진 on 2023/10/27.
//

import UIKit

class ProfileViewController: UIViewController, UIGestureRecognizerDelegate {
    // MARK: - Properties
    @IBOutlet weak var profileCollectionView: UICollectionView!
    
    var userPosts: [GetUserPosts]? {
        didSet { self.profileCollectionView.reloadData() } // 데이터 값이 변경되면 UI를 업데이트
    }
    
    var deletedIndex: Int?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        setupData()
    }
    
    // MARK: - Actions
    @objc
    func didLongPressCell(gestureRecognizer: UILongPressGestureRecognizer) { // cell을 길게 눌렀을 때
        if gestureRecognizer.state != .began { return } // 상태값을 확인하기 위함
        
        let position = gestureRecognizer.location(in: profileCollectionView) // 위치 불러오기
        
        if let indexPath = profileCollectionView?.indexPathForItem(at: position) {
            
            guard let userPosts = self.userPosts else { return }
            let cellData = userPosts[indexPath.item] // 배열에 있는 데이터를 가져옴
            self.deletedIndex = indexPath.item
            
            if let postIdx = cellData.postIdx {
                // 삭제 API를 호출
                UserFeedDataManager().deleteUserFeed(self, postIdx)
            }
        }
    }
    
    
    // MARK: - Helpers
    private func setupCollectionView() {
        // delegate 연결
        profileCollectionView.delegate = self
        profileCollectionView.dataSource = self
        
        // cell 등록
        profileCollectionView.register(
            UINib(nibName: "ProfileCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: ProfileCollectionViewCell.identifier)
        profileCollectionView.register(
            UINib(nibName: "PostCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: PostCollectionViewCell.identifier)
        
        let gesture = UILongPressGestureRecognizer( // 제스쳐 생성
            target: self, // 어디로 전달할건지 -> ProfileCollectionView
            action: #selector(didLongPressCell(gestureRecognizer:)))
        gesture.minimumPressDuration = 0.66 // 최소한 눌러야 하는 시간
        gesture.delegate = self
        gesture.delaysTouchesBegan = true
        profileCollectionView.addGestureRecognizer(gesture) // 액션 메소드를 CollectionView에 등록
    }
    
    private func setupData() {
        UserFeedDataManager().getUserFeed(self)
    }
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource
extension ProfileViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    // 섹션의 갯수
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    // Cell의 갯수
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        default: // 1번째 섹션
            return userPosts?.count ?? 0
        }
    }
    
    // cell 생성
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let section = indexPath.section
        switch section {
        case 0: // Profile
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProfileCollectionViewCell.identifier, for: indexPath) as? ProfileCollectionViewCell else {
                fatalError("셀 타입 캐스팅 실패")
            }
            return cell
        default: // Post
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PostCollectionViewCell.identifier, for: indexPath) as? PostCollectionViewCell else {
                fatalError("셀 타입 캐스팅 실패")
            }
            let itemIndex = indexPath.item
            
            if let cellData = self.userPosts {
                // 데이터가 있는 경우, cell 데이터를 전달
                cell.setupData(cellData[itemIndex].postImgUrl) // <-- 데이터 전달
            }
            return cell
            
        }

    }
}

extension ProfileViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let section = indexPath.section
        switch section {
        case 0: // Profile
            return CGSize(width: collectionView.frame.width,
                          height: CGFloat(159))
        default: // Post
            let side = CGFloat((collectionView.frame.width / 3) - (4/3))
            return CGSize(
                width: side,
                height: side)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        switch section {
        case 0:
            return CGFloat(0)
        default:
            return CGFloat(1)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        switch section {
        case 0:
            return CGFloat(0)
        default:
            return CGFloat(1)
        }
    }
}

// MARK: - API 통신 메소드
extension ProfileViewController {
    func successFeedAPI(_ result: UserFeedModel) {
        self.userPosts = result.result?.getUserPosts
    }
    
    func successDeletePostAPI(_ isSuccess: Bool) {
        guard isSuccess else { return }
        
        if let deletedIndex = self.deletedIndex {
            self.userPosts?.remove(at: deletedIndex)
        }
    }
}
