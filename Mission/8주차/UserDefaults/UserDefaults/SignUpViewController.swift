//
//  SignUpViewController.swift
//  UserDefaults
//
//  Created by 임수진 on 2023/11/22.
//

import UIKit

class SignUpViewController: UIViewController {
    // MARK: - Properties
    var id: String = ""
    var password: String = ""
    
    @IBOutlet weak var submitButton: UIButton!
    // Textfields
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        submitButton.layer.cornerRadius = 5
    }
    
    // MARK: - Actions
    @IBAction func saveUserDefaults(_ sender: Any) {
        // 객체 생성
        let defaults = UserDefaults.standard
        // 사용자 정보 저장
        guard let id = idTextField.text, let password = passwordTextField.text else {
                    return
                }
        defaults.set(id, forKey: "userId")
        defaults.set(password, forKey: "userPassword")
        print("Save")
        
        // 이전 화면 복귀
        self.dismiss(animated:true)
    }
    
    
}
