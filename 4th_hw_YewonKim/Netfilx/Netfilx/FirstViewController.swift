//
//  FirstViewController.swift
//  Netfilx
//
//  Created by yewoni on 3/30/24.
//
// TO-DO : MovieTableViewCell부분 - indexPath 활용을 이 Controller에서 할 수 있도록 수정할 것
// 반복문으로 여러번 CollectionView를 만들어야 함!
import UIKit


class FirstViewController: UIViewController {
    
    let section_list: [String] = ["Popular on Netfilx", "Trending Now", "Top 10 in Nigeria Today", "My List", "African Movies", "Nollywood Movies & TV"]
    
    // MARK: - 1. tableView 인스턴스 생성
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
        view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        navigationController?.isNavigationBarHidden = true
        // MARK: - 3. dataSource, delegate 생성
        tableViewUI.dataSource = self
        tableViewUI.delegate = self
        tableViewUI.separatorStyle = .none
        setUI()
    }
    
    
    func setUI(){
        view.addSubview(tableViewUI)
            
        // MARK: - 4. cell 등록하기
        tableViewUI.register(HomeTableViewCell.self, forCellReuseIdentifier: "HomeTableViewCell")
        tableViewUI.register(MovieTableViewCell.self, forCellReuseIdentifier: "MovieTableViewCell")
        tableViewUI.backgroundColor = .clear
                    
        NSLayoutConstraint.activate([            
            tableViewUI.topAnchor.constraint(equalTo: view.topAnchor),
            tableViewUI.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableViewUI.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableViewUI.bottomAnchor.constraint(equalTo: view.bottomAnchor),        
        ])
    }
}


// MARK: - 2. tableView extension 생성
extension FirstViewController: UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - TableView DataSource & Delegate Methods
    func numberOfSections(in tableView: UITableView) -> Int {
        return section_list.count + 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as? HomeTableViewCell else {
                return UITableViewCell()
            }
            
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "MovieTableViewCell", for: indexPath) as? MovieTableViewCell else {
                return UITableViewCell()
            }
//            for i in 0..<indexPath.section {
//                cell.getSectionNumber(sectionNum: indexPath.section, rowNum: indexPath.row)
//            }
            switch indexPath.section {
            case 0 :
                cell.getSectionNumber(number: indexPath.section)
            case 1:
                cell.getSectionNumber(number: indexPath.section)
            case 2:
                cell.getSectionNumber(number: indexPath.section)
            case 3:
                cell.getSectionNumber(number: indexPath.section)
            case 4:
                cell.getSectionNumber(number: indexPath.section)
            case 5:
                cell.getSectionNumber(number: indexPath.section)
            case 6:
                cell.getSectionNumber(number: indexPath.section)
            default:
                cell.getSectionNumber(number: indexPath.section)
            }
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 580.0
        } else{
            return 150.0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 0.0
        } else {
            return 50.0
        }
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        if section == 0 { // 아무것도 없는 headerView return하기
            return headerView
        } else {
            let headerTitle = UILabel()
            headerTitle.translatesAutoresizingMaskIntoConstraints = false
            headerTitle.text = "\(section_list[section-1])"
            headerTitle.font = UIFont.systemFont(ofSize: 20, weight: .bold)
            headerTitle.textColor = .white
            
            headerView.addSubview(headerTitle)
            
            NSLayoutConstraint.activate([
                headerTitle.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 0),
                headerTitle.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 8),
                headerTitle.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -8),
                headerTitle.heightAnchor.constraint(equalToConstant: 50),
            ])
            return headerView
        }
    }
}

//let movieCell = MovieTableViewCell()
//
//movieCell.collectionView.delegate = self
