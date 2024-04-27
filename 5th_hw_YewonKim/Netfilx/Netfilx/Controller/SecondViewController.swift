//
//  SecondViewController.swift
//  Netfilx
//
//  Created by yewoni on 3/30/24.
//

import UIKit

class SecondViewController: UIViewController {
    
    let tableViewUI: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .black
        tableView.contentInsetAdjustmentBehavior = .never // 전체 화면 사용
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
    
        tableViewUI.dataSource = self
        tableViewUI.delegate = self
        tableViewUI.separatorStyle = .none
        setSearchBar()
        setTableViewUI()
    }
    
    // searchBar 설정 함수
    func setSearchBar() {
        let searchBar = UISearchBar()
        searchBar.placeholder = "Search for a show, movie, genre, etc."
        searchBar.searchTextField.backgroundColor = UIColor.darkGray
        searchBar.searchTextField.textColor = .white
        let microphoneImage = UIImage(systemName: "mic.fill")
        searchBar.showsBookmarkButton = true
        searchBar.setImage(microphoneImage, for: .bookmark, state: .normal)
        
        searchBar.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 44)
        navigationItem.titleView = searchBar
    }
    
    // tableView 설정 함수
    func setTableViewUI() {
        view.addSubview(tableViewUI)
            
        // tableViewUI cell 등록하기 - SearchTableViewCell
        tableViewUI.register(SearchTableViewCell.self, forCellReuseIdentifier: "SearchTableViewCell")
        
        // tableViewUI constraint 설정
        NSLayoutConstraint.activate([
            tableViewUI.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            tableViewUI.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableViewUI.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableViewUI.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}

extension SecondViewController: UITableViewDelegate, UITableViewDataSource {
    // 섹션 개수 설정
    func numberOfSections(in tableView: UITableView) -> Int {
        return MockData2.modeling.count
    }
    
    // 섹션 내 cell 개수 설정
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MockData2.modeling[section].count
    }
    
    // cell 설정
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SearchTableViewCell", for: indexPath) as? SearchTableViewCell else {
            return UITableViewCell()
        }
        
        cell.backgroundColor = UIColor(red: 66/255, green: 66/255, blue: 66/255, alpha: 1.0)
        
        // cell movieTitle 설정
        cell.movieTitle.text = MockData2.modeling[indexPath.section][indexPath.row].title
        cell.movieTitle.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        
        // cell movieImage 설정
        let imageName = MockData2.modeling[indexPath.section][indexPath.row].movieImage
        cell.movieImage.image = UIImage(named: imageName)
        
        // Play 버튼 추가
        let playButton = UIButton(type: .custom)
        playButton.setImage(UIImage(named: "play-circle"), for: .normal)
        playButton.tintColor = .white
        playButton.translatesAutoresizingMaskIntoConstraints = false
        playButton.heightAnchor.constraint(equalToConstant: 35).isActive = true
        playButton.widthAnchor.constraint(equalToConstant: 35).isActive = true
        cell.contentView.addSubview(playButton)
        
        // Play 버튼 constraint 설정
        NSLayoutConstraint.activate([
            playButton.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor, constant: -16),
            playButton.centerYAnchor.constraint(equalTo: cell.contentView.centerYAnchor)
        ])
                
        return cell
    }
    
    // cell을 선택했을 때 호출되는 메서드
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 선택된 indexPath, title, 이미지 이름, 영화 디테일 정보들(설명, 에피소드)을 SearchDetailModalController로 전달
        let selectedTitle = MockData2.modeling[indexPath.section][indexPath.row].title
        let selectedImageName = MockData2.modeling[indexPath.section][indexPath.row].movieImage
        let selectedMovieYear = MockData2.modeling[indexPath.section][indexPath.row].year
        let selectedMovieDescription = MockData2.modeling[indexPath.section][indexPath.row].movieDescription
        let selectedEpisodeList = MockData2.modeling[indexPath.section][indexPath.row].EpisodeList
        let selectedEpisodeDescription = MockData2.modeling[indexPath.section][indexPath.row].EpisodeDescription
        
        let SearchDetailModalController = SearchDetailModalController()
        SearchDetailModalController.selectedTitle = selectedTitle
        SearchDetailModalController.selectedImageName = selectedImageName
        SearchDetailModalController.selectedMovieYear = selectedMovieYear
        SearchDetailModalController.selectedMovieDescription = selectedMovieDescription
        SearchDetailModalController.selectedEpisodeList = selectedEpisodeList
        SearchDetailModalController.selectedEpisodeDescription = selectedEpisodeDescription
        
        SearchDetailModalController.modalPresentationStyle = .formSheet
        
        present(SearchDetailModalController, animated: true)
    }
    
    // cell 높이 설정
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75.0
    }
    
    // 각 섹션의 헤더 높이 설정
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 70.0
        } else {
            return 5.0  // cell 간 간격 설정
        }
    }
        
    // 섹션 헤더 설정
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        
        // 0번째 section headerView에만 Title 적기
        if section == 0 {
            let headerTitle = UILabel()
            headerTitle.translatesAutoresizingMaskIntoConstraints = false
            headerTitle.text = "Top Searches"
            headerTitle.font = UIFont.systemFont(ofSize: 30, weight: .bold)
            headerTitle.textColor = .white
            headerView.addSubview(headerTitle)
            
            NSLayoutConstraint.activate([
                headerTitle.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 0),
                headerTitle.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 8),
                headerTitle.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -8),
                headerTitle.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 0)
            ])
        }
        return headerView
    }
}
