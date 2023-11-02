//
//  CartViewController.swift
//  BeaminDelivery
//
//  Created by 임수진 on 2023/10/27.
//

import UIKit

protocol DataTransferDelegate: AnyObject {
    func transferData(price: String, selectedItem: String)
}

class CartViewController: UIViewController, DataTransferDelegate {
    func transferData(price: String, selectedItem: String) {
        print("선택된 항목: \(selectedItem)")
        print("가격: \(price)")
    }
    
    @IBOutlet weak var cartButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    var cartViewController: CartViewController?
    
    var categories: [Category] = [doughCategory, toppingCategory, sourceCategory, beverageCategory]
    var selectedPrice: String = ""
    var selectedItem: String = ""
    weak var delegate: DataTransferDelegate?
    
    @IBAction func InquiryCartButtonDidTap(_ sender: UIButton) {
        // CostTableViewCell 클래스의 cellData를 업데이트
        if let indexPath = tableView.indexPathForSelectedRow,
           let cell = tableView.cellForRow(at: indexPath) as? CostTableViewCell {
            selectedPrice = cell.cellData.price
            selectedItem = cell.cellData.selectedItem
        }

        // Delegate를 통해 데이터 전달
        delegate?.transferData(price: selectedPrice, selectedItem: selectedItem)

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let inquiryCartView = storyboard.instantiateViewController(withIdentifier: "InquiryCartViewController")
            as? InquiryCartViewController {
            // 데이터 전달
            inquiryCartView.setCartItemData(price: selectedPrice, selectedItem: selectedItem)
            // 데이터 설정 메서드 호출 로그
            print("setCartItemData method called with price: \(selectedPrice), selectedItem: \(selectedItem)")
            // 화면 전환
            navigationController?.pushViewController(inquiryCartView, animated: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cartButton.layer.cornerRadius = 4
        cartViewController = self
        
        if let navigationController = self.navigationController {
            navigationController.navigationBar.barTintColor = UIColor.red
            navigationController.navigationBar.setBackgroundImage(UIImage(), for: .default)
            navigationController.navigationBar.shadowImage = UIImage()
            navigationController.navigationBar.isTranslucent = true
        }
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        let MainImgNib = UINib(nibName: "MainImageViewCell", bundle: nil)
        tableView.register(MainImgNib, forCellReuseIdentifier: "MainImageViewCell")
        let TitleNib = UINib(nibName: "TitleTableViewCell", bundle: nil)
        tableView.register(TitleNib, forCellReuseIdentifier: "TitleTableViewCell")
        let CostNib = UINib(nibName: "CostTableViewCell", bundle: nil)
        tableView.register(CostNib, forCellReuseIdentifier: "CostTableViewCell")
        let Categorynib = UINib(nibName: "CategoryTableViewCell", bundle: nil)
        tableView.register(Categorynib, forCellReuseIdentifier: "CategoryTableViewCell")
        let Countnib = UINib(nibName: "TotalTableViewCell", bundle: nil)
        tableView.register(Countnib, forCellReuseIdentifier: "TotalTableViewCell")
    }


}

extension CartViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            // 첫 번째 행에 대한 처리
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "MainImageViewCell", for: indexPath) as? MainImageViewCell else {
                return UITableViewCell()
            }
            // 셀의 설정
            return cell
        } else if indexPath.row == 1 {
            // 두 번째 행에 대한 처리
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "TitleTableViewCell", for: indexPath) as? TitleTableViewCell else {
                return UITableViewCell()
            }
            // 셀의 설정
            return cell
        } else if indexPath.row == 3 {
            // 세 번째 행에 대한 처리
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "CostTableViewCell", for: indexPath) as? CostTableViewCell
            else {
                return UITableViewCell()
            }
            // CostTableViewCell의 cartViewController 설정
            cell.cartViewController = self
            return cell
        } else if indexPath.row == 5 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryTableViewCell", for: indexPath) as! CategoryTableViewCell
            // CategoryTableViewCell에 데이터 설정
            cell.configure(withCategory: categories[0]) // categories 배열의 첫 번째 항목 - 도우
            return cell
        } else if indexPath.row == 7 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryTableViewCell", for: indexPath) as! CategoryTableViewCell
            // CategoryTableViewCell에 데이터 설정
            cell.configure(withCategory: categories[1]) // categories 배열의 두 번째 항목 - 토핑
            return cell
        } else if indexPath.row == 9 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryTableViewCell", for: indexPath) as! CategoryTableViewCell
            // CategoryTableViewCell에 데이터 설정
            cell.configure(withCategory: categories[2]) // categories 배열의 두 번째 항목 - 음료
            return cell
        } else if indexPath.row == 11 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TotalTableViewCell", for: indexPath) as! TotalTableViewCell
            return cell
        } else {
            // 여백 셀 행
            let cell = UITableViewCell()
            cell.backgroundColor = UIColor.systemGray6
            return cell
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 240
        } else if indexPath.row == 1 {
            return 170
        } else if indexPath.row == 3 {
            return 200
        } else if indexPath.row == 5 {
            return 550
        } else if indexPath.row == 7 {
            return 2150
        } else if indexPath.row == 9 {
            return 670
        } else if indexPath.row == 11 {
            return 80
        } else {
            return 12
        }
    }
    
}
