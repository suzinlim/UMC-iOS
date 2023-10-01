//
//  SecondViewController.swift
//  Protocol
//
//  Created by 임수진 on 2023/10/01.
//

import UIKit

// Protocol의 기능을 SecondViewController가 위임 받아 기본 ViewController의 label을 변경
// 상속과 같은 형태로 위임받기
class SecondViewController: UIViewController, ChangeLabelDelegate {
    func doChange() {
        previousViewController?.label.text = self.textField.text
    }
    
    @IBOutlet weak var textField: UITextField!
    var previousViewController : ViewController?
    
    @IBAction func buttonDismiss(_ sender: Any) {
        doChange()
        dismiss(animated: true, completion: nil) // 화면 없애기
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        previousViewController?.delegate = self // 위임 받았다는 것을 정의
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
