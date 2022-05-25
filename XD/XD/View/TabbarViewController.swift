//
//  TabbarViewController.swift
//  XD
//
//  Created by 장서영 on 2022/04/25.
//

import UIKit
import SnapKit

class TabbarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tabBar.tintColor = R.color.mainColor()
        tabBar.unselectedItemTintColor = R.color.textColor2()
        tabBar.backgroundColor = .white
        tabBar.layer.cornerRadius = 10
        tabBar.layer.shadowOpacity = 0.2
        tabBar.layer.shadowColor = UIColor.lightGray.cgColor
        view.backgroundColor = .white
    }
}

extension TabbarViewController {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        let mapNavigationController = UINavigationController()
        let mapVC = MapViewController()
        mapNavigationController.addChild(mapVC)
        mapNavigationController.tabBarItem.image = UIImage(systemName: "map.fill")
        mapNavigationController.tabBarItem.title = "지도"
        
        let searchNavigationController = UINavigationController()
        let searchVC = SearchViewController()
        searchNavigationController.addChild(searchVC)
        searchNavigationController.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        searchNavigationController.tabBarItem.title = "검색"
        
        let myPageNavigationController = UINavigationController()
        let myPageVC = MyPageViewController()
        myPageNavigationController.addChild(myPageVC)
        myPageNavigationController.tabBarItem.image = UIImage(systemName: "person.fill")
        myPageNavigationController.tabBarItem.title = "마이페이지"
        
        viewControllers = [mapNavigationController, searchNavigationController, myPageNavigationController]
        self.setViewControllers(viewControllers, animated: true)
    }
}
