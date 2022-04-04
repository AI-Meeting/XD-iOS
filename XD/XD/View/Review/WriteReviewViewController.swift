//
//  WriteReviewViewController.swift
//  XD
//
//  Created by 장서영 on 2022/04/04.
//

import UIKit
import SnapKit
import Then
import DropDown
import RxSwift
import RxCocoa

class WriteReviewViewController: UIViewController {
    
    let disposedBag = DisposeBag()
    
    private let nameLabel = UILabel().then {
        $0.text = "회사명"
    }
    
    private let nameTextField = UITextField().then {
        $0.placeholder = "회사명을 입력해주세요."
    }
    
    private let locationLabel = UILabel().then {
        $0.text = "회사 위치"
    }
    
    private let locationButton = UIButton(type: .system).then {
        $0.setTitle("   도로명주소를 입력해주세요.", for: .normal)
        $0.setTitleColor(.systemGray3, for: .normal)
        $0.contentHorizontalAlignment = .left
        $0.titleLabel?.font = .systemFont(ofSize: 12)
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 10
    }
    
    private let jobLabel = UILabel().then {
        $0.text = "회사 분야"
    }
    
    private let jobTextField = UITextField().then {
        $0.placeholder = "ex) IT/마케팅/이커머스"
    }
    
    private let fieldLabel = UILabel().then {
        $0.text = "면접 분야"
    }
    
    private let fieldDropDownButton = UIButton().then {
        $0.setTitle("여기에 드롭다운", for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 12)
        $0.titleLabel?.textColor = .lightGray
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 10
    }
    
    private let levelLabel = UILabel().then {
        $0.text = "면접 난이도"
    }
    
    private let starImage = UIImageView().then {
        $0.image = UIImage(systemName: "star.fill")
        $0.tintColor = .systemYellow
    }
    
