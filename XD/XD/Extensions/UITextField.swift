//
//  UITextField.swift
//  XD
//
//  Created by 장서영 on 2022/03/28.
//

import Foundation
import UIKit

extension UITextField {
    func underLine() {
        let border = CALayer()
        border.frame = CGRect(x: 0, y: self.frame.size.height+5, width: self.frame.width, height: 1)
        border.borderWidth = 1
        border.borderColor = R.color.underLine()?.cgColor
        self.layer.addSublayer(border)
        self.adjustsFontSizeToFitWidth = true
    }
}
