//
//  ViewController.swift
//  netflix-clone
//
//  Created by Sarath P on 10/01/22.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        
        let homeVC = UINavigationController(rootViewController: HomeViewController())
        let upcomingVC = UINavigationController(rootViewController: UpcomingViewController())
        let searchVC = UINavigationController(rootViewController: SearchViewController())
        let downloadsVC = UINavigationController(rootViewController: DownloadsViewController())
        
        setViewControllers([homeVC, upcomingVC, searchVC, downloadsVC], animated: true)
    }


}

