//
//  LoginViewController.swift
//  UserDefaults
//
//  Created by 임수진 on 2023/11/22.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var checkLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signupButton: UIButton!
    
    var isLoggedIn: Bool = false // 로그인 상태를 추적하는 변수
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.layer.cornerRadius = 5
        signupButton.layer.cornerRadius = 5
        // 앱이 실행될 때, 로그인 상태에 따라 UI 업데이트
        updateUIForLoginStatus()
    }
    
    // 회원가입 버튼 숨기기
    func hideSignupButton() {
        signupButton.isHidden = true
    }
    
    // 로그인 상태에 따라 UI 업데이트
    func updateUIForLoginStatus() {
        if isLoggedIn {
            hideSignupButton()
            loginButton.setTitle("로그아웃", for: .normal)
            checkLabel.text = ""
        } else {
            signupButton.isHidden = false
            loginButton.setTitle("로그인", for: .normal)
            checkLabel.text = ""
        }
    }
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        guard let inputID = idTextField.text, let inputPassword = passwordTextField.text else {
            return
        }
        
        let savedID = UserDefaults.standard.string(forKey: "userId")
        let savedPassword = UserDefaults.standard.string(forKey: "userPassword")
        
        if inputID == savedID {
            if inputPassword == savedPassword {
                isLoggedIn.toggle()
                updateUIForLoginStatus()
                checkLabel.text = "\(savedID!)님 환영합니다."
            } else {
                checkLabel.text = "비밀번호를 확인하세요."
            }
        } else {
            checkLabel.text = "존재하지 않는 아이디입니다."
        }
    }
    
    @IBAction func signupButtonTapped(_ sender: Any) {
        let SignUpVC = self.storyboard?.instantiateViewController(withIdentifier: "SignUpVC")
        SignUpVC?.modalPresentationStyle = .fullScreen // 전체화면으로 보이게 설정
        SignUpVC?.modalTransitionStyle = .crossDissolve // 전환 애니메이션 설정

        self.present(SignUpVC!, animated: true, completion: nil)
    }
}
