//
//  SortedItemTableViewCell.swift
//  carrotMarket
//
//  Created by 임수진 on 2023/10/19.
//

import UIKit

class SortedItemTableViewCell: UITableViewCell {
    @IBOutlet weak var collectionView: UICollectionView!
    
    func setCellectionViewDataSourceDelegate(dataSourceDelegate : UICollectionViewDelegate & UICollectionViewDataSource, forRow row : Int) {
        collectionView.delegate = dataSourceDelegate
        collectionView.dataSource = dataSourceDelegate
        collectionView.tag = row
        let sorteditemNib = UINib(nibName: "SortedItemCollectionViewCell", bundle: nil)
        collectionView.register(sorteditemNib, forCellWithReuseIdentifier: "SortedItemCollectionViewCell")
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        flowLayout.minimumLineSpacing = 5
        
        collectionView.collectionViewLayout = flowLayout
        collectionView.reloadData()
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
