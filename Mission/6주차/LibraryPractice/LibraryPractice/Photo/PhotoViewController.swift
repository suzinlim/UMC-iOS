//
//  PhotoViewController.swift
//  LibraryPractice
//
//  Created by 임수진 on 2023/11/08.
//

import UIKit
import Lottie
import ViewAnimator

class PhotoViewController: UIViewController {
    @IBOutlet var collectionView: UICollectionView!
    
    @IBAction func backButton(_ sender: Any) {
        let MainViewController = self.storyboard?.instantiateViewController(withIdentifier: "MainViewController")
        MainViewController?.modalPresentationStyle = .fullScreen
        MainViewController?.modalTransitionStyle = .crossDissolve
        self.present(MainViewController!, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.delegate = self
        collectionView.dataSource = self
        
        let flowLayout = UICollectionViewFlowLayout()
        let numberOfItemsPerRow: CGFloat = 4
        let spacingBetweenItems: CGFloat = 1  // 아이템 사이 간격
        let itemWidth = (collectionView.bounds.width - (numberOfItemsPerRow - 1) * spacingBetweenItems) / numberOfItemsPerRow
        flowLayout.itemSize = CGSize(width: itemWidth, height: itemWidth)
        flowLayout.minimumLineSpacing = 1
        flowLayout.minimumInteritemSpacing = 1
                
        collectionView.collectionViewLayout = flowLayout
        collectionView.reloadData()
    }
}


extension PhotoViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 50
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        cell.imageView.image = UIImage(named: "mymelody")
        
        let animation = AnimationType.from(direction: .bottom, offset: 30.0)
        cell.animate(animations: [animation], delay: 0.5)
        return cell
        
    }
}
