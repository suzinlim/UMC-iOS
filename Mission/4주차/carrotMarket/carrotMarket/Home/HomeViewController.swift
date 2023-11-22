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
    
    let titleLabel = ["[급구] 50만원 제공! 쿵야 레스토랑\n에서 시식 알바 구함니다.^^. -🧅", "에어팟맥스실버", "에어팟 맥스 스페이스그레이 S급\n판매합니다.", "[S급] 에어팟 맥스 스페이스 그레이\n풀박 판매합니다.", "아이폰15 프로 블랙 티타늄 256 자\n급제 미개봉", "", "다이슨 에어랩", "아이폰 12미니 128기가 화이트 풀\n박스", "단 1시간, 이 광고에서만 iPad 전\n원증정!", "클리오 킬 커버 광채 파운데이션", "미쏘 화이트 셔츠", "데이지크 섀도우팔레트 거의새거"]
    let categoryLabel = ["당근알바 · 이벤트", "서울특별시 성북구 · 6일 전", "서울특별시 성북구 · 3시간 전", "서울특별시 성북구 · 1일 전", "돈암동 · 15분 전", "", "성북구 길음동 · 10분 전", "정릉제1동 · 끌올 4분 전", "소정면 · 광고", "숭인제1동 · 15분 전", "삼선동4가 · 끌올 35분 전", "동소문동1가 · 1시간 전"]
    let costLabel = ["", "370,000원", "490,000원", "550,000원", "162만원", "", "450,000원", "270,000원", "", "10,000원", "10,000원", "22,000원"]
    let ItemImage = ["image1", "image2", "image3", "image4", "image5", "", "image6", "image7", "image8", "image9", "image10", "image11"]
    let chatButton = ["", "5", "1", "1", "", "", "3", "", "", "", "1", ""]
    let heartButton = ["", "23", "4", "7", "", "", "25", "5", "", "1", "13", ""]
    
    let sortedImage = ["cimage1", "cimage2", "cimage3", "cimage4", "cimage5", "cimage6", "cimage7", "cimage8"]
    let sortedItemTitle = ["키친플라워\nDW1201CP 얼", "국산 실리콘 얼음틀 팝니다", "실리콘 얼음틀 외", "실리콘 얼음틀", "아이스크림 틀/실리톤 몰드/얼음틀", "커피콩 모양 실리콘 얼음들", "실리콘 얼음틀 40구 215*140*30", "얼음 트레이 소 (얼\n음판)/개당 판매"]
    let sortedItemCost = ["62,000원", "5,000원", "10,000원", "3,000원", "4,000원", "5,000원", "4,000원", "1,000원"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        writeButton.layer.cornerRadius = 20
        writeButton.layer.shadowOffset = CGSize(width: 0, height: 2) // 그림자의 위치 조절
        writeButton.layer.shadowOpacity = 0.2 // 그림자의 투명도
        writeButton.layer.shadowRadius = 4 // 그림자의 블러 효과 크기
        tableView.delegate = self
        tableView.dataSource = self
        
        let ItemNib = UINib(nibName: "ItemTableViewCell", bundle: nil)
        tableView.register(ItemNib, forCellReuseIdentifier: "ItemTableViewCell")
        
        let SortedItemNib = UINib(nibName: "SortedItemTableViewCell", bundle: nil)
        tableView.register(SortedItemNib, forCellReuseIdentifier: "SortedItemTableViewCell")
    }

}

extension HomeViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleLabel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 5 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "SortedItemTableViewCell", for: indexPath) as? SortedItemTableViewCell
            else {
                return UITableViewCell()
            }
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ItemTableViewCell", for: indexPath) as? ItemTableViewCell
            else {
                return UITableViewCell()
            }
            cell.titleLabel.text = titleLabel[indexPath.row]
            cell.categoryLabel.text = categoryLabel[indexPath.row]
            cell.costLabel.text = costLabel[indexPath.row]
            cell.ItemImage.image = UIImage(named: ItemImage[indexPath.row])
            cell.ItemImage.layer.cornerRadius = 10 // 이미지 뷰의 모서리를 둥글게 만들기
            cell.ItemImage.layer.masksToBounds = true
            cell.chatButton.setTitle(chatButton[indexPath.row], for: .normal)
            cell.heartButton.setTitle(heartButton[indexPath.row], for: .normal)
            
            switch indexPath.row {
            case 0:
                cell.costLabel.isHidden = true
                cell.chatButton.isHidden = true
                cell.heartButton.isHidden = true
            case 4:
                cell.chatButton.isHidden = true
                cell.heartButton.isHidden = true
            case 7:
                cell.chatButton.isHidden = true
                cell.costLabel.isHidden = false
                cell.heartButton.isHidden = false
            case 8:
                cell.chatButton.isHidden = true
                cell.heartButton.isHidden = true
            case 9:
                cell.chatButton.isHidden = true
            case 11:
                cell.chatButton.isHidden = true
                cell.heartButton.isHidden = true
            default:
                break
            }
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 5 {
            return 300
        } else {
            return 150
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let tableViewCell = cell as? SortedItemTableViewCell else {
            return
        }
        tableViewCell.setCellectionViewDataSourceDelegate(dataSourceDelegate: self, forRow: indexPath.row)
    }
}

extension HomeViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    // 컬렉션 뷰의 item 개수
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SortedItemCollectionViewCell", for: indexPath) as? SortedItemCollectionViewCell
        else {
            return UICollectionViewCell()
        }
        // 컬렉션 뷰의 각 셀에 적용
        cell.sortedImage?.image = UIImage(named: sortedImage[indexPath.row])
        cell.sortedItemTitle?.text = sortedItemTitle[indexPath.row]
        cell.sortedItemCost?.text = sortedItemCost[indexPath.row]
        return cell
    }
    // 컬렉션 뷰의 사이즈
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 240)
    }
}
