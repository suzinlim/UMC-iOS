//
//  HomeViewController.swift
//  carrotMarket
//
//  Created by 임수진 on 2023/10/02.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var writeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        writeButton.layer.cornerRadius = 20
        tableView.delegate = self
        tableView.dataSource = self
        
        let ItemNib = UINib(nibName: "ItemTableViewCell", bundle: nil)
        tableView.register(ItemNib, forCellReuseIdentifier: "ItemTableViewCell")
    }

}

extension HomeViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ItemTableViewCell", for: indexPath) as? ItemTableViewCell
        else {
            return UITableViewCell()
        }
        
        switch indexPath.row {
        case 0:
            cell.titleLabel.text = "[급구] 50만원 제공! 쿵야 레스토랑\n에서 시식 알바 구함니다.^^. -🧅"
            cell.categotyLabel.text = "당근알바 · 이벤트"
            cell.costLabel.isHidden = true
            cell.chatButton.isHidden = true
            cell.heartButton.isHidden = true
            cell.ItemImage.image = UIImage(named: "image1")
        case 1:
            cell.titleLabel.text = "에어팟맥스실버"
            cell.categotyLabel.text = "서울특별시 양천구 · 6일 전"
            cell.costLabel.text = "370,000원"
            cell.chatButton.setTitle("5", for: .normal)
            cell.heartButton.setTitle("23", for: .normal)
            cell.ItemImage.image = UIImage(named: "image2")
        case 2:
            cell.titleLabel.text = "에어팟 맥스 스페이스그레이 S급\n판매합니다."
            cell.categotyLabel.text = "서울특별시 양천구 · 3시간 전"
            cell.costLabel.text = "490,000원"
            cell.chatButton.setTitle("1", for: .normal)
            cell.heartButton.setTitle("4", for: .normal)
            cell.ItemImage.image = UIImage(named: "image3")
        case 3:
            cell.titleLabel.text = "[S급] 에어팟 맥스 스페이스 그레이\n풀박 판매합니다."
            cell.categotyLabel.text = "서울특별시 양천구 · 1일 전"
            cell.costLabel.text = "550,000원"
            cell.chatButton.setTitle("1", for: .normal)
            cell.heartButton.setTitle("7", for: .normal)
            cell.ItemImage.image = UIImage(named: "image4")
        case 4:
            cell.titleLabel.text = "보일러 온돌(배관)"
            cell.categotyLabel.text = "광고"
            cell.ItemImage.image = UIImage(named: "image4")
        default:
            break
        }
        
        return cell
    }
    
    
}
