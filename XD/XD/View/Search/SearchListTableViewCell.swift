//
//  SearchListTableViewCell.swift
//  XD
//
//  Created by 장서영 on 2022/05/03.
//

import UIKit
import Then
import SnapKit

class SearchListTableViewCell: UITableViewCell {
    
    static let identifier = "reviewcell"
    
    let cellBackgroundView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 10
        $0.layer.shadowColor = UIColor.lightGray.cgColor
        $0.layer.shadowOpacity = 0.2
    }
    
    let nameLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 14, weight: .bold)
        $0.textColor = .black
    }
    
    let jobLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 10, weight: .medium)
        $0.textColor = R.color.
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