    private let scoreLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 18, weight: .medium)
        $0.textColor = R.color.textColor2()
    }
    
    private let easyLevelLabel = UILabel().then {
        $0.text = "쉬움"
    }
    
    private let normalLevelLabel = UILabel().then {
        $0.text = "보통"
    }

    private let hardLevelLabel = UILabel().then {
        $0.text = "어려움"
    }
    
    private let levelSlider = UISlider().then {
        $0.minimumTrackTintColor = R.color.mainColor()
        $0.maximumTrackTintColor = .white
        $0.maximumValue = 5
        $0.thumbTintColor = .white
        $0.setValue(0, animated: true)
    }
    
    private let reviewLabel = UILabel().then {
        $0.text = "면접 후기"
    }
    
    private let reviewTextView = UITextView().then {
        $0.text = "면접 후기를 한마디로 입력해주세요."
        $0.layer.cornerRadius = 10
    }
    
    private let questionLabel = UILabel().then {
        $0.text = "면접 질문"
    }
    
    private let questionDescriptionLabel = UILabel().then {
        $0.text = "면접 질문은 최대한 자연스럽게 입력해주세요."
        $0.font = .systemFont(ofSize: 10)
    }
    
    private let addQuestionButton = UIButton(type: .system).then {
        $0.setImage(R.image.questionButton(), for: .normal)
        $0.tintColor = .systemGreen
    }
    
    private let questionTextField = UITextField()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = R.color.writeReviewBackgroundColor()
        setUpSubView()
        getScore()
    }
    
    private func getScore() {
        levelSlider.rx.value.subscribe(onNext: {
            self.scoreLabel.text = String(format: "%.1f", $0)
        }).disposed(by: disposedBag)
    }
    
    private func setUpSubView() {
        [nameLabel, locationLabel, jobLabel, fieldLabel, levelLabel, reviewLabel, questionLabel].forEach({$0.basicLabelStyle()})
        
        [nameTextField, jobTextField, questionTextField].forEach({$0.basicTextFieldStyle()})
        
        [easyLevelLabel, normalLevelLabel, hardLevelLabel].forEach({$0.levelLabelStyle()})
        
        [
            nameLabel, nameTextField,
            locationLabel, locationButton,
            jobLabel, jobTextField,
            fieldLabel, fieldDropDownButton,
            levelLabel, scoreLabel, starImage,
            easyLevelLabel, normalLevelLabel, hardLevelLabel,
            levelSlider,
            reviewLabel, reviewTextView,
            questionLabel, questionDescriptionLabel,
            addQuestionButton, questionTextField
        ].forEach({self.view.addSubview($0)})
        
        nameLabel.snp.makeConstraints {
            $0.leading.equalTo(21)
            $0.top.equalTo(78)
        }
        
        nameTextField.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(12)
            $0.width.equalTo(333)
            $0.height.equalTo(30)
            $0.centerX.equalToSuperview()
        }
        
        locationLabel.snp.makeConstraints {
            $0.leading.equalTo(nameTextField.snp.leading)
            $0.top.equalTo(nameTextField.snp.bottom).offset(25)
        }
        
        locationButton.snp.makeConstraints {
            $0.top.equalTo(locationLabel.snp.bottom).offset(12)
            $0.width.equalTo(333)
            $0.height.equalTo(30)
            $0.centerX.equalToSuperview()
        }
        
        jobLabel.snp.makeConstraints {
            $0.top.equalTo(locationButton.snp.bottom).offset(25)
            $0.leading.equalTo(locationButton.snp.leading)
            $0.trailing.equalTo(fieldLabel.snp.leading).offset(-9)
        }
        
        jobTextField.snp.makeConstraints {
            $0.top.equalTo(jobLabel.snp.bottom).offset(12)
            $0.leading.equalTo(jobLabel.snp.leading)
            $0.width.equalTo(162)
            $0.height.equalTo(30)
        }
        
        fieldLabel.snp.makeConstraints {
            $0.top.equalTo(jobLabel.snp.top)
            $0.leading.equalTo(fieldDropDownButton.snp.leading)
            $0.trailing.equalTo(-21)
        }
        
        fieldDropDownButton.snp.makeConstraints {
            $0.top.equalTo(fieldLabel.snp.bottom).offset(12)
            $0.trailing.equalTo(fieldLabel.snp.trailing)
            $0.width.equalTo(162)
            $0.height.equalTo(30)
        }
        
        levelLabel.snp.makeConstraints {
            $0.top.equalTo(jobTextField.snp.bottom).offset(25)
            $0.leading.equalTo(jobTextField.snp.leading)
        }
        
        starImage.snp.makeConstraints {
            $0.top.equalTo(levelLabel.snp.bottom).offset(10)
            $0.width.height.equalTo(20)
            $0.trailing.equalTo(scoreLabel.snp.leading).offset(-5)
        }
        
        scoreLabel.snp.makeConstraints {
            $0.top.equalTo(starImage.snp.top)
            $0.centerX.equalToSuperview()
        }
        
        easyLevelLabel.snp.makeConstraints {
            $0.top.equalTo(scoreLabel.snp.bottom).offset(2)
            $0.leading.equalTo(58)
        }
        
        normalLevelLabel.snp.makeConstraints {
            $0.top.equalTo(scoreLabel.snp.bottom).offset(2)
            $0.centerX.equalToSuperview()
        }
        
        hardLevelLabel.snp.makeConstraints {
            $0.top.equalTo(scoreLabel.snp.bottom).offset(2)
            $0.trailing.equalTo(-58)
        }
        
        levelSlider.snp.makeConstraints {
            $0.top.equalTo(normalLevelLabel.snp.bottom).offset(5)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(260)
        }
        
        reviewLabel.snp.makeConstraints {
            $0.top.equalTo(levelSlider.snp.bottom).offset(25)
            $0.leading.equalTo(levelLabel.snp.leading)
        }
        
        reviewTextView.snp.makeConstraints {
            $0.top.equalTo(reviewLabel.snp.bottom).offset(12)
            $0.leading.equalTo(reviewLabel.snp.leading)
            $0.width.equalTo(333)
            $0.height.equalTo(60)
        }
        
        questionLabel.snp.makeConstraints {
            $0.top.equalTo(reviewTextView.snp.bottom).offset(25)
            $0.leading.equalTo(reviewLabel.snp.leading)
        }
        
        questionDescriptionLabel.snp.makeConstraints {
            $0.centerY.equalTo(questionLabel.snp.centerY)
            $0.leading.equalTo(questionLabel.snp.trailing).offset(5)
        }
        
        addQuestionButton.snp.makeConstraints {
            $0.width.height.equalTo(25)
            $0.trailing.equalTo(-25)
            $0.centerY.equalTo(questionLabel.snp.centerY)
        }
        
        questionTextField.snp.makeConstraints {
            $0.top.equalTo(questionLabel.snp.bottom).offset(12)
            $0.width.equalTo(333)
            $0.height.equalTo(30)
            $0.centerX.equalToSuperview()
        }
        
    }
}
