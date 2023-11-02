//
//  InquiryCartViewController.swift
//  BeaminDelivery
//
//  Created by 임수진 on 2023/11/01.
//

import UIKit

class InquiryCartViewController: UIViewController {
    @IBOutlet weak var cartTableView: UITableView!

    var cartItemData: (price: String, selectedItem: String)?  // 데이터를 저장할 프로퍼티
    
    func transferData(price: String, selectedItem: String) {
        print("InquiryCartViewController - 선택된 항목: \(selectedItem)")
        print("InquiryCartViewController - 가격: \(price)")
    }


    // 데이터를 설정하는 메서드
    func setCartItemData(price: String, selectedItem: String) {
        cartItemData = (price: price, selectedItem: selectedItem)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cartTableView.delegate = self
        cartTableView.dataSource = self
        cartTableView.separatorStyle = .none
        let cartItemNib = UINib(nibName: "CartItemTableViewCell", bundle: nil)
        cartTableView.register(cartItemNib, forCellReuseIdentifier: "CartItemTableViewCell")
        
    }
}

extension InquiryCartViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CartItemTableViewCell", for: indexPath) as? CartItemTableViewCell else {
            return UITableViewCell()
            }
            // 데이터가 설정되었는지 확인하고 설정
            if let data = cartItemData {
                print("출력")
                print(data.price)
                print(data.selectedItem)
                cell.price.text = data.price
                cell.priceDetail.text = data.selectedItem
            }
            return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 240
    }
}
