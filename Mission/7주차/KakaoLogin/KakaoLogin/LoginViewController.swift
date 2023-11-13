//
//  LoginViewController.swift
//  KakaoLogin
//
//  Created by 임수진 on 2023/11/13.
//
import UIKit
// 필요한 모듈 추가
import KakaoSDKUser
import KakaoSDKAuth
import KakaoSDKCommon

class LoginViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func kakaoLoginButtonClicked(_ sender: Any) {
        print("loginKakaoAccount() called.")
        
        // 기본 웹 브라우저를 사용하여 로그인 진행
        UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
            if let error = error {
                print(error)
            }
            else {
                print("loginWithKakaoAccount() success.")
                
                // 로그인 성공하면 oauthToken 저장
                // _ = oauthToken
                
                self.getUserInfo()
            }
        }
        
    }
}

// MARK: - Extensions
extension LoginViewController {
    private func getUserInfo() {
        // 사용자 정보 가져오기
        UserApi.shared.me() {(user, error) in
            if let error = error {
                print(error)
            }
            else {
                print("me() success.")
                
                // 사용자 정보 가져오면 화면 전환
                let nickname = user?.kakaoAccount?.profile?.nickname
                print(user?.kakaoAccount?.profile?.nickname ?? "")
                let profileImage = user?.kakaoAccount?.profile?.profileImageUrl
                print(user?.kakaoAccount?.profile?.profileImageUrl ?? "")
                
                
                guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "NextViewController") as? NextViewController else { return }
                
                // 사용자 정보 NextViewController로 넘기기
                nextVC.nickname = nickname
                nextVC.profileImage = profileImage
                self.navigationController?.pushViewController(nextVC, animated: true)
            }
        }
    }
}
