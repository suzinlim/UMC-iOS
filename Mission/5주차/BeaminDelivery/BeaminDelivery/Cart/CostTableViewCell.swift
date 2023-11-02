//
//  CostTableViewCell.swift
//  BeaminDelivery
//
//  Created by 임수진 on 2023/10/31.
//

import UIKit
import Foundation

struct CostCellData {
    var price: String
    var selectedItem: String
}

protocol CostTableViewCellDelegate: AnyObject {
    func didSelectRadioOption(price: String, selectedItem: String)
}

class CostTableViewCell: UITableViewCell {
    @IBOutlet weak var MsizeRadioBtn: UIButton!
    @IBOutlet weak var LsizeRadioBtn: UIButton!
    @IBOutlet weak var stackView: UIStackView!
    
    var selectedRadioButton: UIButton? // 선택된 라디오 버튼
    var cellData: CostCellData = CostCellData(price: "", selectedItem: "")
    weak var delegate: CostTableViewCellDelegate?
    weak var cartViewController: CartViewController?

    let items: [ItemInfo] = [
        ItemInfo(name: "M", price: "+20000원"),
        ItemInfo(name: "L", price: "+23000원"),
    ]

    override func awakeFromNib() {
        super.awakeFromNib()
        setRadioBtn()
    }

    func setRadioBtn() {
        MsizeRadioBtn.setImage(UIImage(named: "radioBtn"), for: .normal)
        LsizeRadioBtn.setImage(UIImage(named: "radioBtn"), for: .normal)
    }

    func configure(withText text: String) {
        // 셀의 다른 구성 요소를 설정할 수 있으며, 체크박스 이미지 설정은
        // checkboxTapped(_:) 메서드에서 수행합니다.
    }

    @IBAction func radioButtonTapped(_ sender: UIButton) {
        
        // 라디오 버튼를 누를 때 foodCost 값을 업데이트
        if sender == MsizeRadioBtn {
            cellData.selectedItem = "M"
            cellData.price = "20,000원"
        } else if sender == LsizeRadioBtn {
            cellData.selectedItem = "L"
            cellData.price = "23,000원"
        }
        
        print("cartViewController: \(cartViewController)")
        cartViewController?.transferData(price: cellData.price, selectedItem: cellData.selectedItem)

        if sender == selectedRadioButton {
            // 이미 선택된 라디오 버튼을 누르면 아무 것도 하지 않습니다.
            return
        }

        // 선택된 라디오 버튼을 업데이트하고 이전에 선택된 라디오 버튼을 해제합니다.
        selectedRadioButton?.isSelected = false
        sender.isSelected = true
        selectedRadioButton = sender

        // 라디오 버튼 이미지 설정
        MsizeRadioBtn.setImage(UIImage(named: "radioBtn"), for: .normal)
        LsizeRadioBtn.setImage(UIImage(named: "radioBtn"), for: .normal)
        
        // 선택된 라디오 버튼 이미지 설정
        sender.setImage(UIImage(named: "checkedRadioBtn"), for: .normal)
        sender.tintColor = .white // 클릭 시 변경될 배경색
    }
}
