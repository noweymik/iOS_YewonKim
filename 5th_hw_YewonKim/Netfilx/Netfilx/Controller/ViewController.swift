//
//  ViewController.swift
//  Netfilx
//
//  Created by yewoni on 3/30/24.
//

import UIKit

class ViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setTabBar()
    }
    
    func setTabBar() {
        let vc1 = UINavigationController(rootViewController: FirstViewController())
        let vc2 = UINavigationController(rootViewController: SecondViewController())
        let vc3 = UINavigationController(rootViewController: ThirdViewController())
        let vc4 = UINavigationController(rootViewController: FourthViewController())
        let vc5 = UINavigationController(rootViewController: FifthViewController())
            
        self.viewControllers = [vc1, vc2, vc3, vc4, vc5]
        self.tabBar.tintColor = .white
        self.tabBar.barTintColor = .black // tapbar text나 icon 컬러
        self.tabBar.backgroundColor = UIColor(red: 18/255, green: 18/255, blue: 18/255, alpha: 1)        
        
        guard let tabBarItems = self.tabBar.items else {return}
        tabBarItems[0].image = UIImage(named: "Home")
        tabBarItems[1].image = UIImage(named: "Search")
        tabBarItems[2].image = UIImage(named: "Coming_Soon")
        tabBarItems[3].image = UIImage(named: "Downloads")
        tabBarItems[4].image = UIImage(named: "More")
        tabBarItems[0].title = "Home"
        tabBarItems[1].title = "Search"
        tabBarItems[2].title = "Coming Soon"
        tabBarItems[3].title = "Downloads"
        tabBarItems[4].title = "More"
    }
}

