//
//  UITextField.swift
//  XD
//
//  Created by 장서영 on 2022/03/28.
//

import UIKit

extension UITextField {
    
    // SignUp, LoginViewController TextField UnderLine 효과
    func underLine() {
        let border = CALayer()
        border.frame = CGRect(x: 0, y: self.frame.size.height+5, width: self.frame.width, height: 1)
        border.borderWidth = 1
        border.borderColor = R.color.underLine()?.cgColor
        self.layer.addSublayer(border)
        self.adjustsFontSizeToFitWidth = true
    }
    
    // WriteReviewController TextField Style
    func basicTextFieldStyle() {
        self.font = .systemFont(ofSize: 12)
        self.backgroundColor = .white
        self.layer.cornerRadius = 10
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = ViewMode.always
    }
}
