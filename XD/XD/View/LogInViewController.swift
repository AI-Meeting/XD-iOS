//
//  ViewController.swift
//  XD
//
//  Created by 장서영 on 2022/03/23.
//

import UIKit
import SnapKit
import Then
import Rswift

class LogInViewController: UIViewController {
    
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
    
    private let loginButton = UIButton(type: .system).then {
        $0.backgroundColor = R.color.mainColor()
        $0.setTitleColor(.white, for: .normal)
        $0.setTitle("로그인", for: .normal)
        $0.titleLabel?.font = .boldSystemFont(ofSize: 14)
        $0.layer.cornerRadius = 5
    }
    
    private let signUpButton = UIButton(type: .system).then {
        let grayButtonText = NSAttributedString(string: "아직 계정이 없으신가요?", attributes: [.font: UIFont.systemFont(ofSize: 12), .foregroundColor: R.color.textColor2()! ])
        let blackButtonText = NSAttributedString(string: " 간편 가입하기", attributes: [.font: UIFont.systemFont(ofSize: 12), .foregroundColor: UIColor.black ])
        
        let buttonTitle = NSMutableAttributedString(attributedString: grayButtonText)
        buttonTitle.append(blackButtonText)
        
        $0.setAttributedTitle(buttonTitle, for: .normal)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpSubView()
        self.view.backgroundColor = .white
    }
    
    override func viewDidLayoutSubviews() {
        idTextField.underLine()
        pwTextField.underLine()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    private func setUpSubView() {
        [logo, titleLabel, idLabel, idTextField, pwLabel, pwTextField, loginButton, signUpButton].forEach({self.view.addSubview($0)})
        
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
        
        idLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(42)
            $0.leading.equalTo(idTextField.snp.leading)
        }
        
        idTextField.snp.makeConstraints {
            $0.top.equalTo(idLabel.snp.bottom).offset(10)
            $0.width.equalTo(240)
            $0.centerX.equalToSuperview()
        }
        
        pwLabel.snp.makeConstraints {
            $0.top.equalTo(idTextField.snp.bottom).offset(50)
            $0.leading.equalTo(pwTextField.snp.leading)
        }
        
        pwTextField.snp.makeConstraints {
            $0.top.equalTo(pwLabel.snp.bottom).offset(10)
            $0.width.equalTo(240)
            $0.centerX.equalToSuperview()
        }
        
        loginButton.snp.makeConstraints {
            $0.width.equalTo(240)
            $0.height.equalTo(45)
            $0.centerX.equalToSuperview()
            $0.top.equalTo(pwTextField.snp.bottom).offset(50)
        }
        
        signUpButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(loginButton.snp.bottom).offset(10)
        }
        
    }
    
}
