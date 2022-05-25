//
//  SearchViewController.swift
//  XD
//
//  Created by 장서영 on 2022/04/25.
//

import UIKit
import SnapKit

class SearchViewController: UIViewController {
    
    private let searchTableView = UITableView().then {
        $0.backgroundColor = .clear
        $0.separatorStyle = .none
        $0.register(SearchListTableViewCell.self, forCellReuseIdentifier: "searchCell")
        $0.rowHeight = 150
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchTableView.delegate = self
        searchTableView.dataSource = self
        setUpSubViews()
    }
    
    private func setUpSubViews() {
        view.addSubview(searchTableView)
        
        searchTableView.snp.makeConstraints {
            $0.width.height.equalToSuperview()
        }
    }
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "searchCell", for: indexPath) as? SearchListTableViewCell else { return UITableViewCell() }
        
        cell.bind(
            name: "우아한 형제들",
            job: "마케팅/IT",
            location: "서울 강남구 역삼동",
            field: "프론트엔드 분야",
            questionCount: "질문 10개",
            score: "3.9"
        )
        
        return cell
    }
}
