//
//  ViewController.swift
//  studyMission
//
//  Created by 임수진 on 2023/09/20.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBAction func CartButtonDidTap(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(identifier: "CartVC")
        vc?.modalPresentationStyle = .fullScreen
        self.present(vc!, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.searchBar.searchBarStyle = .minimal
        self.searchBar.searchTextField.backgroundColor = UIColor.white
        self.searchBar.layer.cornerRadius = 0
        self.searchBar.clipsToBounds = true
        self.navigationItem.rightBarButtonItem?.tintColor = UIColor.red
//        self.topView.clipsToBounds = true
//        self.topView.layer.cornerRadius = 15
//        self.topView.layer.masksToBounds = true
        
    }
}

