//
//  ViewController.swift
//  studyMission
//
//  Created by 임수진 on 2023/09/20.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var searchBar: UISearchBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.searchBar.searchBarStyle = .minimal
        self.searchBar.searchTextField.backgroundColor = UIColor.white
        self.searchBar.layer.cornerRadius = 0
        self.searchBar.clipsToBounds = true
    }
}

