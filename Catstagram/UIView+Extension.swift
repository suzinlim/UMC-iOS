//
//  UIView+Extension.swift
//  Catstagram
//
//  Created by 임수진 on 2023/09/30.
//

import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat { // 모따기
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
}
