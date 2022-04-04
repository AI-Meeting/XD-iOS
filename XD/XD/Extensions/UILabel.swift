//
//  UILabel.swift
//  XD
//
//  Created by 장서영 on 2022/04/04.
//

import UIKit

extension UILabel {
    
    // WriteReviewController Label Style
    func basicLabelStyle() {
        self.font = .systemFont(ofSize: 14, weight: .medium)
        self.textColor = .black
    }
    
    // WriteReviewController Level Label Style
    func levelLabelStyle() {
        self.font = .systemFont(ofSize: 14, weight: .medium)
        self.textColor = R.color.textColor2()
    }
}
