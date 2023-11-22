//
//  ItemInfo.swift
//  BeaminDelivery
//
//  Created by 임수진 on 2023/11/01.
//

import Foundation
import UIKit

struct ItemInfo {
    let name: String
    let price: String
}

struct Category {
    let title: String
    let quantityLimit: String
    var items: [ItemInfo]
}

// 선택된 항목
struct UserSelection {
    var selectedCategoryTitle: String?
    var selectedItemInfo: ItemInfo?
}

// 카테고리: 도우
let doughCategory = Category(title: "도우변경", quantityLimit: "최대 1개 선택", items: [
    ItemInfo(name: "크림리치골드 크러스트", price: "+4,500원"),
    ItemInfo(name: "리치골드 크러스트", price: "+4,500원"),
    ItemInfo(name: "골드크러스트", price: "+4,500원"),
    ItemInfo(name: "고구마크러스트", price: "+3,500원"),
    ItemInfo(name: "치즈크러스트", price: "+3,500원"),
    ItemInfo(name: "체다크러스트", price: "+3,000원"),
    ItemInfo(name: "치즈바이트", price: "+6,000원"),
])

// 카테고리: 토핑
let toppingCategory = Category(title: "토핑추가", quantityLimit: "최대 5개 선택", items: [
    ItemInfo(name: "옥수수(30g)추가", price: "+700원"),
    ItemInfo(name: "버섯(25g)추가", price: "+700원"),
    ItemInfo(name: "스모크햄(30g)추가", price: "+700원"),
    ItemInfo(name: "양파(25g)추가", price: "+700원"),
    ItemInfo(name: "할라피뇨(30g)추가", price: "+700원"),
    ItemInfo(name: "피망(10g)추가", price: "+700원"),
    ItemInfo(name: "올리브(30g)추가", price: "+700원"),
    ItemInfo(name: "파인애플(60g)추가", price: "+1,000원"),
    ItemInfo(name: "포테이토(50g)추가", price: "+1,000원"),
    ItemInfo(name: "고구마무스(50g)추가", price: "+1,000원"),
    ItemInfo(name: "페퍼로니(12조각)추가", price: "+1,500원"),
    ItemInfo(name: "치즈(50g)추가", price: "+2,000원"),
    ItemInfo(name: "베이컨(12조각)추가", price: "+2,500원"),
    ItemInfo(name: "바싹불고기(70g)추가", price: "+3,000원"),
    ItemInfo(name: "소불고기(70g)추가", price: "+3,000원"),
    ItemInfo(name: "반만 매운맛추가", price: "+1,000원"),
    ItemInfo(name: "전체 매운맛추가", price: "+2,000원"),
    ItemInfo(name: "옥수수 추가", price: "+1,500원"),
    ItemInfo(name: "버섯 추가", price: "+1,500원"),
    ItemInfo(name: "스모크햄 추가", price: "+1,500원"),
    ItemInfo(name: "양파 추가", price: "+1,500원"),
    ItemInfo(name: "할라피뇨 추가", price: "+1,500원"),
    ItemInfo(name: "피망 추가", price: "+1,500원"),
    ItemInfo(name: "올리브 추가", price: "+1,500원"),
    ItemInfo(name: "파인애플 추가", price: "+1,500원"),
    ItemInfo(name: "포테이토 추가", price: "+2,000원"),
    ItemInfo(name: "고구마무스 추가", price: "+2,000원"),
    ItemInfo(name: "페퍼로니 추가", price: "+2,000원"),
    ItemInfo(name: "소불고기 추가", price: "+2,000원"),
    ItemInfo(name: "베이컨 추가", price: "+2,000원"),
    ItemInfo(name: "바싹불고기 추가", price: "+3,000원"),
    ItemInfo(name: "치즈 추가", price: "+3,000원"),
])

// 카테고리: 소스
let sourceCategory = Category(title: "소스추가", quantityLimit: "최대 5개 선택", items: [
    ItemInfo(name: "수제갈릭소스", price: "+600원"),
    ItemInfo(name: "오이피클", price: "+500원"),
    ItemInfo(name: "핫소스", price: "+100원"),
    ItemInfo(name: "생와사비", price: "+300원"),
    ItemInfo(name: "치즈가루", price: "+200원"),
    ItemInfo(name: "갈릭디핑소스", price: "+300원"),
    ItemInfo(name: "할라피뇨(용기)", price: "+700원"),
    ItemInfo(name: "매운맛소스(용기)", price: "+1,000원"),
    ItemInfo(name: "꿀", price: "+1,000원"),
    
])

// 카테고리: 음료
let beverageCategory = Category(title: "음료추가", quantityLimit: "최대 3개 선택", items: [
    ItemInfo(name: "콜라 500ml 추가", price: "+1,500원"),
    ItemInfo(name: "콜라 1.25L 추가", price: "+2,500원"),
    ItemInfo(name: "스프라이트 500ml 추가", price: "+1,500원"),
    ItemInfo(name: "스프라이트 1.5L 추가", price: "+2,500원"),
])
