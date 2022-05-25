//
//  MyPageTableViewCell.swift
//  XD
//
//  Created by 장서영 on 2022/05/21.
//

import UIKit
import SnapKit
import Then

class MyPageTableViewCell: UITableViewCell {
    
    let cellBackgroundView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 10
        $0.layer.shadowColor = UIColor.lightGray.cgColor
        $0.layer.shadowOpacity = 0.5
        $0.layer.shadowOffset = CGSize(width: 0, height: 0)
    }
    
    let nameLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 16, weight: .bold)
        $0.textColor = .black
    }
    
    let jobLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 12, weight: .medium)
        $0.textColor = .lightGray
    }
    
    let locationLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 12, weight: .regular)
        $0.textColor = R.color.textColor2()
    }
    
    let contentLabel = UILabel().then {
        $0.numberOfLines = 2
        $0.font = .systemFont(ofSize: 10, weight: .regular)
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
    
    let easyLevelLabel = UILabel().then {
        $0.text = "쉬움"
        $0.textColor = R.color.textColor2()
        $0.font = .systemFont(ofSize: 10, weight: .medium)
    }
    
    let normalLevelLabel = UILabel().then {
        $0.text = "보통"
        $0.textColor = R.color.textColor2()
        $0.font = .systemFont(ofSize: 10, weight: .medium)
    }
    
    let hardLevelLabel = UILabel().then {
        $0.text = "어려움"
        $0.textColor = R.color.textColor2()
        $0.font = .systemFont(ofSize: 10, weight: .medium)
    }
    
    private let levelSlider = UISlider().then {
        $0.minimumTrackTintColor = R.color.mainColor()
        $0.maximumTrackTintColor = .systemGray5
        $0.maximumValue = 5
        $0.setThumbImage(UIImage(), for: .normal)
        $0.layer.cornerRadius = 5
        $0.setValue(0, animated: true)
        $0.isEnabled = false
    }
    
    private let reviewButton = UIButton(type: .system).then {
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = R.color.button2()
        $0.titleLabel?.font = .systemFont(ofSize: 10, weight: .medium)
        $0.setTitle("나의 면접 보러 가기", for: .normal)
        $0.layer.cornerRadius = 5
        $0.layer.shadowColor = UIColor.lightGray.cgColor
        $0.layer.shadowOpacity = 0.5
        $0.layer.shadowOffset = CGSize(width: 0, height: 0)
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
    public func bind(name: String, job: String, location: String, questionCount: String, content: String, score: Float) {
        nameLabel.text = name
        jobLabel.text = job
        locationLabel.text = location
        questionCountLabel.text = questionCount
        contentLabel.text = content
        scoreLabel.text = "\(score)"
        levelSlider.value = score
    }
    
    // MARK: - private method
    
    private func setUpSubViews() {
        self.addSubview(contentView)
        self.contentView.addSubview(cellBackgroundView)
        
        [nameLabel, jobLabel, locationLabel, contentLabel, questionCountLabel, starImage, scoreLabel, easyLevelLabel, normalLevelLabel, hardLevelLabel, levelSlider, reviewButton].forEach({self.cellBackgroundView.addSubview($0)})
        
        cellBackgroundView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
            $0.width.equalTo(350)
            $0.height.equalTo(180)
        }
        
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(20)
            $0.leading.equalTo(21)
        }
        
        jobLabel.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(1)
            $0.leading.equalTo(nameLabel.snp.leading)
        }
        
        locationLabel.snp.makeConstraints {
            $0.centerY.equalTo(levelSlider.snp.centerY)
            $0.leading.equalTo(jobLabel.snp.leading)
        }
        
        contentLabel.snp.makeConstraints {
            $0.top.equalTo(locationLabel.snp.bottom).offset(10)
            $0.leading.equalTo(locationLabel.snp.leading)
            $0.width.equalTo(320)
            $0.height.equalTo(36)
        }
        
        questionCountLabel.snp.makeConstraints {
            $0.bottom.equalTo(-20)
            $0.leading.equalTo(locationLabel.snp.leading)
        }
        
        starImage.snp.makeConstraints {
            $0.trailing.equalTo(scoreLabel.snp.leading).offset(-5)
            $0.top.equalTo(18)
            $0.width.height.equalTo(20)
        }
        
        scoreLabel.snp.makeConstraints {
            $0.centerY.equalTo(starImage.snp.centerY)
            $0.trailing.equalTo(-62)
        }
        
        easyLevelLabel.snp.makeConstraints {
            $0.leading.equalTo(levelSlider.snp.leading)
            $0.top.equalTo(starImage.snp.bottom).offset(10)
        }
        
        normalLevelLabel.snp.makeConstraints {
            $0.centerX.equalTo(levelSlider.snp.centerX)
            $0.top.equalTo(starImage.snp.bottom).offset(10)
        }
        
        hardLevelLabel.snp.makeConstraints {
            $0.trailing.equalTo(levelSlider.snp.trailing)
            $0.top.equalTo(starImage.snp.bottom).offset(10)
        }
        
        levelSlider.snp.makeConstraints {
            $0.top.equalTo(normalLevelLabel.snp.bottom).offset(6)
            $0.trailing.equalTo(-17)
            $0.width.equalTo(150)
            $0.height.equalTo(10)
        }
        
        reviewButton.snp.makeConstraints {
            $0.centerY.equalTo(questionCountLabel.snp.centerY)
            $0.trailing.equalTo(-17)
            $0.width.equalTo(122)
            $0.height.equalTo(22)
        }
    }
}
