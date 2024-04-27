//
//  SearchDetailModalController.swift
//  Netfilx
//
//  Created by yewoni on 4/13/24.
//

import UIKit

class SearchDetailModalController: UIViewController {

    var selectedTitle: String?
    var selectedImageName: String?
    var selectedMovieYear: Int?
    var selectedMovieDescription: String?
    var selectedEpisodeList: [String]?
    var selectedEpisodeDescription: [String]?

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
        
        setTableViewUI()
    }
    
    // tableView 설정 함수
    func setTableViewUI() {
        view.addSubview(tableViewUI)
            
        // tableViewUI cell 등록하기 - SearchDetailTableViewCell, EpisodeTableViewCell
        tableViewUI.register(SearchDetailTableViewCell.self, forCellReuseIdentifier: "SearchDetailTableViewCell")
        tableViewUI.register(EpisodeTableViewCell.self, forCellReuseIdentifier: "EpisodeTableViewCell")
        
        // tableViewUI constraint 설정
        NSLayoutConstraint.activate([
            tableViewUI.topAnchor.constraint(equalTo: view.topAnchor),
            tableViewUI.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableViewUI.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableViewUI.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }    
}

extension SearchDetailModalController: UITableViewDelegate, UITableViewDataSource {
    // 섹션 개수 설정
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    // 섹션 내 cell 개수 설정
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        // section 1은 EpisodeList 보여주는 section이므로, Episode 개수 만큼 cell 생성
        return selectedEpisodeList!.count
        
    }
    
    // cell 설정
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // section 0 : SearchDetailTableViewCell 사용
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "SearchDetailTableViewCell", for: indexPath) as? SearchDetailTableViewCell else {
                return UITableViewCell()
            }
            
            cell.backgroundColor = UIColor(red: 66/255, green: 66/255, blue: 66/255, alpha: 1.0)
            
            // cell movie iitle 설정
            cell.title_label.text = selectedTitle ?? ""
            cell.title_label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
            
            // cell movie image 설정
            cell.movie_image.image = UIImage(named: selectedImageName ?? "")
            
            // cell movie year 설정
            cell.year_label.text = String(selectedMovieYear ?? 2024)
            
            // cell movie description 설정
            cell.description_label.text = selectedMovieDescription ?? ""
            cell.description_label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
            
            return cell
            
        }
        // section 1 : EpisodeTableViewCell 사용
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "EpisodeTableViewCell", for: indexPath) as? EpisodeTableViewCell else {
            return UITableViewCell()
        }
        // episode_image는 video-player로 통일
        cell.episode_image.image = UIImage(named: "video-player")
        
        // indexPath.row에 맞는 Episode title로 cell 만들기
        if let episodes = selectedEpisodeList {
            // index 번호 앞에 붙인 string을 넘기기
            cell.episode_title.text = String(indexPath.row + 1) + ". " + episodes[indexPath.row]
        } else {
            cell.episode_title.text = "Episode"
        }
        
        // indexPath.row에 맞는 Episode description로 cell 만들기
        if let descriptions = selectedEpisodeDescription {
            cell.episode_description.text = descriptions[indexPath.row]
        } else {
            cell.episode_description.text = "Episode description~"
        }
                
        return cell
                    
    }
    
    // cell 높이 설정
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 600.0
        }
        return 150.0
    }
    
    // 각 섹션의 헤더 높이 설정
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.0
    }
        
    // 섹션 헤더 설정
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
                
        return headerView
    }
}

