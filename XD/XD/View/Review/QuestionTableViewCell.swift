//
//  QuestionTableViewCell.swift
//  XD
//
//  Created by 장서영 on 2022/04/11.
//

import UIKit
import SnapKit

class QuestionTableViewCell: UITableViewCell {
    
    static let identifier = "Question"
    
    let questionTextView = UITextView().then {
        $0.basicTextViewStyle()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUpSubView()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .clear
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    private func setUpSubView() {
        self.contentView.addSubview(questionTextView)
        
        questionTextView.snp.makeConstraints {
            $0.width.equalTo(330)
            $0.height.equalTo(sizeToFit() as! ConstraintRelatableTarget)
            $0.centerY.equalTo(contentView.snp.centerY)
            $0.centerX.equalTo(contentView.snp.centerX)
        }
    }

}
