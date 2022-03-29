//
//  SignUpViewController.swift
//  XD
//
//  Created by 장서영 on 2022/03/28.
//

import UIKit

class SignUpViewController: UIViewController {
    
    private let logo = UIImageView().then {
        $0.image = R.image.logo()
    }
    
    private let titleLabel = UILabel().then {
        $0.text = "면접을 쉽고 간편하게, \n당신만을 위한 XD"
        $0.numberOfLines = 0
        $0.font = .boldSystemFont(ofSize: 24)
        let attrString = NSMutableAttributedString(string: $0.text!)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 7
        attrString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: attrString.length))
        $0.attributedText = attrString
    }
    
    private let nameLabel = UILabel().then {
        $0.text = "이름"
        $0.font = .boldSystemFont(ofSize: 14)
        $0.textColor = R.color.textColor1()
    }
    
    private let nameTextField = UITextField().then {
        $0.placeholder = "이름을 입력해주세요"
        $0.font = .systemFont(ofSize: 12)
        $0.textColor = R.color.textColor2()
    }
    
    private let idLabel = UILabel().then {
        $0.text = "아이디"
        $0.font = .boldSystemFont(ofSize: 14)
        $0.textColor = R.color.textColor1()
    }
    
    private let idTextField = UITextField().then {
        $0.placeholder = "아이디를 입력해주세요"
        $0.font = .systemFont(ofSize: 12)
        $0.textColor = R.color.textColor2()
    }
    
    private let pwLabel = UILabel().then {
        $0.text = "비밀번호"
        $0.font = .boldSystemFont(ofSize: 14)
        $0.textColor = R.color.textColor1()
    }
    
    private let pwTextField = UITextField().then {
        $0.placeholder = "비밀번호를 입력해주세요"
        $0.font = .systemFont(ofSize: 12)
        $0.textColor = R.color.textColor2()
        $0.isSecureTextEntry = true
    }
    
    private let schoolLabel = UILabel().then {
        $0.text = "학교"
        $0.font = .boldSystemFont(ofSize: 14)
        $0.textColor = R.color.textColor1()
    }
    
    private let schoolTextField = UITextField().then {
        $0.placeholder = "학교를 입력해주세요"
        $0.font = .systemFont(ofSize: 12)
        $0.textColor = R.color.textColor2()
    }
    
    private let signUpButton = UIButton(type: .system).then {
        $0.backgroundColor = R.color.mainColor()
        $0.setTitle("회원가입", for: .normal)
        $0.titleLabel?.font = .boldSystemFont(ofSize: 14)
        $0.setTitleColor(.white, for: .normal)
        $0.layer.cornerRadius = 5
    }
    
    private let pushToLogInButton = UIButton(type: .system).then {
        $0.setTitle("로그인하러 가기", for: .normal)
        $0.setTitleColor(R.color.textColor2(), for: .normal)
        $0.titleLabel?.font = .boldSystemFont(ofSize: 12)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpSubView()
        self.view.backgroundColor = .white
    }
    
    override func viewDidLayoutSubviews() {
        [nameTextField, idTextField, pwTextField, schoolTextField].forEach({$0.underLine()})
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    private func setUpSubView() {
        [logo, titleLabel, nameLabel, nameTextField, idLabel, idTextField, pwLabel, pwTextField, schoolLabel, schoolTextField, signUpButton, pushToLogInButton].forEach({self.view.addSubview($0)})
        
        logo.snp.makeConstraints {
            $0.top.equalTo(143)
            $0.leading.equalTo(55)
            $0.width.equalTo(30)
            $0.height.equalTo(30)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(168)
            $0.centerX.equalToSuperview()
        }
        
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(42)
            $0.leading.equalTo(nameTextField.snp.leading)
        }
        
        nameTextField.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(10)
            $0.width.equalTo(240)
            $0.centerX.equalToSuperview()
        }
        
        idLabel.snp.makeConstraints {
            $0.top.equalTo(nameTextField.snp.bottom).offset(30)
            $0.leading.equalTo(idTextField.snp.leading)
        }
        
        idTextField.snp.makeConstraints {
            $0.top.equalTo(idLabel.snp.bottom).offset(10)
            $0.width.equalTo(240)
            $0.centerX.equalToSuperview()
        }
        
        pwLabel.snp.makeConstraints {
            $0.top.equalTo(idTextField.snp.bottom).offset(30)
            $0.leading.equalTo(pwTextField.snp.leading)
        }
        
        pwTextField.snp.makeConstraints {
            $0.top.equalTo(pwLabel.snp.bottom).offset(10)
            $0.width.equalTo(240)
            $0.centerX.equalToSuperview()
        }
        
        schoolLabel.snp.makeConstraints {
            $0.top.equalTo(pwTextField.snp.bottom).offset(30)
            $0.leading.equalTo(schoolTextField.snp.leading)
        }
        
        schoolTextField.snp.makeConstraints {
            $0.top.equalTo(schoolLabel.snp.bottom).offset(10)
            $0.width.equalTo(240)
            $0.centerX.equalToSuperview()
        }
        
        signUpButton.snp.makeConstraints {
            $0.width.equalTo(240)
            $0.height.equalTo(45)
            $0.centerX.equalToSuperview()
            $0.top.equalTo(schoolTextField.snp.bottom).offset(30)
        }
        
        pushToLogInButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(signUpButton.snp.bottom).offset(20)
            $0.width.equalTo(194)
            $0.height.equalTo(20)
        }
        
    }

}
