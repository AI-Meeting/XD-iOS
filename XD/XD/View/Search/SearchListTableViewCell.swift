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
        $0.layer.shadowOpacity = 0.5
        $0.layer.shadowOffset = CGSize(width: 0, height: 0)
    }
    
    let nameLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 14, weight: .bold)
        $0.textColor = .black
    }
    
    let jobLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 10, weight: .medium)
        $0.textColor = .lightGray
    }
    
    let locationLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 10, weight: .regular)
        $0.textColor = R.color.textColor2()
    }
    
    let fieldLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 12, weight: .medium)
        $0.textColor = R.color.textColor2()
    }
    
    let questionCountLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 10, weight: .medium)
        $0.textColor = R.color.textColor2()
    }
    
    private let starImage = UIImageView().then {
        $0.image = UIImage(systemName: "star.fill")
        $0.tintColor = .systemYellow
    }
    
    let scoreLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 18, weight: .medium)
        $0.textColor = R.color.textColor2()
    }
    
    private let reviewButton = UIButton(type: .system).then {
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = R.color.button1()
        $0.titleLabel?.font = .systemFont(ofSize: 10, weight: .medium)
        $0.setTitle("면접 후기 보러 가기", for: .normal)
        $0.layer.cornerRadius = 5
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .white
        setUpSubViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been impl")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if selected {
            self.setSelected(false, animated: true)
        }
    }
    
    // MARK: - public method
    public func bind(name: String, job: String, location: String, field: String, questionCount: String, score: String) {
        nameLabel.text = name
        jobLabel.text = job
        locationLabel.text = location
        fieldLabel.text = field
        questionCountLabel.text = questionCount
        scoreLabel.text = score
    }
    
    // MARK: - private method
    
    private func setUpSubViews() {
        self.addSubview(contentView)
        self.contentView.addSubview(cellBackgroundView)
        
        [nameLabel, jobLabel, locationLabel, fieldLabel, questionCountLabel, starImage, scoreLabel, reviewButton].forEach({self.cellBackgroundView.addSubview($0)})
        
        cellBackgroundView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
            $0.width.equalTo(333)
            $0.height.equalTo(130)
        }
        
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(14)
            $0.leading.equalTo(16)
        }
        
        jobLabel.snp.makeConstraints {
            $0.leading.equalTo(nameLabel.snp.trailing).offset(2)
            $0.bottom.equalTo(nameLabel.snp.bottom)
        }
        
        locationLabel.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(2)
            $0.leading.equalTo(nameLabel.snp.leading)
        }
        
        fieldLabel.snp.makeConstraints {
            $0.top.equalTo(locationLabel.snp.bottom).offset(12)
            $0.leading.equalTo(locationLabel.snp.leading)
        }
        
        questionCountLabel.snp.makeConstraints {
            $0.bottom.equalTo(-20)
            $0.leading.equalTo(fieldLabel.snp.leading)
        }
        
        starImage.snp.makeConstraints {
            $0.trailing.equalTo(scoreLabel.snp.leading).offset(-4)
            $0.top.equalTo(18)
            $0.width.height.equalTo(20)
        }
        
        scoreLabel.snp.makeConstraints {
            $0.centerY.equalTo(starImage.snp.centerY)
            $0.trailing.equalTo(-17)
        }
        
        reviewButton.snp.makeConstraints {
            $0.centerY.equalTo(questionCountLabel.snp.centerY)
            $0.trailing.equalTo(-17)
            $0.width.equalTo(122)
            $0.height.equalTo(22)
        }
    }
}
