//
//  MainViewController.swift
//  LibraryPractice
//
//  Created by 임수진 on 2023/11/08.
//

import UIKit
import Lottie

class MainViewController: UIViewController, UIViewControllerTransitioningDelegate {
    @IBAction func gotoHome(_ sender: Any) {
        let PhotoViewController = self.storyboard?.instantiateViewController(withIdentifier: "PhotoViewController")
        PhotoViewController?.modalPresentationStyle = .fullScreen // 전체화면으로 보이게 설정
        PhotoViewController?.modalTransitionStyle = .crossDissolve // 전환 애니메이션 설정

        self.present(PhotoViewController!, animated: true, completion: nil)
    }
    @IBOutlet weak var titleView: UIView!
    func setAnimation() {
        let animationView = LottieAnimationView(name: "welcome")
        animationView.frame = titleView.bounds
        animationView.contentMode = .scaleAspectFit
        titleView.addSubview(animationView)
        
        animationView.play()
        animationView.loopMode = .loop
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(titleView)
        setAnimation()

    }
}



