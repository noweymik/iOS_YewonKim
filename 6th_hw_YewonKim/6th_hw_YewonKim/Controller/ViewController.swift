//
//  ViewController.swift
//  6th_hw_YewonKim
//
//  Created by yewoni on 5/8/24.
//

import UIKit

class ViewController: UIViewController {
    var members: [MemberData] = []
    
    let tableViewUI: UITableView = {
        let tableView = UITableView()
        tableView.contentInsetAdjustmentBehavior = .never // 전체 화면 사용
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        tableViewUI.dataSource = self
        tableViewUI.delegate = self
        
        setUI()
        getData()
    }

    private func setUI() {
        view.addSubview(tableViewUI)
        tableViewUI.register(MemberTableViewCell.self, forCellReuseIdentifier: "MemberTableViewCell")
        NSLayoutConstraint.activate([
            tableViewUI.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableViewUI.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 14),
            tableViewUI.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -14),
            tableViewUI.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    // 서버에 저장되어 있는 데이터 불러오는 함수
    func getData() {
        if let url = URL(string: "https://pard-host.onrender.com/pard") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    print("🚨", error!)
                    return
                }
                if let JSONdata = data {
                    let dataString = String(data: JSONdata, encoding: .utf8)
                    print("✅", dataString!)
                    
                    let decoder = JSONDecoder() // initialize
                    do { 
                        // json형식으로 디코딩 하는 부분
                        let decodeData = try decoder.decode([MemberData].self, from: JSONdata)
                        self.members = decodeData
                        
                        // data를 가져온 후 다시 메인스레드에서 리로드 해야함
                        DispatchQueue.main.async {
                            self.tableViewUI.reloadData()
                        }
                    } catch let error as NSError {
                        print("🚨", error)
                    }
                }
            }
            task.resume()
        }
    }
    
    // 추가 버튼이 탭되었을 때의 동작
    @objc func addButtonTapped() {
        print("추가 버튼 tapped!")
        let addViewController = AddViewController(viewController: self)
        present(addViewController, animated: true, completion: nil)
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return members.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MemberTableViewCell", for: indexPath) as? MemberTableViewCell else {
            return UITableViewCell()
        }
        let member = members[indexPath.row]
        cell.configure(with: member)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 80.0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let member = members[indexPath.row]
        
        let detailViewController = DetailViewController()
        detailViewController.member = member
        detailViewController.viewController = self
        
        let NavigationController = UINavigationController(rootViewController: detailViewController)
        
        present(NavigationController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = .clear
        
        // "UrlSession" 레이블
        let headerTitle = UILabel()
        headerTitle.translatesAutoresizingMaskIntoConstraints = false
        headerTitle.text = "UrlSession"
        headerTitle.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        headerTitle.textColor = .black

        // "추가" 버튼
        let addButton = UIButton(type: .custom)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.setTitle("추가", for: .normal)
        addButton.setTitleColor(.blue, for: .normal)
        addButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
        
        // 헤더뷰에 타이틀 레이블과 버튼 추가
        headerView.addSubview(headerTitle)
        headerView.addSubview(addButton)

        // Constraint 설정
        NSLayoutConstraint.activate([
            headerTitle.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
            headerTitle.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 10),
            
            addButton.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
            addButton.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -8)
        ])
        return headerView
    }
}
