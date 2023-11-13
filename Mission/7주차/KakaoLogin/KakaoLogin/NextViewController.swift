//
//  NextViewController.swift
//  KakaoLogin
//
//  Created by 임수진 on 2023/11/13.
//

import UIKit
import KakaoSDKUser

class NextViewController: UIViewController {
    @IBOutlet weak var nicknameLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    
    var nickname: String?
    var profileImage: URL?
    
    @IBAction func logoutClicked(_ sender: Any) {
        // 로그아웃 (API 요청의 성공 여부와 관계없이 토큰을 삭제 처리)
        UserApi.shared.logout {(error) in
            if let error = error {
                print(error)
            }
            else {
                print("logout() success.")

                // 로그아웃 시, 로그인 화면으로 이동
                self.navigationController?.popViewController(animated: true)
            }
        }
    }
    @IBAction func unlinkClicked(_ sender: Any) {
        // 연결 끊기 (연결이 끊어지면 기존의 토큰은 더 이상 사용할 수 없으므로, 연결 끊기 API 요청 성공 시 로그아웃 처리가 함께 이뤄져 토큰 삭제)
        UserApi.shared.unlink {(error) in
            if let error = error {
                print(error)
            }
            else {
                print("unlink() success.")

                // 연결 끊으면 로그인 화면으로 이동
                self.navigationController?.popViewController(animated: true)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
}

extension NextViewController {
    private func setUI() {
        // 사용자 정보 화면에 나타내기
        // 1. 닉네임
        if let nickname = nickname {
            nicknameLabel.text = "\(nickname)님 환영합니다."
        }
        
        // 2. 프로필 이미지
        if let profileImageURL = profileImage {
            // 이미지를 비동기적으로 가져와서 표시
            URLSession.shared.dataTask(with: profileImageURL) { data, response, error in
                if let error = error {
                    print("Error fetching profile image:", error)
                    return
                }

                if let data = data, let image = UIImage(data: data) {
                    // UI 업데이트는 메인 큐에서 수행
                    DispatchQueue.main.async {
                        self.profileImageView.image = image
                    }
                }
            }.resume()
        }
    }
}
