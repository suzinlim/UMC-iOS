//
//  SecondAppMainViewController.swift
//  PracticeUIKit01
//
//  Created by 임수진 on 2023/09/20.
//

import UIKit

class SecondAppMainViewController: UIViewController {
    
    let diceimageNameData = ["one", "two", "three", "four", "five", "six"]
    
    lazy var diceImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "one"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var changeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("주사위를 굴려보세요", for: .normal)
        button.backgroundColor = .purple
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        view.addSubview(diceImageView)
        
        diceImageView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        diceImageView.widthAnchor.constraint(equalToConstant: 300).isActive = true
        diceImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        diceImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        view.addSubview(changeButton)
        changeButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        changeButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        changeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        changeButton.topAnchor.constraint(equalTo: diceImageView.bottomAnchor, constant: 200).isActive = true
        
        changeButton.addTarget(self, action: #selector(didTabChangeDiceImageButton), for: .touchUpInside)
    }
    
    @objc func didTabChangeDiceImageButton() {
        diceImageView.image = UIImage(named: diceimageNameData.randomElement() ?? "one")
    }
   
}
