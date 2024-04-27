//
//  ThirdViewController.swift
//  Netfilx
//
//  Created by yewoni on 3/30/24.
//

import UIKit


class ThirdViewController: UIViewController {
    
    // 장르 리스트
    let genre_list = ["Steamy", "Soapy", "Slow Burn", "Suspenseful", "Teen", "Mystery"]
    
    let tableViewUI: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .black
//        tableView.contentInsetAdjustmentBehavior = .never // 전체 화면 사용
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        // section 간격 없애기
        if #available(iOS 15.0, *) {
            tableView.sectionHeaderTopPadding = 0
        }
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        setNavigationBar()
        
        // tableView dataSource, delegate 생성
        tableViewUI.dataSource = self
        tableViewUI.delegate = self
        tableViewUI.separatorStyle = .none
        setTableViewUI()
        
    }
    
    // NavigationBar 설정 함수
    func setNavigationBar() {
        
        // notify 라벨
        let notify_label = UILabel()
        notify_label.text = "Notifications"
        notify_label.textColor = .white
        notify_label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        
        // notify 이미지
        let notify_image = UIImageView(image: UIImage(named: "Notify"))
        
        // (내비게이션바) 타이틀뷰
        let titleView = UIView()
        titleView.addSubview(notify_image)
        titleView.addSubview(notify_label)
        
        notify_image.translatesAutoresizingMaskIntoConstraints = false
        notify_label.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            notify_image.leadingAnchor.constraint(equalTo: titleView.leadingAnchor),
            notify_image.widthAnchor.constraint(equalToConstant: 23),
            notify_image.heightAnchor.constraint(equalToConstant: 23),
            notify_image.centerYAnchor.constraint(equalTo: titleView.centerYAnchor),
            
            notify_label.leadingAnchor.constraint(equalTo: notify_image.trailingAnchor, constant: 10),
            notify_label.centerYAnchor.constraint(equalTo: titleView.centerYAnchor),
            notify_label.trailingAnchor.constraint(equalTo: titleView.trailingAnchor)
        ])
        
        // 타이틀뷰 constraint 설정
        titleView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        titleView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        // navigationBar 타이틀뷰 설정
        navigationItem.titleView = titleView
        
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.backgroundColor = .black
        navigationBarAppearance.titlePositionAdjustment = UIOffset(horizontal: -80, vertical: 0)
        
        navigationController?.navigationBar.standardAppearance = navigationBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navigationBarAppearance
    }
    
    // TableView 설정 함수
    func setTableViewUI() {
        view.addSubview(tableViewUI)
            
        // tableViewUI cell 등록
        tableViewUI.register(ComingSoonTableViewCell.self, forCellReuseIdentifier: "ComingSoonTableViewCell")
        
        // tableViewUI constraint 설정
        NSLayoutConstraint.activate([
            tableViewUI.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            tableViewUI.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableViewUI.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableViewUI.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}

extension ThirdViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return MockData3.modeling.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MockData3.modeling[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ComingSoonTableViewCell", for: indexPath) as? ComingSoonTableViewCell else {
            return UITableViewCell()
        }
        cell.title_label.text = MockData3.modeling[indexPath.section][indexPath.row].title
        let imageName = MockData3.modeling[indexPath.section][indexPath.row].movieImage
        cell.movie_image.image = UIImage(named: imageName)
        cell.releaseDate_label.text = MockData3.modeling[indexPath.section][indexPath.row].releaseDate
        cell.description_label.text = MockData3.modeling[indexPath.section][indexPath.row].description
        // 장르는 id값만 받아와서 반복문으로 genre라는 string에 append해서 cell에 넣기
        var genre = ""
        for (index, g) in MockData3.modeling[indexPath.section][indexPath.row].genreIds.enumerated() {
            if index == 0 {
                genre.append(genre_list[g])
            }
            else {
                genre.append(" • " + genre_list[g])
            }
        }
        cell.genre_label.text = genre
        return cell
    }
    
    // cell 높이
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 400.0
    }
    
    // 헤더 높이
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 12.0
    }
        
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
    
        return headerView
    }
}
