//
//  BeverageTableViewCell.swift
//  BeaminDelivery
//
//  Created by 임수진 on 2023/11/01.
//

// CategoryTableViewCell.swift
import UIKit

class CategoryTableViewCell: UITableViewCell {
    var items: [ItemInfo] = []
    
    @IBOutlet weak var categoryTitle: UILabel!
    @IBOutlet weak var quantityLimit: UILabel!
    @IBOutlet weak var itemTableView: UITableView!
    
    func configure(withCategory category: Category) {
        categoryTitle.text = category.title
        quantityLimit.text = category.quantityLimit
        // 아이템 목록을 업데이트
        items = category.items
        itemTableView.reloadData()
        itemTableView.dataSource = self
        itemTableView.reloadData()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        itemTableView?.delegate = self
        itemTableView?.dataSource = self
        itemTableView?.separatorStyle = .none
        let ItemNib = UINib(nibName: "ItemTableViewCell", bundle: nil)
        itemTableView?.register(ItemNib, forCellReuseIdentifier: "ItemTableViewCell")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func addItem(_ itemName: String, itemPrice: String) {
        let newItem = ItemInfo(name: itemName, price: itemPrice)
        items.append(newItem)
        itemTableView.reloadData()
    }
}

extension CategoryTableViewCell: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count // 아이템 수에 따라 행 수를 반환
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemTableViewCell", for: indexPath) as! ItemTableViewCell
        
        // 아이템을 해당 셀에 표시
        let item = items[indexPath.row]
        cell.configure(withItem: item)
        
        return cell
    }
}
