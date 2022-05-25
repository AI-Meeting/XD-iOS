//
//  MyPageViewController.swift
//  XD
//
//  Created by 장서영 on 2022/04/25.
//

import UIKit
import SnapKit
import Then

class MyPageViewController: UIViewController {
    
    private let tableView = UITableView().then {
        $0.backgroundColor = .clear
        $0.separatorStyle = .none
        $0.register(MyPageTableViewCell.self, forCellReuseIdentifier: "myPageCell")
        $0.rowHeight = 200
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        setUpSubViews()
    }
    
    private func setUpSubViews() {
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints {
            $0.width.height.equalToSuperview()
        }
    }
}

extension MyPageViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "myPageCell", for: indexPath) as? MyPageTableViewCell else { return UITableViewCell() }
        
        cell.bind(
            name: "토스",
            job: "마케팅 / IT",
            location: "서울 강남구 역삼동",
            questionCount: "질문 10개",
            content: "생각보다 어려웠는데 뭐 할만 했던 것 같아요~~~  개발쪽보다는 기초를 많이 물어보시더라구요 기초 탄탄하게 쌓고 가시면 나쁘지 않을 것 같아요...",
            score: 3.9
        )
        
        return cell
    }
}
